<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.emp_id" type="any" default="0" />
<cfparam name="url.orderby" type="string" default="emp_id asc" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfparam name="url.q" type="string" default="" />
<cfimport path="EmployeeDirectory.models.cfc.*" />
<cf_pageWrapper>

<h2>Employees</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset employeesArray = application.employeesService.listPaged(url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.employeesService.count() />
		<cf_employeesBreadcrumb method="list"/>
		<cf_employeesSearch q="#url.q#" />
		<cf_employeesList orderby="#url.orderby#" employeesArray = "#employeesArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="searchresult">
		<cfset employeesArray = application.employeesService.searchPaged(url.q, url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.employeesService.searchCount(url.q) />
		<cf_employeesBreadcrumb method="list"/>
		<cf_employeesSearch q="#url.q#" />
		<cf_employeesList method="searchresult" q="#url.q#" orderby="#url.orderby#" employeesArray = "#employeesArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#"  totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset employees = application.employeesService.get(url.emp_id) />
		<cf_employeesBreadcrumb method="read" employees = "#employees#"/>
		<cf_employeesSearch q="#url.q#" />
		<cf_employeesRead employees = "#employees#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.emp_id eq 0>
			<cfset employees = New employees() />
			<cfset new = true />
		<cfelse>
			<cfset employees = application.employeesService.get(url.emp_id) />
			<cfset new = false />
		</cfif>
		<cf_employeesBreadcrumb method="edit" employees = "#employees#"  new="#new#" /> 

		<cf_employeesEdit employees = "#employees#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="clone">
		<cfset ref = application.employeesService.get(url.emp_id) />
		<cfset employees = entityNew("employees") />
		<cfset employees.setfirstname(ref.getfirstname())  />
		<cfset employees.setlastname(ref.getlastname())  />
		<cfset employees.setunit_id(ref.getunit_id())  />
		<cfset employees.setextension(ref.getextension())  />
		<cfset employees.setfirst_aid(ref.getfirst_aid())  />
		<cfset employees.setcpr(ref.getcpr())  />
		<cfset employees.setdept_id(ref.getdept_id())  />

		<cf_employeesBreadcrumb method="new" employees = "#employees#"  new="true" /> 

		<cf_employeesEdit employees = "#employees#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset employees = EntityNew("employees") />
		<cfset employees = employees.populate(form) />
		<cfset application.employeesService.update(employees) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&emp_id=#employees.getemp_id()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
			<cfset employees = application.employeesService.get(url.emp_id) />
		<cfset application.employeesService.destroy(employees) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>