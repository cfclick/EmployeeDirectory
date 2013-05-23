<!--- employeesEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.employees" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset employees = attributes.employees /> 
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
			<input name="emp_id" type="hidden" value="#employees.getemp_id()#" />
		<tr>
			<th><label for="firstname">Firstname:</label></th>
			<td><input name="firstname" type="text" id="firstname" value="#employees.getfirstname()#" /></td>
		</tr>
		<tr>
			<th><label for="lastname">Lastname:</label></th>
			<td><input name="lastname" type="text" id="lastname" value="#employees.getlastname()#" /></td>
		</tr>
		<tr>
			<th><label for="unit_id">Unit_id:</label></th>
			<td><input name="unit_id" type="text" id="unit_id" value="#employees.getunit_id()#" /></td>
		</tr>
		<tr>
			<th><label for="extension">Extension:</label></th>
			<td><input name="extension" type="text" id="extension" value="#employees.getextension()#" /></td>
		</tr>
		<tr>
			<th><label for="first_aid">First_aid:</label></th>
			<td><input name="first_aid" type="text" id="first_aid" value="#employees.getfirst_aid()#" /></td>
		</tr>
		<tr>
			<th><label for="cpr">Cpr:</label></th>
			<td><input name="cpr" type="text" id="cpr" value="#employees.getcpr()#" /></td>
		</tr>
		<tr>
			<!--- Multiple references to the same table or self join--->
			<cfif url.emp_id eq 0 OR IsNull(employees.getdept_id())>
				<cfset dept_idValue = 0 /> 
			<cfelse>
				<cfset dept_idValue = employees.getdept_id().getdept_id() />
			</cfif>
			<th><label for="dept_id">Dept_id:</label></th>
			<td><cf_foreignkeySelector name="dept_id" entityname="departments" identity="dept_id" foreignKeylabel="dept_name" fieldValue="#dept_idValue#" orderby="dept_id asc" /></td>
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