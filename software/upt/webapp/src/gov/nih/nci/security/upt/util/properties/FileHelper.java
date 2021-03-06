/*L
 *  Copyright Ekagra Software Technologies Ltd.
 *  Copyright SAIC
 *
 *  Distributed under the OSI-approved BSD 3-Clause License.
 *  See http://ncip.github.com/common-security-module/LICENSE.txt for details.
 */

package gov.nih.nci.security.upt.util.properties;

import gov.nih.nci.security.upt.util.properties.exceptions.UPTConfigurationException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.jdom.Document;
import org.jdom.input.DOMBuilder;
import org.w3c.dom.DOMException;
import org.xml.sax.SAXException;


public class FileHelper
{
	public FileHelper()
	{
	} 

	public InputStream getFileAsStream(String fileName, ClassLoader classLoader) throws UPTConfigurationException
	{
		InputStream inputStream = classLoader.getResourceAsStream(fileName);
		if (null == inputStream)
		{
			throw new UPTConfigurationException ("Unable to load " + fileName + " file");
		}
		return inputStream;
	}

	public static URL getFileAsURL(String fileName, ClassLoader classLoader) throws UPTConfigurationException
	{
		URL url = classLoader.getResource(fileName);
		if (url == null)
		{
			throw new UPTConfigurationException ("Unable to load " + fileName + " file");
		}
		return url;
	}

	
	public InputStream getFileAsStream(String fileName) throws UPTConfigurationException
	{
		return getFileAsStream(fileName, Thread.currentThread().getContextClassLoader());
	}
	
	public static URL getFileAsURL(String fileName) throws UPTConfigurationException
	{
		return getFileAsURL(fileName, Thread.currentThread().getContextClassLoader());
	}
	

	public File getFile(String fileName) throws UPTConfigurationException
	{
		URL url = getFileAsURL(fileName);
		URI uri;
		try
		{
			uri = new URI (url.toString());
		}
		catch (URISyntaxException e)
		{
			throw new UPTConfigurationException ("Error obtaining the URI for the " + fileName + " file");
		}
		return new File(uri);
	}
	
	public Document validateXMLwithSchema(String propertiesFileName, String schemaFileName) throws UPTConfigurationException
	{
		org.w3c.dom.Document document = null;
		//InputStream schemaFileInputStream = getFileAsStream(schemaFileName);
		URL propertiesFileURL = getFileAsURL(propertiesFileName);
		
    	DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
    	documentBuilderFactory.setNamespaceAware(true);
    	documentBuilderFactory.setValidating(true);
    	documentBuilderFactory.setAttribute("http://java.sun.com/xml/jaxp/properties/schemaLanguage","http://www.w3.org/2001/XMLSchema");
    	//documentBuilderFactory.setAttribute("http://java.sun.com/xml/jaxp/properties/schemaSource", schemaFileInputStream);
    	DocumentBuilder documentBuilder = null;
		try 
		{
			documentBuilder = documentBuilderFactory.newDocumentBuilder();
		} 
		catch (ParserConfigurationException e) {
			throw new UPTConfigurationException("Error in parsing the " + propertiesFileName + " file");
		}
    	try 
    	{
			document = (org.w3c.dom.Document) documentBuilder.parse(propertiesFileURL.getPath());
		} 
    	catch (SAXException e) 
    	{
			throw new UPTConfigurationException("Error in parsing the " + propertiesFileName + " file");
        } 
    	catch(DOMException de) 
    	{
			throw new UPTConfigurationException("Error in parsing the " + propertiesFileName + " file");
        }
		catch (IOException e) 
		{
			throw new UPTConfigurationException("Error in reading the " + propertiesFileName + " file");
		}
		DOMBuilder builder = new DOMBuilder();
		org.jdom.Document jdomDocument = builder.build(document);

		return jdomDocument;
	}
	
	public Document validateXMLwithSchema(URL propertiesFileURL, String schemaFileName) throws UPTConfigurationException
	{
		org.w3c.dom.Document document = null;
		InputStream schemaFileInputStream = getFileAsStream(schemaFileName);
		
		
    	DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
    	documentBuilderFactory.setNamespaceAware(true);
    	documentBuilderFactory.setValidating(true);
    	documentBuilderFactory.setAttribute("http://java.sun.com/xml/jaxp/properties/schemaLanguage","http://www.w3.org/2001/XMLSchema");
    	documentBuilderFactory.setAttribute("http://java.sun.com/xml/jaxp/properties/schemaSource", schemaFileInputStream);
    	DocumentBuilder documentBuilder = null;
		try 
		{
			documentBuilder = documentBuilderFactory.newDocumentBuilder();
		} 
		catch (ParserConfigurationException e) {
			throw new UPTConfigurationException("Error in parsing the " + propertiesFileURL.getPath() + " file");
		}
    	try 
    	{
			document = (org.w3c.dom.Document) documentBuilder.parse(propertiesFileURL.getPath());
		} 
    	catch (SAXException e) 
    	{
			throw new UPTConfigurationException("Error in parsing the " + propertiesFileURL.getPath() + " file");
        } 
    	catch(DOMException de) 
    	{
			throw new UPTConfigurationException("Error in parsing the " + propertiesFileURL.getPath() + " file");
        }
		catch (IOException e) 
		{
			throw new UPTConfigurationException("Error in reading the " + propertiesFileURL.getPath() + " file");
		}
		DOMBuilder builder = new DOMBuilder();
		org.jdom.Document jdomDocument = builder.build(document);

		return jdomDocument;
	}
	

}