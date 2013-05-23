<!--- unitsList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.unitsArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset unitsCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(unitsCount / attributes.maxresults) />


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
			<!--- Header for unit_id --->
			<cfset unit_idascOrDesc = (FindNoCase("unit_id asc", url.orderby))? "desc" : "asc" />
			<cfset unit_idascOrDescIcon = (FindNoCase("unit_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=unit_id #unit_idascOrDesc#&amp;q=#attributes.q#">Unit_id #unit_idascOrDescIcon#</a></th>

			<!--- Header for dept_id --->
			<cfset dept_idascOrDesc = (FindNoCase("dept_id asc", url.orderby))? "desc" : "asc" />
			<cfset dept_idascOrDescIcon = (FindNoCase("dept_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=dept_id #dept_idascOrDesc#&amp;q=#attributes.q#">Dept_id #dept_idascOrDescIcon#</a></th>

			<!--- Header for unit_name --->
			<cfset unit_nameascOrDesc = (FindNoCase("unit_name asc", url.orderby))? "desc" : "asc" />
			<cfset unit_nameascOrDescIcon = (FindNoCase("unit_name asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=unit_name #unit_nameascOrDesc#&amp;q=#attributes.q#">Unit_name #unit_nameascOrDescIcon#</a></th>

		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.unitsArray)#">
		<cfset units = attributes.unitsArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#units.getunit_id()#</td>
			<td>#units.getdept_id()#</td>
			<td>#units.getunit_name()#</td>
			<td class="crudlink"><a href="units.cfm?method=read&unit_id=#units.getunit_id()#&dept_id=#units.getdept_id()#">Read</a></td>
			<td class="crudlink"><a href="units.cfm?method=edit&unit_id=#units.getunit_id()#&dept_id=#units.getdept_id()#">Edit</a></td>
			<td class="crudlink"><a href="units.cfm?method=delete_process&unit_id=#units.getunit_id()#&dept_id=#units.getdept_id()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
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
					<cfif nextOffset lt unitsCount>
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