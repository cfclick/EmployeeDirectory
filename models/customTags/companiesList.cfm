<!--- companiesList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.companiesArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset companiesCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(companiesCount / attributes.maxresults) />


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
			<!--- Header for company_id --->
			<cfset company_idascOrDesc = (FindNoCase("company_id asc", url.orderby))? "desc" : "asc" />
			<cfset company_idascOrDescIcon = (FindNoCase("company_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=company_id #company_idascOrDesc#&amp;q=#attributes.q#">Company_id #company_idascOrDescIcon#</a></th>

			<!--- Header for company_name --->
			<cfset company_nameascOrDesc = (FindNoCase("company_name asc", url.orderby))? "desc" : "asc" />
			<cfset company_nameascOrDescIcon = (FindNoCase("company_name asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=company_name #company_nameascOrDesc#&amp;q=#attributes.q#">Company_name #company_nameascOrDescIcon#</a></th>

			<!--- Header for company_abbrv --->
			<cfset company_abbrvascOrDesc = (FindNoCase("company_abbrv asc", url.orderby))? "desc" : "asc" />
			<cfset company_abbrvascOrDescIcon = (FindNoCase("company_abbrv asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=company_abbrv #company_abbrvascOrDesc#&amp;q=#attributes.q#">Company_abbrv #company_abbrvascOrDescIcon#</a></th>

			<th>departmentsCount</th>
		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.companiesArray)#">
		<cfset companies = attributes.companiesArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#companies.getcompany_id()#</td>
			<td>#companies.getcompany_name()#</td>
			<td>#companies.getcompany_abbrv()#</td>
			<td>#companies.getdepartmentsCount()#</td>
			<td class="crudlink"><a href="companies.cfm?method=read&company_id=#companies.getcompany_id()#">Read</a></td>
			<td class="crudlink"><a href="companies.cfm?method=edit&company_id=#companies.getcompany_id()#">Edit</a></td>
			<td class="crudlink"><a href="companies.cfm?method=delete_process&company_id=#companies.getcompany_id()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
<cfif pages gt 1>
	<tr>
	<td colspan="7">
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
					<cfif nextOffset lt companiesCount>
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