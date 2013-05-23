<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.unit_id" type="any" default="0" />
<cfparam name="url.dept_id" type="any" default="0" />
<cfparam name="url.orderby" type="string" default="dept_id asc" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfparam name="url.q" type="string" default="" />
<cfimport path="EmployeeDirectory.models.cfc.*" />
<cf_pageWrapper>

<h2>Units</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset unitsArray = application.unitsService.listPaged(url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.unitsService.count() />
		<cf_unitsBreadcrumb method="list"/>
		<cf_unitsSearch q="#url.q#" />
		<cf_unitsList orderby="#url.orderby#" unitsArray = "#unitsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="searchresult">
		<cfset unitsArray = application.unitsService.searchPaged(url.q, url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.unitsService.searchCount(url.q) />
		<cf_unitsBreadcrumb method="list"/>
		<cf_unitsSearch q="#url.q#" />
		<cf_unitsList method="searchresult" q="#url.q#" orderby="#url.orderby#" unitsArray = "#unitsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#"  totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset keys = {} />
		<cfset keys["unit_id"] = url["unit_id"] />
		<cfset keys["dept_id"] = url["dept_id"] />
		<cfset units = application.unitsService.get(keys) />
		<cf_unitsBreadcrumb method="read" units = "#units#"/>
		<cf_unitsSearch q="#url.q#" />
		<cf_unitsRead units = "#units#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.dept_id eq 0>
			<cfset units = New units() />
			<cfset new = true />
		<cfelse>
			<cfset keys = {} />
			<cfset keys["unit_id"] = url["unit_id"] />
			<cfset keys["dept_id"] = url["dept_id"] />
			<cfset units = application.unitsService.get(keys) />
			<cfset new = false />
		</cfif>
		<cf_unitsBreadcrumb method="edit" units = "#units#"  new="#new#" /> 

		<cf_unitsEdit units = "#units#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="clone">
			<cfset keys = {} />
			<cfset keys["unit_id"] = url["unit_id"] />
			<cfset keys["dept_id"] = url["dept_id"] />
		<cfset ref = application.unitsService.get(keys) />
		<cfset units = entityNew("units") />
		<cfset units.setunit_name(ref.getunit_name())  />

		<cf_unitsBreadcrumb method="new" units = "#units#"  new="true" /> 

		<cf_unitsEdit units = "#units#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset units = EntityNew("units") />
		<cfset units = units.populate(form) />
		<cfset application.unitsService.update(units) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&dept_id=#units.getdept_id()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
			<cfset keys = {} />
			<cfset keys["unit_id"] = url["unit_id"] />
			<cfset keys["dept_id"] = url["dept_id"] />
			<cfset units = application.unitsService.get(keys) />
		<cfset application.unitsService.destroy(units) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>