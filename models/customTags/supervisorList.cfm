<!--- supervisorList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.supervisorArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset supervisorCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(supervisorCount / attributes.maxresults) />


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
			<!--- Header for sup_id --->
			<cfset sup_idascOrDesc = (FindNoCase("sup_id asc", url.orderby))? "desc" : "asc" />
			<cfset sup_idascOrDescIcon = (FindNoCase("sup_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=sup_id #sup_idascOrDesc#&amp;q=#attributes.q#">Sup_id #sup_idascOrDescIcon#</a></th>

			<!--- Header for emp_id --->
			<cfset emp_idascOrDesc = (FindNoCase("emp_id asc", url.orderby))? "desc" : "asc" />
			<cfset emp_idascOrDescIcon = (FindNoCase("emp_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=emp_id #emp_idascOrDesc#&amp;q=#attributes.q#">Emp_id #emp_idascOrDescIcon#</a></th>

			<!--- Header for title_id --->
			<cfset title_idascOrDesc = (FindNoCase("title_id asc", url.orderby))? "desc" : "asc" />
			<cfset title_idascOrDescIcon = (FindNoCase("title_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=title_id #title_idascOrDesc#&amp;q=#attributes.q#">Title_id #title_idascOrDescIcon#</a></th>

		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.supervisorArray)#">
		<cfset supervisor = attributes.supervisorArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#supervisor.getsup_id()#</td>
			<td>#supervisor.getemp_id()#</td>
			<td>#supervisor.gettitle_id()#</td>
			<td class="crudlink"><a href="supervisor.cfm?method=read&sup_id=#supervisor.getsup_id()#">Read</a></td>
			<td class="crudlink"><a href="supervisor.cfm?method=edit&sup_id=#supervisor.getsup_id()#">Edit</a></td>
			<td class="crudlink"><a href="supervisor.cfm?method=delete_process&sup_id=#supervisor.getsup_id()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
<cfif pages gt 1>
	<tr>
	<td colspan="6">
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
					<cfif nextOffset lt supervisorCount>
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