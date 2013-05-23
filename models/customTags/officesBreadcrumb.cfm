<!--- officesBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.offices" type="any" default="" />
<cfset new = attributes.new />
<cfset offices = attributes.offices />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="offices.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="offices.cfm?method=edit&amp;office_id=#offices.getoffice_id()#">Edit</a> /
		<a href="offices.cfm?method=clone&amp;office_id=#offices.getoffice_id()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="offices.cfm?method=read&amp;office_id=#offices.getoffice_id()#">Read</a> /
		<a href="offices.cfm?method=clone&amp;office_id=#offices.getoffice_id()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="offices.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />