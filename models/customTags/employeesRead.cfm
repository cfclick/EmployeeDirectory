<!--- employeesRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.employees" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset employees = attributes.employees /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Emp_id</th>
			<td>#employees.getemp_id()#</td>
		</tr>
		<tr>
			<th>Firstname</th>
			<td>#employees.getfirstname()#</td>
		</tr>
		<tr>
			<th>Lastname</th>
			<td>#employees.getlastname()#</td>
		</tr>
		<tr>
			<th>Unit_id</th>
			<td>#employees.getunit_id()#</td>
		</tr>
		<tr>
			<th>Extension</th>
			<td>#employees.getextension()#</td>
		</tr>
		<tr>
			<th>First_aid</th>
			<td>#employees.getfirst_aid()#</td>
		</tr>
		<tr>
			<th>Cpr</th>
			<td>#employees.getcpr()#</td>
		</tr>
		<tr>
			<th>dept_id</th>
			<!--- Deal with all of the issues around showing the a good UI for the foreign [departments] object referenced here  --->
			<cfif not isNull(employees.getdept_id())>
				<td><a href="departments.cfm?method=read&amp;dept_id=#employees.getdept_id().getdept_id()#">#employees.getdept_id().getdept_name()#</a></td>
			<cfelse>
				<td></td>
			</cfif>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />