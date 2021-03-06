<%--L
   Copyright Ekagra Software Technologies Ltd.
   Copyright SAIC

   Distributed under the OSI-approved BSD 3-Clause License.
   See http://ncip.github.com/common-security-module/LICENSE.txt for details.
L--%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested"%>
<%@ taglib uri="/WEB-INF/Owasp.CsrfGuard.tld" prefix="csrf" %>

<%@ page import="gov.nih.nci.security.upt.constants.*"%>

<script>
  <!--
    	function set(id)
    	{
    		document.MenuForm.tableId.value=id;
    		document.MenuForm.submit();
    	}
   // -->
</script>

<html:form styleId="MenuForm" action='<%="/MenuSelection"%>'>
	<%
	String tableId;
	try
	{
		tableId = (String)session.getAttribute(DisplayConstants.CURRENT_TABLE_ID);
		if (tableId.equalsIgnoreCase(DisplayConstants.BLANK))
		{
			tableId = DisplayConstants.ADMIN_HOME_ID;
			session.setAttribute(DisplayConstants.CURRENT_TABLE_ID,DisplayConstants.ADMIN_HOME_ID);
		}
	}
	catch (Exception e)
	{
		tableId = DisplayConstants.ADMIN_HOME_ID;
		session.setAttribute(DisplayConstants.CURRENT_TABLE_ID,DisplayConstants.ADMIN_HOME_ID);
	}
	%>
	<html:hidden property="tableId" value="error" />
	<input type="hidden" name="<csrf:token-name/>" value="<csrf:token-value uri='<%="/MenuSelection"%>'/>"/>
	<td class="mainMenu" height="20">
	<table cellpadding="0" cellspacing="0" border="0" height="20">
		<logic:present name="<%=DisplayConstants.LOGIN_OBJECT%>">
			<tr>
			<!-- link 1 begins -->
			<%if (tableId.equalsIgnoreCase(DisplayConstants.ADMIN_HOME_ID)){%>
			<td height="20" class="mainMenuItemOver" onmouseover="changeMenuStyle(this,'mainMenuItemOver'),showCursor()" onmouseout="changeMenuStyle(this,'mainMenuItemOver'),hideCursor()" onclick="javascript: set('<%=DisplayConstants.ADMIN_HOME_ID%>')"><a class="mainMenuLink" href="javascript: set('<%=DisplayConstants.ADMIN_HOME_ID%>')" id="saHome">HOME</a></td>
			<%}if (!tableId.equalsIgnoreCase(DisplayConstants.ADMIN_HOME_ID)){%>
			<td height="20" class="mainMenuItem" onmouseover="changeMenuStyle(this,'mainMenuItemOver'),showCursor()" onmouseout="changeMenuStyle(this,'mainMenuItem'),hideCursor()" onclick="javascript: set('<%=DisplayConstants.ADMIN_HOME_ID%>')"><a class="mainMenuLink" href="javascript: set('<%=DisplayConstants.ADMIN_HOME_ID%>')" id="saHome">HOME</a></td>
			<%}%>
			<!-- link 1 ends -->
			<td><img src="images/mainMenuSeparator.gif" width="1" height="16" alt="" /></td>			
			<!-- link 2 begins -->
			<%if (tableId.equalsIgnoreCase(DisplayConstants.APPLICATION_ID)){%>
			<td height="20" class="mainMenuItemOver" onmouseover="changeMenuStyle(this,'mainMenuItemOver'),showCursor()" onmouseout="changeMenuStyle(this,'mainMenuItemOver'),hideCursor()" onclick="javascript: set('<%=DisplayConstants.APPLICATION_ID%>')"><a class="mainMenuLink" href="javascript: set('<%=DisplayConstants.APPLICATION_ID%>')" id="saApp">APPLICATION</a></td>
			<%}if (!tableId.equalsIgnoreCase(DisplayConstants.APPLICATION_ID)){%>
			<td height="20" class="mainMenuItem" onmouseover="changeMenuStyle(this,'mainMenuItemOver'),showCursor()" onmouseout="changeMenuStyle(this,'mainMenuItem'),hideCursor()" onclick="javascript: set('<%=DisplayConstants.APPLICATION_ID%>')"><a class="mainMenuLink" href="javascript: set('<%=DisplayConstants.APPLICATION_ID%>')" id="saApp">APPLICATION</a></td>
			<%}%>
			<!-- link 2 ends -->
			<td><img src="images/mainMenuSeparator.gif" width="1" height="16" alt="" /></td>
			<!-- link 3 begins -->
			<%if (tableId.equalsIgnoreCase(DisplayConstants.USER_ID)){%>
			<td height="20" class="mainMenuItemOver" onmouseover="changeMenuStyle(this,'mainMenuItemOver'),showCursor()" onmouseout="changeMenuStyle(this,'mainMenuItemOver'),hideCursor()" onclick="javascript: set('<%=DisplayConstants.USER_ID%>')"><a class="mainMenuLink" href="javascript: set('<%=DisplayConstants.USER_ID%>')" id="saUser">USER</a></td>
			<%}if (!tableId.equalsIgnoreCase(DisplayConstants.USER_ID)){%>
			<td height="20" class="mainMenuItem" onmouseover="changeMenuStyle(this,'mainMenuItemOver'),showCursor()" onmouseout="changeMenuStyle(this,'mainMenuItem'),hideCursor()" onclick="javascript: set('<%=DisplayConstants.USER_ID%>')"><a class="mainMenuLink" href="javascript: set('<%=DisplayConstants.USER_ID%>')" id="saUser">USER</a></td>			
			<%}%>
			<!-- link 3 ends -->
			<td><img src="images/mainMenuSeparator.gif" width="1" height="16"  alt="MainMenu Items Separator" /></td>
			
			<!-- link priv 3.0.1 begins -->
				<%if (tableId.equalsIgnoreCase(DisplayConstants.PRIVILEGE_ID)){%>
				<td height="16" class="mainMenuItemOver"
					onmouseover="changeMenuStyle(this,'mainMenuItemOver'),showCursor()"
					onmouseout="changeMenuStyle(this,'mainMenuItemOver'),hideCursor()"
					onclick="javascript: set('<%=DisplayConstants.PRIVILEGE_ID%>')"><a
					class="mainMenuLink"
					href="javascript: set('<%=DisplayConstants.PRIVILEGE_ID%>')" id="saPriv">PRIVILEGE</a>
				<%}if (!tableId.equalsIgnoreCase(DisplayConstants.PRIVILEGE_ID)){%>
				<td height="16" class="mainMenuItem"
					onmouseover="changeMenuStyle(this,'mainMenuItemOver'),showCursor()"
					onmouseout="changeMenuStyle(this,'mainMenuItem'),hideCursor()"
					onclick="javascript: set('<%=DisplayConstants.PRIVILEGE_ID%>')"><a
					class="mainMenuLink"
					href="javascript: set('<%=DisplayConstants.PRIVILEGE_ID%>')" id="saPriv">PRIVILEGE</a>
				<%}%>
				<!-- link priv 3.0.1 ends -->
			
			<!-- link 3 ends -->
			<td><img src="images/mainMenuSeparator.gif" width="1" height="16"  alt="MainMenu Items Separator" /></td>
			
			<!-- link 4 begins -->			
			<td height="20" class="mainMenuItem" onmouseover="changeMenuStyle(this,'mainMenuItemOver'),showCursor()" onmouseout="changeMenuStyle(this,'mainMenuItem'),hideCursor()"><a class="mainMenuLink" href="javascript: set('<%=DisplayConstants.SYSTEM_CONFIGURATION_ID%>')" id="saSystemConfiguration">SYSTEM CONFIGURATION</a></td>
			<!-- link 4 ends -->			
			<td><img src="images/mainMenuSeparator.gif" width="1" height="16"  alt="MainMenu Items Separator" /></td>
			
			
			<!-- link 5 begins -->			
			<td height="20" class="mainMenuItem" onmouseover="changeMenuStyle(this,'mainMenuItemOver'),showCursor()" onmouseout="changeMenuStyle(this,'mainMenuItem'),hideCursor()"><a class="mainMenuLink" href="javascript: set('<%=DisplayConstants.LOGOUT_ID%>')" id="saLogout">LOG OUT</a></td>
			<!-- link 5 ends -->			
			<td><img src="images/mainMenuSeparator.gif" width="1" height="16"  alt="MainMenu Items Separator" /></td>
			</tr>
		</logic:present>
	</table>
	</td>
</html:form>
