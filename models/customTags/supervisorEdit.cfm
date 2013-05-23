<!--- supervisorEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.supervisor" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset supervisor = attributes.supervisor /> 
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
		<tr>
			<th><label for="sup_id">Sup_id:</label></th>
			<td><input name="sup_id" type="text" id="sup_id" value="#supervisor.getsup_id()#" /></td>
		</tr>
		<tr>
			<th><label for="emp_id">Emp_id:</label></th>
			<td><input name="emp_id" type="text" id="emp_id" value="#supervisor.getemp_id()#" /></td>
		</tr>
		<tr>
			<th><label for="title_id">Title_id:</label></th>
			<td><input name="title_id" type="text" id="title_id" value="#supervisor.gettitle_id()#" /></td>
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