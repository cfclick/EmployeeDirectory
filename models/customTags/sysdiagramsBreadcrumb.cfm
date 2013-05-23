<!--- sysdiagramsBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.sysdiagrams" type="any" default="" />
<cfset new = attributes.new />
<cfset sysdiagrams = attributes.sysdiagrams />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="sysdiagrams.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="sysdiagrams.cfm?method=edit&amp;diagram_id=#sysdiagrams.getdiagram_id()#">Edit</a> /
		<a href="sysdiagrams.cfm?method=clone&amp;diagram_id=#sysdiagrams.getdiagram_id()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="sysdiagrams.cfm?method=read&amp;diagram_id=#sysdiagrams.getdiagram_id()#">Read</a> /
		<a href="sysdiagrams.cfm?method=clone&amp;diagram_id=#sysdiagrams.getdiagram_id()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="sysdiagrams.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />