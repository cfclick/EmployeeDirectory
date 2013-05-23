<!--- officesRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.offices" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset offices = attributes.offices /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Office_id</th>
			<td>#offices.getoffice_id()#</td>
		</tr>
		<tr>
			<th>Office_name</th>
			<td>#offices.getoffice_name()#</td>
		</tr>
		<tr>
			<th>Address1</th>
			<td>#offices.getaddress1()#</td>
		</tr>
		<tr>
			<th>Address2</th>
			<td>#offices.getaddress2()#</td>
		</tr>
		<tr>
			<th>Phone1</th>
			<td>#offices.getphone1()#</td>
		</tr>
		<tr>
			<th>Phone2</th>
			<td>#offices.getphone2()#</td>
		</tr>
		<tr>
			<th>Fax1</th>
			<td>#offices.getfax1()#</td>
		</tr>
		<tr>
			<th>Fax2</th>
			<td>#offices.getfax2()#</td>
		</tr>
		<tr>
			<th>Misc1</th>
			<td>#offices.getmisc1()#</td>
		</tr>
		<tr>
			<th>Misc2</th>
			<td>#offices.getmisc2()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />