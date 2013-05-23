<!--- dtpropertiesList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.dtpropertiesArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset dtpropertiesCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(dtpropertiesCount / attributes.maxresults) />


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
			<!--- Header for id --->
			<cfset idascOrDesc = (FindNoCase("id asc", url.orderby))? "desc" : "asc" />
			<cfset idascOrDescIcon = (FindNoCase("id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=id #idascOrDesc#&amp;q=#attributes.q#">Id #idascOrDescIcon#</a></th>

			<!--- Header for objectid --->
			<cfset objectidascOrDesc = (FindNoCase("objectid asc", url.orderby))? "desc" : "asc" />
			<cfset objectidascOrDescIcon = (FindNoCase("objectid asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=objectid #objectidascOrDesc#&amp;q=#attributes.q#">Objectid #objectidascOrDescIcon#</a></th>

			<!--- Header for property --->
			<cfset propertyascOrDesc = (FindNoCase("property asc", url.orderby))? "desc" : "asc" />
			<cfset propertyascOrDescIcon = (FindNoCase("property asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=property #propertyascOrDesc#&amp;q=#attributes.q#">Property #propertyascOrDescIcon#</a></th>

			<!--- Header for value --->
			<cfset valueascOrDesc = (FindNoCase("value asc", url.orderby))? "desc" : "asc" />
			<cfset valueascOrDescIcon = (FindNoCase("value asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=value #valueascOrDesc#&amp;q=#attributes.q#">Value #valueascOrDescIcon#</a></th>

			<!--- Header for lvalue --->
			<cfset lvalueascOrDesc = (FindNoCase("lvalue asc", url.orderby))? "desc" : "asc" />
			<cfset lvalueascOrDescIcon = (FindNoCase("lvalue asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=lvalue #lvalueascOrDesc#&amp;q=#attributes.q#">Lvalue #lvalueascOrDescIcon#</a></th>

			<!--- Header for version --->
			<cfset versionascOrDesc = (FindNoCase("version asc", url.orderby))? "desc" : "asc" />
			<cfset versionascOrDescIcon = (FindNoCase("version asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=version #versionascOrDesc#&amp;q=#attributes.q#">Version #versionascOrDescIcon#</a></th>

			<!--- Header for uvalue --->
			<cfset uvalueascOrDesc = (FindNoCase("uvalue asc", url.orderby))? "desc" : "asc" />
			<cfset uvalueascOrDescIcon = (FindNoCase("uvalue asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=uvalue #uvalueascOrDesc#&amp;q=#attributes.q#">Uvalue #uvalueascOrDescIcon#</a></th>

		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.dtpropertiesArray)#">
		<cfset dtproperties = attributes.dtpropertiesArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#dtproperties.getid()#</td>
			<td>#dtproperties.getobjectid()#</td>
			<td>#dtproperties.getproperty()#</td>
			<td>#dtproperties.getvalue()#</td>
			<td><cf_displayImage image="#dtproperties.getlvalue()#" maxheight="50" /></td>
			<td>#dtproperties.getversion()#</td>
			<td>#dtproperties.getuvalue()#</td>
			<td class="crudlink"><a href="dtproperties.cfm?method=read&id=#dtproperties.getid()#&property=#dtproperties.getproperty()#">Read</a></td>
			<td class="crudlink"><a href="dtproperties.cfm?method=edit&id=#dtproperties.getid()#&property=#dtproperties.getproperty()#">Edit</a></td>
			<td class="crudlink"><a href="dtproperties.cfm?method=delete_process&id=#dtproperties.getid()#&property=#dtproperties.getproperty()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
<cfif pages gt 1>
	<tr>
	<td colspan="10">
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
					<cfif nextOffset lt dtpropertiesCount>
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