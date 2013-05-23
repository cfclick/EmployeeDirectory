<!--- companiesEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.companies" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset companies = attributes.companies /> 
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
			<input name="company_id" type="hidden" value="#companies.getcompany_id()#" />
		<tr>
			<th><label for="company_name">Company_name:</label></th>
			<td><input name="company_name" type="text" id="company_name" value="#companies.getcompany_name()#" /></td>
		</tr>
		<tr>
			<th><label for="company_abbrv">Company_abbrv:</label></th>
			<td><input name="company_abbrv" type="text" id="company_abbrv" value="#companies.getcompany_abbrv()#" /></td>
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