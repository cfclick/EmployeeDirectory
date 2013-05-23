<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.company_id" type="any" default="0" />
<cfparam name="url.orderby" type="string" default="company_id asc" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfparam name="url.q" type="string" default="" />
<cfimport path="EmployeeDirectory.models.cfc.*" />
<cf_pageWrapper>

<h2>Companies</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset companiesArray = application.companiesService.listPaged(url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.companiesService.count() />
		<cf_companiesBreadcrumb method="list"/>
		<cf_companiesSearch q="#url.q#" />
		<cf_companiesList orderby="#url.orderby#" companiesArray = "#companiesArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="searchresult">
		<cfset companiesArray = application.companiesService.searchPaged(url.q, url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.companiesService.searchCount(url.q) />
		<cf_companiesBreadcrumb method="list"/>
		<cf_companiesSearch q="#url.q#" />
		<cf_companiesList method="searchresult" q="#url.q#" orderby="#url.orderby#" companiesArray = "#companiesArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#"  totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset companies = application.companiesService.get(url.company_id) />
		<cf_companiesBreadcrumb method="read" companies = "#companies#"/>
		<cf_companiesSearch q="#url.q#" />
		<cf_companiesRead companies = "#companies#" /> 

		<h3>Departmentses</h3> 
		<cf_departmentsList message="" departmentsArray="#companies.getdepartmentses()#" /> 

	</cfcase>

	<cfcase value="edit">
		<cfif url.company_id eq 0>
			<cfset companies = New companies() />
			<cfset new = true />
		<cfelse>
			<cfset companies = application.companiesService.get(url.company_id) />
			<cfset new = false />
		</cfif>
		<cf_companiesBreadcrumb method="edit" companies = "#companies#"  new="#new#" /> 

		<cf_companiesEdit companies = "#companies#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="clone">
		<cfset ref = application.companiesService.get(url.company_id) />
		<cfset companies = entityNew("companies") />
		<cfset companies.setcompany_name(ref.getcompany_name())  />
		<cfset companies.setcompany_abbrv(ref.getcompany_abbrv())  />

		<cf_companiesBreadcrumb method="new" companies = "#companies#"  new="true" /> 

		<cf_companiesEdit companies = "#companies#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset companies = EntityNew("companies") />
		<cfset companies = companies.populate(form) />
		<cfset application.companiesService.update(companies) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&company_id=#companies.getcompany_id()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
			<cfset companies = application.companiesService.get(url.company_id) />
		<cfset application.companiesService.destroy(companies) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>