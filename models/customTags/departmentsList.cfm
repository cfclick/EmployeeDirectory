<!--- departmentsList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.departmentsArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset departmentsCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(departmentsCount / attributes.maxresults) />


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
			<!--- Header for dept_id --->
			<cfset dept_idascOrDesc = (FindNoCase("dept_id asc", url.orderby))? "desc" : "asc" />
			<cfset dept_idascOrDescIcon = (FindNoCase("dept_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=dept_id #dept_idascOrDesc#&amp;q=#attributes.q#">Dept_id #dept_idascOrDescIcon#</a></th>

			<!--- Header for dept_name --->
			<cfset dept_nameascOrDesc = (FindNoCase("dept_name asc", url.orderby))? "desc" : "asc" />
			<cfset dept_nameascOrDescIcon = (FindNoCase("dept_name asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=dept_name #dept_nameascOrDesc#&amp;q=#attributes.q#">Dept_name #dept_nameascOrDescIcon#</a></th>

			<!--- Header for fax1 --->
			<cfset fax1ascOrDesc = (FindNoCase("fax1 asc", url.orderby))? "desc" : "asc" />
			<cfset fax1ascOrDescIcon = (FindNoCase("fax1 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=fax1 #fax1ascOrDesc#&amp;q=#attributes.q#">Fax1 #fax1ascOrDescIcon#</a></th>

			<th>Company_id</th>
			<!--- Header for fax2 --->
			<cfset fax2ascOrDesc = (FindNoCase("fax2 asc", url.orderby))? "desc" : "asc" />
			<cfset fax2ascOrDescIcon = (FindNoCase("fax2 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=fax2 #fax2ascOrDesc#&amp;q=#attributes.q#">Fax2 #fax2ascOrDescIcon#</a></th>

			<!--- Header for phone1 --->
			<cfset phone1ascOrDesc = (FindNoCase("phone1 asc", url.orderby))? "desc" : "asc" />
			<cfset phone1ascOrDescIcon = (FindNoCase("phone1 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=phone1 #phone1ascOrDesc#&amp;q=#attributes.q#">Phone1 #phone1ascOrDescIcon#</a></th>

			<!--- Header for phone2 --->
			<cfset phone2ascOrDesc = (FindNoCase("phone2 asc", url.orderby))? "desc" : "asc" />
			<cfset phone2ascOrDescIcon = (FindNoCase("phone2 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=phone2 #phone2ascOrDesc#&amp;q=#attributes.q#">Phone2 #phone2ascOrDescIcon#</a></th>

			<th>employeesCount</th>
		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.departmentsArray)#">
		<cfset departments = attributes.departmentsArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#departments.getdept_id()#</td>
			<td>#departments.getdept_name()#</td>
			<td>#departments.getfax1()#</td>
			<!--- Deal with all of the issues around showing the a good UI for the foreign [companies] object referenced here  --->
			<cfif not isNull(departments.getcompany_id())>
				<td><a href="companies.cfm?method=read&amp;company_id=#departments.getcompany_id().getcompany_id()#">#departments.getcompany_id().getcompany_name()#</a></td>
			<cfelse>
				<td></td>
			</cfif>
			<td>#departments.getfax2()#</td>
			<td>#departments.getphone1()#</td>
			<td>#departments.getphone2()#</td>
			<td>#departments.getemployeesCount()#</td>
			<td class="crudlink"><a href="departments.cfm?method=read&dept_id=#departments.getdept_id()#">Read</a></td>
			<td class="crudlink"><a href="departments.cfm?method=edit&dept_id=#departments.getdept_id()#">Edit</a></td>
			<td class="crudlink"><a href="departments.cfm?method=delete_process&dept_id=#departments.getdept_id()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
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
					<cfif nextOffset lt departmentsCount>
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