<!--- companiesRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.companies" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset companies = attributes.companies /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Company_id</th>
			<td>#companies.getcompany_id()#</td>
		</tr>
		<tr>
			<th>Company_name</th>
			<td>#companies.getcompany_name()#</td>
		</tr>
		<tr>
			<th>Company_abbrv</th>
			<td>#companies.getcompany_abbrv()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />