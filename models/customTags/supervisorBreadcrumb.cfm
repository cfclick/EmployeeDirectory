<!--- supervisorBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.supervisor" type="any" default="" />
<cfset new = attributes.new />
<cfset supervisor = attributes.supervisor />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="supervisor.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="supervisor.cfm?method=edit&amp;sup_id=#supervisor.getsup_id()#">Edit</a> /
		<a href="supervisor.cfm?method=clone&amp;sup_id=#supervisor.getsup_id()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="supervisor.cfm?method=read&amp;sup_id=#supervisor.getsup_id()#">Read</a> /
		<a href="supervisor.cfm?method=clone&amp;sup_id=#supervisor.getsup_id()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="supervisor.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />