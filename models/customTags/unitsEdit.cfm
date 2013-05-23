<!--- unitsEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.units" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset units = attributes.units /> 
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
			<th><label for="unit_id">Unit_id:</label></th>
			<td><input name="unit_id" type="text" id="unit_id" value="#units.getunit_id()#" /></td>
		</tr>
		<tr>
			<th><label for="dept_id">Dept_id:</label></th>
			<td><input name="dept_id" type="text" id="dept_id" value="#units.getdept_id()#" /></td>
		</tr>
		<tr>
			<th><label for="unit_name">Unit_name:</label></th>
			<td><input name="unit_name" type="text" id="unit_name" value="#units.getunit_name()#" /></td>
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