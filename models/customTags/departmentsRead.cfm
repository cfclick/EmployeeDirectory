<!--- departmentsRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.departments" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset departments = attributes.departments /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Dept_id</th>
			<td>#departments.getdept_id()#</td>
		</tr>
		<tr>
			<th>Dept_name</th>
			<td>#departments.getdept_name()#</td>
		</tr>
		<tr>
			<th>Fax1</th>
			<td>#departments.getfax1()#</td>
		</tr>
		<tr>
			<th>company_id</th>
			<!--- Deal with all of the issues around showing the a good UI for the foreign [companies] object referenced here  --->
			<cfif not isNull(departments.getcompany_id())>
				<td><a href="companies.cfm?method=read&amp;company_id=#departments.getcompany_id().getcompany_id()#">#departments.getcompany_id().getcompany_name()#</a></td>
			<cfelse>
				<td></td>
			</cfif>
		</tr>
		<tr>
			<th>Fax2</th>
			<td>#departments.getfax2()#</td>
		</tr>
		<tr>
			<th>Phone1</th>
			<td>#departments.getphone1()#</td>
		</tr>
		<tr>
			<th>Phone2</th>
			<td>#departments.getphone2()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />