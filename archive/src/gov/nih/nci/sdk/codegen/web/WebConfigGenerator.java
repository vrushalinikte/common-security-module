/*L
 *  Copyright Ekagra Software Technologies Ltd.
 *  Copyright SAIC
 *
 *  Distributed under the OSI-approved BSD 3-Clause License.
 *  See http://ncip.github.com/common-security-module/LICENSE.txt for details.
 */

/*
 * Created on Jun 15, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package gov.nih.nci.sdk.codegen.web;

import gov.nih.nci.sdk.codegen.CodeGenUtils;
import gov.nih.nci.sdk.codegen.StringUtilities;

import java.io.File;
import java.io.FileWriter;


import org.jdom.DocType;
import org.jdom.Document;
import org.jdom.Element;

import org.jdom.output.XMLOutputter;



/**
 * @author kumarvi
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class WebConfigGenerator {
	
	private Class applicationService;
	private String sourceFolder;
	private String basePackage;
	
	public WebConfigGenerator(String sourceFolder,String basePackage,Class  applicationService){
		this.applicationService=applicationService;
		File f = new File(sourceFolder,"public_html");
		f.mkdir();
		File f2 = new File(f,"WEB-INF");
		f2.mkdir();
		this.sourceFolder=f2.getAbsolutePath();
		
		if(StringUtilities.isBlank(basePackage)){
			this.basePackage="";
		}else{
			this.basePackage=basePackage+".";
		}
	}
	
	public void generate(){
		generate_web_xml_config();
		generate_application_xml_config();
		generate_http_invoker_xml_config();
	}

	private void generate_web_xml_config(){
		Element root = new Element("web-app");
		Document webDoc = new Document(root);
		DocType dt = new DocType("web-app","-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN","http://java.sun.com/dtd/web-app_2_3.dtd");
		webDoc.setDocType(dt);
		
		Element context_param = new Element("context-param");
		Element param_name = new Element("param-name");
		param_name.setText("contextConfigLocation");
		context_param.addContent(param_name);
		
		Element param_value = new Element("param-value");
		param_value.setText("/WEB-INF/applicationContext.xml");
		context_param.addContent(param_value);
		
		root.addContent(context_param);
		
		Element s1 = new Element("servlet");
		Element s1_name = new Element("servlet-name");
		s1_name.setText("context");
		Element s1_class = new Element("servlet-class");
		s1_class.setText("org.springframework.web.context.ContextLoaderServlet");
		Element l_stp1 = new Element("load-on-startup");
		l_stp1.setText("1");
		
		s1.addContent(s1_name);
		s1.addContent(s1_class);
		s1.addContent(l_stp1);
		
		root.addContent(s1);
		
		Element s2 = new Element("servlet");
		Element s2_name = new Element("servlet-name");
		s2_name.setText("httpinvoker");
		Element s2_class = new Element("servlet-class");
		s2_class.setText("org.springframework.web.servlet.DispatcherServlet");
		Element l_stp2 = new Element("load-on-startup");
		l_stp2.setText("3");
		
		s2.addContent(s2_name);
		s2.addContent(s2_class);
		s2.addContent(l_stp2);
		
		root.addContent(s2);
		
		Element sMap = new Element("servlet-mapping");
		Element s_name = new Element("servlet-name");
		s_name.setText("httpinvoker");
		Element url_pat = new Element("url-pattern");
		url_pat.setText("/http/*");
		
		sMap.addContent(s_name);
		sMap.addContent(url_pat);
		root.addContent(sMap);
		
		
		this.outputDocumentToFile(webDoc,sourceFolder+"/"+"web.xml");
	}
	private void generate_application_xml_config(){
		Element root = new Element("beans");
		Document doc = new Document(root);
		DocType dt = new DocType("beans","-//SPRING//DTD BEAN//EN","http://www.springframework.org/dtd/spring-beans.dtd");
		doc.setDocType(dt);
		Element bns = new Element("bean");
		bns.setAttribute("id","remoteService");
		String className = "Remote"+CodeGenUtils.getPartialName(applicationService)+"Impl";
		bns.setAttribute("class",basePackage+"application.server."+className);
		root.addContent(bns);
		this.outputDocumentToFile(doc,sourceFolder+"/"+"applicationContext.xml");
	}
	private void generate_http_invoker_xml_config(){
		Element root = new Element("beans");
		Document doc = new Document(root);
		DocType dt = new DocType("beans","-//SPRING//DTD BEAN//EN","http://www.springframework.org/dtd/spring-beans.dtd");
		doc.setDocType(dt);
		Element bean = new Element("bean");
		bean.setAttribute("id","defaultHandlerMapping");
		bean.setAttribute("class","org.springframework.web.servlet.handler.BeanNameUrlHandlerMapping");
		
		root.addContent(bean);
		
		Element rBean = new Element("bean");
		rBean.setAttribute("name","/remoteService");
		rBean.setAttribute("class","org.springframework.remoting.httpinvoker.HttpInvokerServiceExporter");
		  
		    Element prop = new Element("property");
		    prop.setAttribute("name","service");
		        Element ref = new Element("ref");
		        ref.setAttribute("bean","remoteService");
		      prop.addContent(ref);
		    rBean.addContent(prop);
		    
		    Element prop2 = new Element("property");
		    prop2.setAttribute("name","serviceInterface");
		         Element val = new Element("value");
		         String className = "Remote"+CodeGenUtils.getPartialName(applicationService);
		         val.setText(basePackage+"application.common."+className);
		     prop2.addContent(val);
		    rBean.addContent(prop2);
		    
		    root.addContent(rBean);
		    
		    this.outputDocumentToFile(doc,sourceFolder+"/"+"httpinvoker-servlet.xml");
		     
	}
	private void outputDocumentToFile(Document configDoc, String xmlFile) {
        //setup this like outputDocument
        try {
            XMLOutputter outputter = new XMLOutputter("  ", true);

            //output to a file
            FileWriter writer = new FileWriter(xmlFile);
            outputter.output(configDoc, writer);
            writer.close();

        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
    }
	public static void main(String[] args) {
		
		//WebConfigGenerator wcg = new WebConfigGenerator("test.gov.nih.nci.sdk.codegen.TestApplicationService");
		//wcg.generate_http_invoker_xml_config();
	}
}
