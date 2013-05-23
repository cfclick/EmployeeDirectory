<!--- sysdiagramsRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.sysdiagrams" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset sysdiagrams = attributes.sysdiagrams /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Name</th>
			<td>#sysdiagrams.getname()#</td>
		</tr>
		<tr>
			<th>Principal_id</th>
			<td>#sysdiagrams.getprincipal_id()#</td>
		</tr>
		<tr>
			<th>Diagram_id</th>
			<td>#sysdiagrams.getdiagram_id()#</td>
		</tr>
		<tr>
			<th>Version</th>
			<td>#sysdiagrams.getversion()#</td>
		</tr>
		<tr>
			<th>Definition</th>
			<td>[Cannot currently display binary files]</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />