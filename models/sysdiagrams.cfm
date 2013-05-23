<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.diagram_id" type="any" default="0" />
<cfparam name="url.orderby" type="string" default="diagram_id asc" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfparam name="url.q" type="string" default="" />
<cfimport path="EmployeeDirectory.models.cfc.*" />
<cf_pageWrapper>

<h2>Sysdiagrams</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset sysdiagramsArray = application.sysdiagramsService.listPaged(url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.sysdiagramsService.count() />
		<cf_sysdiagramsBreadcrumb method="list"/>
		<cf_sysdiagramsSearch q="#url.q#" />
		<cf_sysdiagramsList orderby="#url.orderby#" sysdiagramsArray = "#sysdiagramsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="searchresult">
		<cfset sysdiagramsArray = application.sysdiagramsService.searchPaged(url.q, url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.sysdiagramsService.searchCount(url.q) />
		<cf_sysdiagramsBreadcrumb method="list"/>
		<cf_sysdiagramsSearch q="#url.q#" />
		<cf_sysdiagramsList method="searchresult" q="#url.q#" orderby="#url.orderby#" sysdiagramsArray = "#sysdiagramsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#"  totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset sysdiagrams = application.sysdiagramsService.get(url.diagram_id) />
		<cf_sysdiagramsBreadcrumb method="read" sysdiagrams = "#sysdiagrams#"/>
		<cf_sysdiagramsSearch q="#url.q#" />
		<cf_sysdiagramsRead sysdiagrams = "#sysdiagrams#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.diagram_id eq 0>
			<cfset sysdiagrams = New sysdiagrams() />
			<cfset new = true />
		<cfelse>
			<cfset sysdiagrams = application.sysdiagramsService.get(url.diagram_id) />
			<cfset new = false />
		</cfif>
		<cf_sysdiagramsBreadcrumb method="edit" sysdiagrams = "#sysdiagrams#"  new="#new#" /> 

		<cf_sysdiagramsEdit sysdiagrams = "#sysdiagrams#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="clone">
		<cfset ref = application.sysdiagramsService.get(url.diagram_id) />
		<cfset sysdiagrams = entityNew("sysdiagrams") />
		<cfset sysdiagrams.setname(ref.getname())  />
		<cfset sysdiagrams.setprincipal_id(ref.getprincipal_id())  />
		<cfset sysdiagrams.setversion(ref.getversion())  />
		<cfset sysdiagrams.setdefinition(ref.getdefinition())  />

		<cf_sysdiagramsBreadcrumb method="new" sysdiagrams = "#sysdiagrams#"  new="true" /> 

		<cf_sysdiagramsEdit sysdiagrams = "#sysdiagrams#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">

		<!--- Process binary file insert or edit for definition --->
		<cfif structKeyExists(form, "definition___file") and len(form.definition___file) gt 0>
			<cfset fileName = createUUID() />
			<cfset tempPath = getTempDirectory() &  fileName  />
			<cffile action="upload" filefield="definition___file" destination="#tempPath#" nameconflict="overwrite"  />
			<cfset tempFile = fileReadBinary(tempPath) />
			<cfset form["definition"] = tempFile />
			<cfset structDelete(form, "definition___file") />
		</cfif>

		<cfset sysdiagrams = EntityNew("sysdiagrams") />
		<cfset sysdiagrams = sysdiagrams.populate(form) />

		<!--- Process binary file removal for definition --->
		<cfif structKeyExists(form, "definition___remove") and form.definition___remove>
			<cfset sysdiagrams.setdefinition(JavaCast("Null", "")) />
		</cfif>

		<cfset application.sysdiagramsService.update(sysdiagrams) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&diagram_id=#sysdiagrams.getdiagram_id()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
			<cfset sysdiagrams = application.sysdiagramsService.get(url.diagram_id) />
		<cfset application.sysdiagramsService.destroy(sysdiagrams) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>