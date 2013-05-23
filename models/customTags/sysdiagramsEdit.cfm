<!--- sysdiagramsEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.sysdiagrams" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset sysdiagrams = attributes.sysdiagrams /> 
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
			<th><label for="name">Name:</label></th>
			<td><input name="name" type="text" id="name" value="#sysdiagrams.getname()#" /></td>
		</tr>
		<tr>
			<th><label for="principal_id">Principal_id:</label></th>
			<td><input name="principal_id" type="text" id="principal_id" value="#sysdiagrams.getprincipal_id()#" /></td>
		</tr>
			<input name="diagram_id" type="hidden" value="#sysdiagrams.getdiagram_id()#" />
		<tr>
			<th><label for="version">Version:</label></th>
			<td><input name="version" type="text" id="version" value="#sysdiagrams.getversion()#" /></td>
		</tr>
		<tr>
			<th><label for="definition">Definition:</label></th>
			<td>[Cannot handle binaries yet.]</td>
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