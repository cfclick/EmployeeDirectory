<!--- supervisorRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.supervisor" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset supervisor = attributes.supervisor /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Sup_id</th>
			<td>#supervisor.getsup_id()#</td>
		</tr>
		<tr>
			<th>Emp_id</th>
			<td>#supervisor.getemp_id()#</td>
		</tr>
		<tr>
			<th>Title_id</th>
			<td>#supervisor.gettitle_id()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />