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
<%@ page import="java.util.*"%>
<%@ page import="gov.nih.nci.security.upt.constants.*"%>
<%@ page import="gov.nih.nci.security.authorization.domainobjects.*"%>
<%@ page import="gov.nih.nci.security.constants.Constants"%>
<script>
<!--
   	function setAndSubmit(target)
   	{
  		document.UserForm.operation.value=target;
  		document.UserForm.submit();
 	}
 	
function skipNavigation()
{
	document.getElementById("userPGAssoc").focus();
	window.location.hash="userPGAssoc";
	document.getElementById("ncilink").tabIndex = -1;
	document.getElementById("nihlink").tabIndex = -1;
	document.getElementById("skipmenu").tabIndex = -1;
	
	document.getElementById("homeLink").tabIndex = -1;
	if(document.getElementById("adminhomeLink"))
		document.getElementById("adminhomeLink").tabIndex = -1;
		
	document.getElementById("menuHome").tabIndex = -1;
	document.getElementById("menuUser").tabIndex = -1;
	document.getElementById("menuPE").tabIndex = -1;
	document.getElementById("menuPrivilege").tabIndex = -1;
	document.getElementById("menuGroup").tabIndex = -1;
	document.getElementById("menuPG").tabIndex = -1;
	document.getElementById("menuRole").tabIndex = -1;
	document.getElementById("menuInstance").tabIndex = -1;
	document.getElementById("menulogout").tabIndex = -1;
} 	
 	
// -->
</script>


	<table cellpadding="0" cellspacing="0" border="0"
		class="contentPage" width="100%" height="100%">
		
		<html:form styleId="UserForm"
	action="/UserDBOperation">
	<html:hidden property="operation" value="read" />
	<input type="hidden" name="<csrf:token-name/>" value="<csrf:token-value uri='/UserDBOperation'/>"/>
		
		<tr>
			<td>
			<h2><a id="userPGAssoc"></a>Associated Protection Groups and Roles</h2>
			</td>
		</tr>
		<tr>
			<td valign="top" width="100%">
			<table cellpadding="0" cellspacing="0" border="0"
				width="100%" class="contentBegins">
				<logic:notEqual name="UserForm" property="userLoginName" value="<%=DisplayConstants.BLANK%>">
				<tr>
					<td>
						<table cellpadding="3" cellspacing="0" border="0" width="90%" align="center">
							<tr>
								<td class="formTitle" height="20" colspan="2">SELECTED USER</td>
							</tr>
							<tr class="dataRowDark">
								<td class="formRequiredLabel" width="40%" scope="row"><label for="userLoginName">User Login Name</label></td>
								<td class="formField" width="60%"><bean:write name="UserForm" property="userLoginName" /></td>
							</tr>
						</table>
					</td>
				</tr>
				</logic:notEqual>
				<tr>
					<td>
					<table cellpadding="0" cellspacing="0" border="0"
						width="100%">
						<tr>
							<td>
							<html:errors />
							</td>
						</tr>
						<tr><td><br></td></tr>
						<tr>
							<td class="formMessage" colspan="3">
							To modify the <b>Role(s)</b> associated with a protection group, select the desired <b>Protection Group</b> 
							then click the Associated Roles button. To remove a <b>Protection Group</b>/<b>Role</b> association from this <b>User</b>, select
							the desired <b>Protection Group</b> and click the Remove PG & Roles button.</td>
						</tr>
						<tr>
							<td class="dataTablePrimaryLabel" height="20">SEARCH RESULTS</td>
						</tr>
						<!-- paging begins -->
						<logic:present name="<%=DisplayConstants.AVAILABLE_PROTECTIONGROUPROLECONTEXT_SET%>">
							<bean:define id="oddRow" value="true" />
							<!-- paging ends -->
							<tr>
								<td>
								<table summary="Assign Protection Group, User, Role" cellpadding="3"
									cellspacing="0" border="0" class="dataTable" width="100%">
									<tr>
										<th class="dataTableHeader" scope="col" align="center"
											width="10%">Select</th>
										<th class="dataTableHeader" scope="col" align="center"
											width="45%">Associated Protection Group Name</th>
										<th class="dataTableHeader" scope="col" align="center"
											width="45%">Associated Role Name</th>
									</tr>
									<logic:iterate name="<%=DisplayConstants.AVAILABLE_PROTECTIONGROUPROLECONTEXT_SET%>" id="protectionGroupRoleContext" type="ProtectionGroupRoleContext">
										<bean:define name="protectionGroupRoleContext" property="protectionGroup" id="protectionGroup" type="ProtectionGroup"/>
										<bean:define name="protectionGroupRoleContext" property="roles" id="roles" type="Set" />
										<%if (oddRow.equals("true")) { oddRow ="false";%>
											<tr class="dataRowLight">
												<td class="dataCellNumerical" width="10%"><html:radio
													style="formFieldSized" property="protectionGroupAssociatedId" value="<%=protectionGroup.getProtectionGroupId().toString()%>"/></td>
												<td class="dataCellText" width="45%"><bean:write
													name="protectionGroup" property="protectionGroupName" /></td>
												<td class="dataCellText" width="45%">
												<%
													Iterator iterator = roles.iterator();
													int ii=1;
													while(iterator.hasNext()){
														Role role = (Role)iterator.next();
														%><%=role.getName()%><%														
														if(ii<roles.size()){
														%>,&nbsp;<%
														}
														ii++;
													}
												 %>
												</td>
											</tr>
										<%}else{ oddRow = "true";%>
											<tr class="dataRowDark">
												<td class="dataCellNumerical" width="10%"><html:radio
													style="formFieldSized" property="protectionGroupAssociatedId"
													value="<%=protectionGroup.getProtectionGroupId().toString()%>" /></td>
												<td class="dataCellText" width="45%"><bean:write
													name="protectionGroup" property="protectionGroupName" /></td>
												<td class="dataCellText" width="45%">
												<%
													Iterator iterator = roles.iterator();
													int ii=1;
													while(iterator.hasNext()){
														Role role = (Role)iterator.next();
														%><%=role.getName()%><%														
														if(ii<roles.size()){
														%>,&nbsp;<%
														}
														ii++;
													}
												 %>
												</td>
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
										<logic:present name='<%=Constants.CSM_UPDATE_PRIVILEGE +"_"+Constants.UPT_USER_OPERATION%>'>
											<td><html:submit style="actionButton"
												onclick="setAndSubmit('removeProtectionGroupAssociation');">Remove PG & Roles</html:submit></td>											
										</logic:present>
										<logic:notPresent name='<%=Constants.CSM_UPDATE_PRIVILEGE +"_"+Constants.UPT_USER_OPERATION%>'>
											<td><html:submit style="actionButton" disabled="true">Remove PG & Roles</html:submit></td>
										</logic:notPresent>
										<td><html:submit style="actionButton"
											onclick="setAndSubmit('loadRoleAssociation');">Associated Roles</html:submit></td>
										<td><html:submit style="actionButton"
											onclick="setAndSubmit('read');">Back</html:submit></td>											
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
