<!--- departmentsEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.departments" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset departments = attributes.departments /> 
<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "updated") eq 0>
	<p class="alert">Record updated</p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<cfform action="?method=edit_process" method="post" format="html" enctype="multipart/form-data">
	<table>
	<tbody>
			<input name="dept_id" type="hidden" value="#departments.getdept_id()#" />
		<tr>
			<th><label for="dept_name">Dept_name:</label></th>
			<td><input name="dept_name" type="text" id="dept_name" value="#departments.getdept_name()#" /></td>
		</tr>
		<tr>
			<th><label for="fax1">Fax1:</label></th>
			<td><input name="fax1" type="text" id="fax1" value="#departments.getfax1()#" /></td>
		</tr>
		<tr>
			<!--- Multiple references to the same table or self join--->
			<cfif url.dept_id eq 0 OR IsNull(departments.getcompany_id())>
				<cfset company_idValue = 0 /> 
			<cfelse>
				<cfset company_idValue = departments.getcompany_id().getcompany_id() />
			</cfif>
			<th><label for="company_id">Company_id:</label></th>
			<td><cf_foreignkeySelector name="company_id" entityname="companies" identity="company_id" foreignKeylabel="company_name" fieldValue="#company_idValue#" orderby="company_id asc" /></td>
		</tr>
		<tr>
			<th><label for="fax2">Fax2:</label></th>
			<td><input name="fax2" type="text" id="fax2" value="#departments.getfax2()#" /></td>
		</tr>
		<tr>
			<th><label for="phone1">Phone1:</label></th>
			<td><input name="phone1" type="text" id="phone1" value="#departments.getphone1()#" /></td>
		</tr>
		<tr>
			<th><label for="phone2">Phone2:</label></th>
			<td><input name="phone2" type="text" id="phone2" value="#departments.getphone2()#" /></td>
		</tr>
		<tr>
			<th />
			<td><input name="save" type="submit" value="Save" /></td>
		</tr>
	</tbody>
	</table>
</cfform>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />