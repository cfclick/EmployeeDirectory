<!--- unitsRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.units" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset units = attributes.units /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Unit_id</th>
			<td>#units.getunit_id()#</td>
		</tr>
		<tr>
			<th>Dept_id</th>
			<td>#units.getdept_id()#</td>
		</tr>
		<tr>
			<th>Unit_name</th>
			<td>#units.getunit_name()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />