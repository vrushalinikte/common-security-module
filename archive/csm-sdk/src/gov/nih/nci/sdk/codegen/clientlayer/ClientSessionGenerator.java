/*L
 *  Copyright Ekagra Software Technologies Ltd.
 *  Copyright SAIC
 *
 *  Distributed under the OSI-approved BSD 3-Clause License.
 *  See http://ncip.github.com/common-security-module/LICENSE.txt for details.
 */

/*
 * Created on Jun 14, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package gov.nih.nci.sdk.codegen.clientlayer;

import gov.nih.nci.sdk.codegen.CodeFormatter;
import gov.nih.nci.sdk.codegen.CodeGenUtils;
import gov.nih.nci.sdk.codegen.StringUtilities;

import java.io.FileWriter;
import java.util.ArrayList;

import test.gov.nih.nci.sdk.codegen.TestApplicationService;

/**
 * @author kumarvi
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ClientSessionGenerator {
	public Class applicationService;
	private String basePackage;
	private String parentPackage;
	private String classPackage = "application.client";
	private String sourceDirName = null;
	
	
	public ClientSessionGenerator(String sourceDirName,String basePackage,Class applicationService){
		this.applicationService= applicationService;
		this.sourceDirName=sourceDirName;
		if(StringUtilities.isBlank(basePackage)){
			this.basePackage=classPackage;
		}else{
			parentPackage = basePackage+".";
			this.basePackage= basePackage+"."+classPackage;
		}
	}
	public void generate(){
		String remoteApplicationServiceName = "Remote"+CodeGenUtils.getPartialName(applicationService);
		String sourceClassName = "ClientSession";
		FileWriter sourceFileWriter = CodeGenUtils.getSourceFileWriter(sourceDirName,basePackage,sourceClassName);
		
		StringBuffer stbr = new StringBuffer();
		StringBuffer code = new StringBuffer();
		
		CodeGenUtils.addPackageStatement(code,basePackage);
		
		CodeFormatter.newLine(code);
		
		ArrayList impStmts = new ArrayList();
		impStmts.add("import "+parentPackage+"application.common."+remoteApplicationServiceName+";\n");
		impStmts.add("import "+"org.springframework.context.ApplicationContext"+";\n");
		impStmts.add("import "+"org.springframework.context.support.ClassPathXmlApplicationContext"+";\n");
		impStmts.add("import gov.nih.nci.sdk.common.*;\n");
		CodeGenUtils.addImportStatements(code,impStmts);
		
		CodeFormatter.addLines(code,2);
		code.append("public class ClientSession");
		CodeFormatter.openClassBody(code);
		CodeFormatter.addLines(code,2);
		this.addMembers(code);
		code.append("     private ").append(remoteApplicationServiceName).append(" ").append("remoteService;\n");
		CodeFormatter.addLines(code,2);
		this.addGeneralMethods(code);
		
		/**
		 * Add RemoteService Accessor Method
		 */
		CodeFormatter.newLine(code);
		CodeFormatter.addSpaces(code,2);
		code.append("private "+"Remote"+CodeGenUtils.getPartialName(applicationService)+" getRemoteServiceFromClassPath()");
		CodeFormatter.startMethod(code);
		code.append("ApplicationContext ctx = new ClassPathXmlApplicationContext(\"");
		code.append("remoteService.xml");
		code.append("\")");
		code.append(";");
        CodeFormatter.newLine(code);
        CodeFormatter.addTabs(code,1);
        code.append("Remote"+CodeGenUtils.getPartialName(applicationService));
        code.append(" rs = ");
		code.append("("+"Remote"+CodeGenUtils.getPartialName(applicationService)+")");
        code.append("ctx.getBean(\"remoteService\");");
        CodeFormatter.newLine(code);
        CodeFormatter.addTabs(code,1);
        code.append("return rs;");
        CodeFormatter.newLine(code);
		CodeFormatter.endMethod(code);
		CodeFormatter.closeClassBody(code);
		try{
			sourceFileWriter.write(code.toString());
			sourceFileWriter.flush();
		}catch(Exception  ex){
			ex.printStackTrace();
		}
	}
	
	private void addMembers(StringBuffer code){
		code.append("     private static ClientSession instance;\n");
		code.append("	 private  String sessionKey;\n");
		code.append("	 private String sessionInitializedFrom;\n");
	}
	private void addGeneralMethods(StringBuffer code){
		code.append("	 public static synchronized ClientSession getInstance(){\n");
		code.append("		if(instance==null){\n");
		code.append("		  instance= new ClientSession();\n");
		code.append("		}\n");
		code.append("		\n");
		code.append("		return instance;\n");
		code.append("	  }\n");
		code.append("\n");
		code.append("	 private ClientSession(){\n");
		code.append("	 	remoteService = getRemoteServiceFromClassPath();\n");
		code.append("	 }\n");
		code.append("\n");	 
		code.append("	 public boolean startSession(String userId,String password) throws ApplicationException{\n");
		code.append("	 	boolean authenticated = false;\n");
		code.append("	  	  String sessionKey_from_server = null;\n");

		code.append("	  	  try{\n");
		code.append("	  	  sessionKey_from_server = remoteService.authenticate(userId,password);\n");
		code.append("	  	   if(sessionKey_from_server!=null){\n");
		code.append("	  	   	authenticated = true;\n");
		code.append("	  	   		sessionKey=sessionKey_from_server;\n");
		code.append("	  	   	  	\n");
		code.append("	  	   }\n");
		code.append("	  	  }catch(Exception ex){\n");
		code.append("	  	  authenticated = false;\n");
		code.append("             throw new ApplicationException(\"Could not authenticate the credentials\");\n");
		code.append("	  	  }\n");
		code.append("	  	 return authenticated;\n");
			 	
		code.append("	 }\n");
		code.append("\n");
		code.append("	 public void terminateSession(){\n");
		code.append("	  	\n");
		code.append("	  	remoteService.logOut(sessionKey);\n");
		code.append("	  }\n");
		code.append("\n");
		code.append("	 public String getSessionKey(){\n");
		code.append("	 	return sessionKey;\n");
		code.append("	 }\n");
	}
	public static void main(String[] args) {
		
		ClientSessionGenerator acc = new ClientSessionGenerator("c:/temp/vinay","gov.nih.nci",TestApplicationService.class);
		acc.generate();
	}
}
