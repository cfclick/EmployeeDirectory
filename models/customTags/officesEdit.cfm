<!--- officesEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.offices" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset offices = attributes.offices /> 
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
			<input name="office_id" type="hidden" value="#offices.getoffice_id()#" />
		<tr>
			<th><label for="office_name">Office_name:</label></th>
			<td><input name="office_name" type="text" id="office_name" value="#offices.getoffice_name()#" /></td>
		</tr>
		<tr>
			<th><label for="address1">Address1:</label></th>
			<td><input name="address1" type="text" id="address1" value="#offices.getaddress1()#" /></td>
		</tr>
		<tr>
			<th><label for="address2">Address2:</label></th>
			<td><input name="address2" type="text" id="address2" value="#offices.getaddress2()#" /></td>
		</tr>
		<tr>
			<th><label for="phone1">Phone1:</label></th>
			<td><input name="phone1" type="text" id="phone1" value="#offices.getphone1()#" /></td>
		</tr>
		<tr>
			<th><label for="phone2">Phone2:</label></th>
			<td><input name="phone2" type="text" id="phone2" value="#offices.getphone2()#" /></td>
		</tr>
		<tr>
			<th><label for="fax1">Fax1:</label></th>
			<td><input name="fax1" type="text" id="fax1" value="#offices.getfax1()#" /></td>
		</tr>
		<tr>
			<th><label for="fax2">Fax2:</label></th>
			<td><input name="fax2" type="text" id="fax2" value="#offices.getfax2()#" /></td>
		</tr>
		<tr>
			<th><label for="misc1">Misc1:</label></th>
			<td><input name="misc1" type="text" id="misc1" value="#offices.getmisc1()#" /></td>
		</tr>
		<tr>
			<th><label for="misc2">Misc2:</label></th>
			<td><input name="misc2" type="text" id="misc2" value="#offices.getmisc2()#" /></td>
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