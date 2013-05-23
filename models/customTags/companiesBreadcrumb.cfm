<!--- companiesBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.companies" type="any" default="" />
<cfset new = attributes.new />
<cfset companies = attributes.companies />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="companies.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="companies.cfm?method=edit&amp;company_id=#companies.getcompany_id()#">Edit</a> /
		<a href="companies.cfm?method=clone&amp;company_id=#companies.getcompany_id()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="companies.cfm?method=read&amp;company_id=#companies.getcompany_id()#">Read</a> /
		<a href="companies.cfm?method=clone&amp;company_id=#companies.getcompany_id()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="companies.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />