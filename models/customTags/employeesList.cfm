<!--- employeesList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.employeesArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset employeesCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(employeesCount / attributes.maxresults) />


<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "deleted") eq 0>
	<p class="alert">Record deleted</p>
<cfelseif CompareNoCase(message, "search") eq 0>
	<p class="alert">Results for <em>"<cfoutput>#attributes.q#</cfoutput>"</em></p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<table>
	<thead>
		<tr>
			<!--- Header for emp_id --->
			<cfset emp_idascOrDesc = (FindNoCase("emp_id asc", url.orderby))? "desc" : "asc" />
			<cfset emp_idascOrDescIcon = (FindNoCase("emp_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=emp_id #emp_idascOrDesc#&amp;q=#attributes.q#">Emp_id #emp_idascOrDescIcon#</a></th>

			<!--- Header for firstname --->
			<cfset firstnameascOrDesc = (FindNoCase("firstname asc", url.orderby))? "desc" : "asc" />
			<cfset firstnameascOrDescIcon = (FindNoCase("firstname asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=firstname #firstnameascOrDesc#&amp;q=#attributes.q#">Firstname #firstnameascOrDescIcon#</a></th>

			<!--- Header for lastname --->
			<cfset lastnameascOrDesc = (FindNoCase("lastname asc", url.orderby))? "desc" : "asc" />
			<cfset lastnameascOrDescIcon = (FindNoCase("lastname asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=lastname #lastnameascOrDesc#&amp;q=#attributes.q#">Lastname #lastnameascOrDescIcon#</a></th>

			<!--- Header for unit_id --->
			<cfset unit_idascOrDesc = (FindNoCase("unit_id asc", url.orderby))? "desc" : "asc" />
			<cfset unit_idascOrDescIcon = (FindNoCase("unit_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=unit_id #unit_idascOrDesc#&amp;q=#attributes.q#">Unit_id #unit_idascOrDescIcon#</a></th>

			<!--- Header for extension --->
			<cfset extensionascOrDesc = (FindNoCase("extension asc", url.orderby))? "desc" : "asc" />
			<cfset extensionascOrDescIcon = (FindNoCase("extension asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=extension #extensionascOrDesc#&amp;q=#attributes.q#">Extension #extensionascOrDescIcon#</a></th>

			<!--- Header for first_aid --->
			<cfset first_aidascOrDesc = (FindNoCase("first_aid asc", url.orderby))? "desc" : "asc" />
			<cfset first_aidascOrDescIcon = (FindNoCase("first_aid asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=first_aid #first_aidascOrDesc#&amp;q=#attributes.q#">First_aid #first_aidascOrDescIcon#</a></th>

			<!--- Header for cpr --->
			<cfset cprascOrDesc = (FindNoCase("cpr asc", url.orderby))? "desc" : "asc" />
			<cfset cprascOrDescIcon = (FindNoCase("cpr asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=cpr #cprascOrDesc#&amp;q=#attributes.q#">Cpr #cprascOrDescIcon#</a></th>

			<th>Dept_id</th>
		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.employeesArray)#">
		<cfset employees = attributes.employeesArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#employees.getemp_id()#</td>
			<td>#employees.getfirstname()#</td>
			<td>#employees.getlastname()#</td>
			<td>#employees.getunit_id()#</td>
			<td>#employees.getextension()#</td>
			<td>#employees.getfirst_aid()#</td>
			<td>#employees.getcpr()#</td>
			<!--- Deal with all of the issues around showing the a good UI for the foreign [departments] object referenced here  --->
			<cfif not isNull(employees.getdept_id())>
				<td><a href="departments.cfm?method=read&amp;dept_id=#employees.getdept_id().getdept_id()#">#employees.getdept_id().getdept_name()#</a></td>
			<cfelse>
				<td></td>
			</cfif>
			<td class="crudlink"><a href="employees.cfm?method=read&emp_id=#employees.getemp_id()#">Read</a></td>
			<td class="crudlink"><a href="employees.cfm?method=edit&emp_id=#employees.getemp_id()#">Edit</a></td>
			<td class="crudlink"><a href="employees.cfm?method=delete_process&emp_id=#employees.getemp_id()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
<cfif pages gt 1>
	<tr>
	<td colspan="11">
		<table class="listnav">
			<tr>
				<td class="prev">
					<cfif prevOffset gte 0>
						<a href="?method=#attributes.method#&amp;offset=#prevOffset#&amp;maxresults=#attributes.maxresults#&amp;orderby=#attributes.orderby#&amp;q=#url.q#">&larr; Prev</a>
					</cfif>
				</td>
				<td class="pages">
					<cfloop index="i" from="1" to="#pages#">
						<cfset offset = 0 + ((i -1) * attributes.maxresults) />
						<cfif offset eq attributes.offset>
							#i#
						<cfelse>
							<a href="?method=#attributes.method#&amp;offset=#offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=#attributes.orderby#&amp;q=#url.q#">#i#</a>
						</cfif>
					</cfloop>
				</td>
				<td class="next">
					<cfif nextOffset lt employeesCount>
					<a href="?method=#attributes.method#&amp;offset=#nextOffset#&amp;maxresults=#attributes.maxresults#&amp;orderby=#attributes.orderby#&amp;q=#url.q#">Next &rarr;<a/>
					</cfif>
				</td>
			</tr>
		</table>
	</td>
	</tr>
</cfif>
	</tbody>
</cfif>
	</cfoutput>
</table>
</cfprocessingdirective>
<cfexit method="exitTag" />