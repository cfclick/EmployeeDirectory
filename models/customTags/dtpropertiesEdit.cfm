<!--- dtpropertiesEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.dtproperties" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset dtproperties = attributes.dtproperties /> 
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
			<input name="id" type="hidden" value="#dtproperties.getid()#" />
		<tr>
			<th><label for="objectid">Objectid:</label></th>
			<td><input name="objectid" type="text" id="objectid" value="#dtproperties.getobjectid()#" /></td>
		</tr>
			<input name="property" type="hidden" value="#dtproperties.getproperty()#" />
		<tr>
			<th><label for="value">Value:</label></th>
			<td><input name="value" type="text" id="value" value="#dtproperties.getvalue()#" /></td>
		</tr>
		<tr>
			<th><label for="lvalue">Lvalue:</label></th>
			<td>
				<cfif not IsNull(person.getlvalue())>
					<cf_displayImage image="#dtproperties.getlvalue()#" /> - Current Image<br />
					<label for="lvalue___remove">Remove Image (lvalue):</label>
					<cfinput name="lvalue___remove" type="checkbox" value="TRUE" id="lvalue___remove" class="checkbox" /><br />
				</cfif>
				<input name="lvalue___file" type="file" id="lvalue" value="" /><br />
			</td>
		</tr>
		<tr>
			<th><label for="version">Version:</label></th>
			<td><input name="version" type="text" id="version" value="#dtproperties.getversion()#" /></td>
		</tr>
		<tr>
			<th><label for="uvalue">Uvalue:</label></th>
			<td><input name="uvalue" type="text" id="uvalue" value="#dtproperties.getuvalue()#" /></td>
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