<!--- departmentsBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.departments" type="any" default="" />
<cfset new = attributes.new />
<cfset departments = attributes.departments />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="departments.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="departments.cfm?method=edit&amp;dept_id=#departments.getdept_id()#">Edit</a> /
		<a href="departments.cfm?method=clone&amp;dept_id=#departments.getdept_id()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="departments.cfm?method=read&amp;dept_id=#departments.getdept_id()#">Read</a> /
		<a href="departments.cfm?method=clone&amp;dept_id=#departments.getdept_id()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="departments.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />