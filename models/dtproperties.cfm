<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.id" type="any" default="0" />
<cfparam name="url.property" type="any" default="0" />
<cfparam name="url.orderby" type="string" default="property asc" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfparam name="url.q" type="string" default="" />
<cfimport path="EmployeeDirectory.models.cfc.*" />
<cf_pageWrapper>

<h2>Dtproperties</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset dtpropertiesArray = application.dtpropertiesService.listPaged(url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.dtpropertiesService.count() />
		<cf_dtpropertiesBreadcrumb method="list"/>
		<cf_dtpropertiesSearch q="#url.q#" />
		<cf_dtpropertiesList orderby="#url.orderby#" dtpropertiesArray = "#dtpropertiesArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="searchresult">
		<cfset dtpropertiesArray = application.dtpropertiesService.searchPaged(url.q, url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.dtpropertiesService.searchCount(url.q) />
		<cf_dtpropertiesBreadcrumb method="list"/>
		<cf_dtpropertiesSearch q="#url.q#" />
		<cf_dtpropertiesList method="searchresult" q="#url.q#" orderby="#url.orderby#" dtpropertiesArray = "#dtpropertiesArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#"  totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset keys = {} />
		<cfset keys["id"] = url["id"] />
		<cfset keys["property"] = url["property"] />
		<cfset dtproperties = application.dtpropertiesService.get(keys) />
		<cf_dtpropertiesBreadcrumb method="read" dtproperties = "#dtproperties#"/>
		<cf_dtpropertiesSearch q="#url.q#" />
		<cf_dtpropertiesRead dtproperties = "#dtproperties#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.property eq 0>
			<cfset dtproperties = New dtproperties() />
			<cfset new = true />
		<cfelse>
			<cfset keys = {} />
			<cfset keys["id"] = url["id"] />
			<cfset keys["property"] = url["property"] />
			<cfset dtproperties = application.dtpropertiesService.get(keys) />
			<cfset new = false />
		</cfif>
		<cf_dtpropertiesBreadcrumb method="edit" dtproperties = "#dtproperties#"  new="#new#" /> 

		<cf_dtpropertiesEdit dtproperties = "#dtproperties#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="clone">
			<cfset keys = {} />
			<cfset keys["id"] = url["id"] />
			<cfset keys["property"] = url["property"] />
		<cfset ref = application.dtpropertiesService.get(keys) />
		<cfset dtproperties = entityNew("dtproperties") />
		<cfset dtproperties.setobjectid(ref.getobjectid())  />
		<cfset dtproperties.setvalue(ref.getvalue())  />
		<cfset dtproperties.setlvalue(ref.getlvalue())  />
		<cfset dtproperties.setversion(ref.getversion())  />
		<cfset dtproperties.setuvalue(ref.getuvalue())  />

		<cf_dtpropertiesBreadcrumb method="new" dtproperties = "#dtproperties#"  new="true" /> 

		<cf_dtpropertiesEdit dtproperties = "#dtproperties#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">

		<!--- Process binary file insert or edit for lvalue --->
		<cfif structKeyExists(form, "lvalue___file") and len(form.lvalue___file) gt 0>
			<cfset fileName = createUUID() />
			<cfset tempPath = getTempDirectory() &  fileName  />
			<cffile action="upload" filefield="lvalue___file" destination="#tempPath#" nameconflict="overwrite"  />
			<cfset tempFile = fileReadBinary(tempPath) />
			<cfset form["lvalue"] = tempFile />
			<cfset structDelete(form, "lvalue___file") />
		</cfif>

		<cfset dtproperties = EntityNew("dtproperties") />
		<cfset dtproperties = dtproperties.populate(form) />

		<!--- Process binary file removal for lvalue --->
		<cfif structKeyExists(form, "lvalue___remove") and form.lvalue___remove>
			<cfset dtproperties.setlvalue(JavaCast("Null", "")) />
		</cfif>

		<cfset application.dtpropertiesService.update(dtproperties) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&property=#dtproperties.getproperty()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
			<cfset keys = {} />
			<cfset keys["id"] = url["id"] />
			<cfset keys["property"] = url["property"] />
			<cfset dtproperties = application.dtpropertiesService.get(keys) />
		<cfset application.dtpropertiesService.destroy(dtproperties) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>