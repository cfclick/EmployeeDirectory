<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.dept_id" type="any" default="0" />
<cfparam name="url.orderby" type="string" default="dept_id asc" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfparam name="url.q" type="string" default="" />
<cfimport path="EmployeeDirectory.models.cfc.*" />
<cf_pageWrapper>

<h2>Departments</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset departmentsArray = application.departmentsService.listPaged(url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.departmentsService.count() />
		<cf_departmentsBreadcrumb method="list"/>
		<cf_departmentsSearch q="#url.q#" />
		<cf_departmentsList orderby="#url.orderby#" departmentsArray = "#departmentsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="searchresult">
		<cfset departmentsArray = application.departmentsService.searchPaged(url.q, url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.departmentsService.searchCount(url.q) />
		<cf_departmentsBreadcrumb method="list"/>
		<cf_departmentsSearch q="#url.q#" />
		<cf_departmentsList method="searchresult" q="#url.q#" orderby="#url.orderby#" departmentsArray = "#departmentsArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#"  totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset departments = application.departmentsService.get(url.dept_id) />
		<cf_departmentsBreadcrumb method="read" departments = "#departments#"/>
		<cf_departmentsSearch q="#url.q#" />
		<cf_departmentsRead departments = "#departments#" /> 

		<h3>Employeeses</h3> 
		<cf_employeesList message="" employeesArray="#departments.getemployeeses()#" /> 

	</cfcase>

	<cfcase value="edit">
		<cfif url.dept_id eq 0>
			<cfset departments = New departments() />
			<cfset new = true />
		<cfelse>
			<cfset departments = application.departmentsService.get(url.dept_id) />
			<cfset new = false />
		</cfif>
		<cf_departmentsBreadcrumb method="edit" departments = "#departments#"  new="#new#" /> 

		<cf_departmentsEdit departments = "#departments#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="clone">
		<cfset ref = application.departmentsService.get(url.dept_id) />
		<cfset departments = entityNew("departments") />
		<cfset departments.setdept_name(ref.getdept_name())  />
		<cfset departments.setfax1(ref.getfax1())  />
		<cfset departments.setcompany_id(ref.getcompany_id())  />
		<cfset departments.setfax2(ref.getfax2())  />
		<cfset departments.setphone1(ref.getphone1())  />
		<cfset departments.setphone2(ref.getphone2())  />

		<cf_departmentsBreadcrumb method="new" departments = "#departments#"  new="true" /> 

		<cf_departmentsEdit departments = "#departments#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset departments = EntityNew("departments") />
		<cfset departments = departments.populate(form) />
		<cfset application.departmentsService.update(departments) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&dept_id=#departments.getdept_id()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
			<cfset departments = application.departmentsService.get(url.dept_id) />
		<cfset application.departmentsService.destroy(departments) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>