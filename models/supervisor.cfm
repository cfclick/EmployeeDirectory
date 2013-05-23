<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.sup_id" type="any" default="0" />
<cfparam name="url.orderby" type="string" default="sup_id asc" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfparam name="url.q" type="string" default="" />
<cfimport path="EmployeeDirectory.models.cfc.*" />
<cf_pageWrapper>

<h2>Supervisor</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset supervisorArray = application.supervisorService.listPaged(url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.supervisorService.count() />
		<cf_supervisorBreadcrumb method="list"/>
		<cf_supervisorSearch q="#url.q#" />
		<cf_supervisorList orderby="#url.orderby#" supervisorArray = "#supervisorArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="searchresult">
		<cfset supervisorArray = application.supervisorService.searchPaged(url.q, url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.supervisorService.searchCount(url.q) />
		<cf_supervisorBreadcrumb method="list"/>
		<cf_supervisorSearch q="#url.q#" />
		<cf_supervisorList method="searchresult" q="#url.q#" orderby="#url.orderby#" supervisorArray = "#supervisorArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#"  totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset supervisor = application.supervisorService.get(url.sup_id) />
		<cf_supervisorBreadcrumb method="read" supervisor = "#supervisor#"/>
		<cf_supervisorSearch q="#url.q#" />
		<cf_supervisorRead supervisor = "#supervisor#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.sup_id eq 0>
			<cfset supervisor = New supervisor() />
			<cfset new = true />
		<cfelse>
			<cfset supervisor = application.supervisorService.get(url.sup_id) />
			<cfset new = false />
		</cfif>
		<cf_supervisorBreadcrumb method="edit" supervisor = "#supervisor#"  new="#new#" /> 

		<cf_supervisorEdit supervisor = "#supervisor#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="clone">
		<cfset ref = application.supervisorService.get(url.sup_id) />
		<cfset supervisor = entityNew("supervisor") />
		<cfset supervisor.setsup_id(ref.getsup_id())  />
		<cfset supervisor.setemp_id(ref.getemp_id())  />
		<cfset supervisor.settitle_id(ref.gettitle_id())  />

		<cf_supervisorBreadcrumb method="new" supervisor = "#supervisor#"  new="true" /> 

		<cf_supervisorEdit supervisor = "#supervisor#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset supervisor = EntityNew("supervisor") />
		<cfset supervisor = supervisor.populate(form) />
		<cfset application.supervisorService.update(supervisor) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&sup_id=#supervisor.getsup_id()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
			<cfset supervisor = application.supervisorService.get(url.sup_id) />
		<cfset application.supervisorService.destroy(supervisor) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>