<%@ include file="/pages/imports.jsp"%>



<table summary="" cellpadding="0" cellspacing="0" border="0"
	class="contentPage" width="100%" height="100%">
	<tr>
		<td valign="top">
		<table cellpadding="0" cellspacing="0" border="0"
			class="contentBegins">
			<tr>
				<td>
				<table summary="" cellpadding="3" cellspacing="0" border="0"
					align="center">
					<tr>
						<td class="formMessage" colspan="3">* indicates a required field</td>
					</tr>
					<tr>
						<td class="formTitle" height="20" colspan="3">EMPLOYEE RECORD</td>
					</tr>


					<tr>
						<td class="dataTableHeader" scope="col" colspan="3">Demographic
						Information</td>
					</tr>


					<tr>
						<td class="formRequiredNotice" width="5">*</td>
						<td class="formRequiredLabel">Last name:</td>
						<td class="dataCellText"><html:text property="lastName" size="10"
							maxlength="60" tabindex="12" /></td>
					</tr>
					<tr>
						<td class="formRequiredNotice" width="5">*</td>
						<td class="formRequiredLabel">First name:</td>
						<td class="dataCellText"><html:text property="firstName" size="10"
							maxlength="60" tabindex="13" /></td>
					</tr>
					<tr>
						<td class="formRequiredNotice" width="5">&nbsp;</td>
						<td class="formRequiredLabel">Middle Name</td>
						<td class="dataCellText"><html:text property="middleName"
							maxlength="1" size="1" tabindex="14" /></td>
					</tr>
					<tr>
						<td class="formRequiredNotice" width="5">*</td>
						<td class="formRequiredLabel">Street address:</td>
						<td class="dataCellText"><html:text property="streetAddr"
							maxlength="45" size="10" tabindex="15" /></td>
					</tr>
					<tr>
						<td class="formRequiredNotice" width="5">*</td>
						<td class="formRequiredLabel">City:</td>
						<td class="dataCellText"><html:text property="city" size="10"
							maxlength="50" tabindex="16" /></td>
					</tr>


					<tr>
						<td class="formRequiredNotice" width="5">*</td>
						<td class="formRequiredLabel">State Code:</td>
						<td class="dataCellText"><html:text property="state" size="3"
							maxlength="3" tabindex="17" /></td>
					</tr>

					<tr>
						<td class="formRequiredNotice" width="5">*</td>
						<td class="formRequiredLabel">Zip:</td>
						<td class="dataCellText"><html:text property="zip" size="10"
							maxlength="10" tabindex="18" /></td>
					</tr>
					<tr>
						<td class="formRequiredNotice" width="5">*</td>
						<td class="formRequiredLabel">Phone number:</td>
						<td class="dataCellText"><html:text property="phoneNumber"
							size="10" maxlength="19" tabindex="19" /></td>
					</tr>
					<tr>
						<td class="formRequiredNotice" width="5">&nbsp;</td>
						<td class="formRequiredLabel">Email address:</td>
						<td class="dataCellText"><html:text property="emailAddr" size="10"
							maxlength="60" tabindex="20" /></td>
					</tr>
					<tr>
						<td class="formRequiredNotice" width="5">&nbsp;</td>
						<td class="formRequiredLabel">Social Security Number:</td>
						<td class="dataCellText"><html:text property="ssn" size="10"
							maxlength="60" tabindex="21" /></td>
					</tr>


					<tr>
						<td class="dataTableHeader" scope="col" colspan="3">Company
						Information</td>
					</tr>

					<tr>
						<td class="formRequiredNotice" width="5">*</td>
						<td class="formRequiredLabel">Projects:</td>
						<td class="dataCellText">Not Yet Defined</td>
					</tr>
					<tr>
						<td class="formRequiredNotice" width="5">*</td>
						<td class="formRequiredLabel">Salary:</td>
						<td class="dataCellText"><html:text property="salary" size="10"
							maxlength="14" tabindex="22" /></td>
					</tr>


				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
