<!--- dtpropertiesBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.dtproperties" type="any" default="" />
<cfset new = attributes.new />
<cfset dtproperties = attributes.dtproperties />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="dtproperties.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="dtproperties.cfm?method=edit&amp;property=#dtproperties.getproperty()#">Edit</a> /
		<a href="dtproperties.cfm?method=clone&amp;property=#dtproperties.getproperty()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="dtproperties.cfm?method=read&amp;property=#dtproperties.getproperty()#">Read</a> /
		<a href="dtproperties.cfm?method=clone&amp;property=#dtproperties.getproperty()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="dtproperties.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />