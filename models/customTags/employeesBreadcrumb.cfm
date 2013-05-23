<!--- employeesBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.employees" type="any" default="" />
<cfset new = attributes.new />
<cfset employees = attributes.employees />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="employees.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="employees.cfm?method=edit&amp;emp_id=#employees.getemp_id()#">Edit</a> /
		<a href="employees.cfm?method=clone&amp;emp_id=#employees.getemp_id()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="employees.cfm?method=read&amp;emp_id=#employees.getemp_id()#">Read</a> /
		<a href="employees.cfm?method=clone&amp;emp_id=#employees.getemp_id()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="employees.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />