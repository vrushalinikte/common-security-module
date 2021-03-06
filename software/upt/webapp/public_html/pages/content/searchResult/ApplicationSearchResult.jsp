<%--L
   Copyright Ekagra Software Technologies Ltd.
   Copyright SAIC

   Distributed under the OSI-approved BSD 3-Clause License.
   See http://ncip.github.com/common-security-module/LICENSE.txt for details.
L--%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles"
	prefix="tiles"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template"
	prefix="template"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested"
	prefix="nested"%>
<%@ taglib uri="/WEB-INF/Owasp.CsrfGuard.tld" prefix="csrf" %>

<%@ page import="gov.nih.nci.security.upt.constants.*"%>
<%@ page import="gov.nih.nci.security.authorization.domainobjects.*"%>
<script>
<!--
	function setAndSubmit(target)
	{
		document.ApplicationForm.operation.value=target;
		document.ApplicationForm.submit();
	}
	
function skipNavigation()
{
	document.getElementById("appResult").focus();
	window.location.hash="appResult";
	document.getElementById("ncilink").tabIndex = -1;
	document.getElementById("nihlink").tabIndex = -1;
	document.getElementById("skipmenu").tabIndex = -1;
	
	if(document.getElementById("homeLink"))
		document.getElementById("homeLink").tabIndex = -1;
	if(document.getElementById("adminhomeLink"))
		document.getElementById("adminhomeLink").tabIndex = -1;
		
	document.getElementById("saHome").tabIndex = -1;
	document.getElementById("saApp").tabIndex = -1;
	document.getElementById("saUser").tabIndex = -1;
	document.getElementById("saPriv").tabIndex = -1;
	document.getElementById("saLogout").tabIndex = -1;
}
	
// -->
</script>


	<table cellpadding="0" cellspacing="0" border="0"
		class="contentPage" width="100%" height="100%">
		<html:form styleId="ApplicationForm"
	action="/ApplicationDBOperation">
	<html:hidden property="operation" value="read" />
	<input type="hidden" name="<csrf:token-name/>" value="<csrf:token-value uri='/ApplicationDBOperation'/>"/>
	
		<tr>
			<td>
			<h2><a id="appResult"></a>Application</h2>
			</td>
		</tr>
		<tr>
			<td valign="top">
			<table cellpadding="0" cellspacing="0" border="0"
				width="100%" class="contentBegins">
				<tr>
					<td>
					<table cellpadding="0" cellspacing="0" border="0"
						width="100%">
						<tr>
							<td class="dataTablePrimaryLabel" height="20">SEARCH RESULTS</td>
						</tr>
						<logic:present name="<%=DisplayConstants.SEARCH_RESULT%>">
							<bean:define name="<%=DisplayConstants.SEARCH_RESULT%>"
								property="searchResultObjects" id="searchResultObjects" />
							<bean:define id="oddRow" value="true" />
							<tr>
								<td>
								<table summary="Search results for Application search" cellpadding="3"
									cellspacing="0" border="0" class="dataTable" width="100%">
									<tr>
										<th class="dataTableHeader" scope="col" align="center"
											width="9%">Select</th>
										<th class="dataTableHeader" scope="col" align="center"
											width="33%">Application Name</th>
										<th class="dataTableHeader" scope="col" align="center"
											colspan="3" width="58%">Application Description</th>
									</tr>
									<logic:iterate name="searchResultObjects"
										id="searchResultObject" type="Application">
										<%if (oddRow.equals("true")) { oddRow = "false";%>
											<tr class="dataRowLight">
												<td class="dataCellNumerical" width="9%"><html:radio
													style="formFieldSized" property="applicationId"
													value="<%=searchResultObject.getApplicationId().toString()%>" /></td>
												<td class="dataCellText" width="33%"><bean:write
													name="searchResultObject" property="applicationName" />&nbsp;</td>
												<td class="dataCellText" colspan="3" width="58%"><bean:write
													name="searchResultObject" property="applicationDescription" />&nbsp;</td>
											</tr>
										<%}else{ oddRow = "true";%>
											<tr class="dataRowDark">
												<td class="dataCellNumerical" width="9%"><html:radio
													style="formFieldSized" property="applicationId"
													value="<%=searchResultObject.getApplicationId().toString()%>" /></td>
												<td class="dataCellText" width="33%"><bean:write
													name="searchResultObject" property="applicationName" />&nbsp;</td>
												<td class="dataCellText" colspan="3" width="58%"><bean:write
													name="searchResultObject" property="applicationDescription" />&nbsp;</td>
											</tr>
										<%}%>
									</logic:iterate>
								</table>
								</td>
							</tr>
							<tr>
								<td align="right" class="actionSection"><!-- action buttons begins -->
								<table cellpadding="4" cellspacing="0" border="0">
									<tr>
										
										<td><html:submit style="actionButton"
											onclick="setAndSubmit('read');">View Details</html:submit></td>
										<td><html:submit style="actionButton"
											onclick="setAndSubmit('loadSearch');">Back</html:submit></td>
									</tr>
								</table>
								<!-- action buttons end --></td>
							</tr>
						</logic:present>
					</table>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		</html:form>
	</table>











