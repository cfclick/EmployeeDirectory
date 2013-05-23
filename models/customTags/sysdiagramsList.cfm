<!--- sysdiagramsList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.sysdiagramsArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset sysdiagramsCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(sysdiagramsCount / attributes.maxresults) />


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
			<!--- Header for name --->
			<cfset nameascOrDesc = (FindNoCase("name asc", url.orderby))? "desc" : "asc" />
			<cfset nameascOrDescIcon = (FindNoCase("name asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=name #nameascOrDesc#&amp;q=#attributes.q#">Name #nameascOrDescIcon#</a></th>

			<!--- Header for principal_id --->
			<cfset principal_idascOrDesc = (FindNoCase("principal_id asc", url.orderby))? "desc" : "asc" />
			<cfset principal_idascOrDescIcon = (FindNoCase("principal_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=principal_id #principal_idascOrDesc#&amp;q=#attributes.q#">Principal_id #principal_idascOrDescIcon#</a></th>

			<!--- Header for diagram_id --->
			<cfset diagram_idascOrDesc = (FindNoCase("diagram_id asc", url.orderby))? "desc" : "asc" />
			<cfset diagram_idascOrDescIcon = (FindNoCase("diagram_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=diagram_id #diagram_idascOrDesc#&amp;q=#attributes.q#">Diagram_id #diagram_idascOrDescIcon#</a></th>

			<!--- Header for version --->
			<cfset versionascOrDesc = (FindNoCase("version asc", url.orderby))? "desc" : "asc" />
			<cfset versionascOrDescIcon = (FindNoCase("version asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=version #versionascOrDesc#&amp;q=#attributes.q#">Version #versionascOrDescIcon#</a></th>

			<!--- Header for definition --->
			<cfset definitionascOrDesc = (FindNoCase("definition asc", url.orderby))? "desc" : "asc" />
			<cfset definitionascOrDescIcon = (FindNoCase("definition asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=definition #definitionascOrDesc#&amp;q=#attributes.q#">Definition #definitionascOrDescIcon#</a></th>

		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.sysdiagramsArray)#">
		<cfset sysdiagrams = attributes.sysdiagramsArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#sysdiagrams.getname()#</td>
			<td>#sysdiagrams.getprincipal_id()#</td>
			<td>#sysdiagrams.getdiagram_id()#</td>
			<td>#sysdiagrams.getversion()#</td>
			<td>[Cannot currently display binary files]</td>
			<td class="crudlink"><a href="sysdiagrams.cfm?method=read&diagram_id=#sysdiagrams.getdiagram_id()#">Read</a></td>
			<td class="crudlink"><a href="sysdiagrams.cfm?method=edit&diagram_id=#sysdiagrams.getdiagram_id()#">Edit</a></td>
			<td class="crudlink"><a href="sysdiagrams.cfm?method=delete_process&diagram_id=#sysdiagrams.getdiagram_id()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
<cfif pages gt 1>
	<tr>
	<td colspan="8">
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
					<cfif nextOffset lt sysdiagramsCount>
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