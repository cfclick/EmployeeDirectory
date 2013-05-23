<!--- dtpropertiesRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.dtproperties" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset dtproperties = attributes.dtproperties /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Id</th>
			<td>#dtproperties.getid()#</td>
		</tr>
		<tr>
			<th>Objectid</th>
			<td>#dtproperties.getobjectid()#</td>
		</tr>
		<tr>
			<th>Property</th>
			<td>#dtproperties.getproperty()#</td>
		</tr>
		<tr>
			<th>Value</th>
			<td>#dtproperties.getvalue()#</td>
		</tr>
		<tr>
			<th>Lvalue</th>
			<td><cf_displayImage image="#dtproperties.getlvalue()#" /></td>
		</tr>
		<tr>
			<th>Version</th>
			<td>#dtproperties.getversion()#</td>
		</tr>
		<tr>
			<th>Uvalue</th>
			<td>#dtproperties.getuvalue()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />