<!--- officesList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.officesArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset officesCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(officesCount / attributes.maxresults) />


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
			<!--- Header for office_id --->
			<cfset office_idascOrDesc = (FindNoCase("office_id asc", url.orderby))? "desc" : "asc" />
			<cfset office_idascOrDescIcon = (FindNoCase("office_id asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=office_id #office_idascOrDesc#&amp;q=#attributes.q#">Office_id #office_idascOrDescIcon#</a></th>

			<!--- Header for office_name --->
			<cfset office_nameascOrDesc = (FindNoCase("office_name asc", url.orderby))? "desc" : "asc" />
			<cfset office_nameascOrDescIcon = (FindNoCase("office_name asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=office_name #office_nameascOrDesc#&amp;q=#attributes.q#">Office_name #office_nameascOrDescIcon#</a></th>

			<!--- Header for address1 --->
			<cfset address1ascOrDesc = (FindNoCase("address1 asc", url.orderby))? "desc" : "asc" />
			<cfset address1ascOrDescIcon = (FindNoCase("address1 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=address1 #address1ascOrDesc#&amp;q=#attributes.q#">Address1 #address1ascOrDescIcon#</a></th>

			<!--- Header for address2 --->
			<cfset address2ascOrDesc = (FindNoCase("address2 asc", url.orderby))? "desc" : "asc" />
			<cfset address2ascOrDescIcon = (FindNoCase("address2 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=address2 #address2ascOrDesc#&amp;q=#attributes.q#">Address2 #address2ascOrDescIcon#</a></th>

			<!--- Header for phone1 --->
			<cfset phone1ascOrDesc = (FindNoCase("phone1 asc", url.orderby))? "desc" : "asc" />
			<cfset phone1ascOrDescIcon = (FindNoCase("phone1 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=phone1 #phone1ascOrDesc#&amp;q=#attributes.q#">Phone1 #phone1ascOrDescIcon#</a></th>

			<!--- Header for phone2 --->
			<cfset phone2ascOrDesc = (FindNoCase("phone2 asc", url.orderby))? "desc" : "asc" />
			<cfset phone2ascOrDescIcon = (FindNoCase("phone2 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=phone2 #phone2ascOrDesc#&amp;q=#attributes.q#">Phone2 #phone2ascOrDescIcon#</a></th>

			<!--- Header for fax1 --->
			<cfset fax1ascOrDesc = (FindNoCase("fax1 asc", url.orderby))? "desc" : "asc" />
			<cfset fax1ascOrDescIcon = (FindNoCase("fax1 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=fax1 #fax1ascOrDesc#&amp;q=#attributes.q#">Fax1 #fax1ascOrDescIcon#</a></th>

			<!--- Header for fax2 --->
			<cfset fax2ascOrDesc = (FindNoCase("fax2 asc", url.orderby))? "desc" : "asc" />
			<cfset fax2ascOrDescIcon = (FindNoCase("fax2 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=fax2 #fax2ascOrDesc#&amp;q=#attributes.q#">Fax2 #fax2ascOrDescIcon#</a></th>

			<!--- Header for misc1 --->
			<cfset misc1ascOrDesc = (FindNoCase("misc1 asc", url.orderby))? "desc" : "asc" />
			<cfset misc1ascOrDescIcon = (FindNoCase("misc1 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=misc1 #misc1ascOrDesc#&amp;q=#attributes.q#">Misc1 #misc1ascOrDescIcon#</a></th>

			<!--- Header for misc2 --->
			<cfset misc2ascOrDesc = (FindNoCase("misc2 asc", url.orderby))? "desc" : "asc" />
			<cfset misc2ascOrDescIcon = (FindNoCase("misc2 asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=misc2 #misc2ascOrDesc#&amp;q=#attributes.q#">Misc2 #misc2ascOrDescIcon#</a></th>

		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.officesArray)#">
		<cfset offices = attributes.officesArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#offices.getoffice_id()#</td>
			<td>#offices.getoffice_name()#</td>
			<td>#offices.getaddress1()#</td>
			<td>#offices.getaddress2()#</td>
			<td>#offices.getphone1()#</td>
			<td>#offices.getphone2()#</td>
			<td>#offices.getfax1()#</td>
			<td>#offices.getfax2()#</td>
			<td>#offices.getmisc1()#</td>
			<td>#offices.getmisc2()#</td>
			<td class="crudlink"><a href="offices.cfm?method=read&office_id=#offices.getoffice_id()#">Read</a></td>
			<td class="crudlink"><a href="offices.cfm?method=edit&office_id=#offices.getoffice_id()#">Edit</a></td>
			<td class="crudlink"><a href="offices.cfm?method=delete_process&office_id=#offices.getoffice_id()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
<cfif pages gt 1>
	<tr>
	<td colspan="13">
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
					<cfif nextOffset lt officesCount>
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