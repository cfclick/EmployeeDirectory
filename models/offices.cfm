<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.office_id" type="any" default="0" />
<cfparam name="url.orderby" type="string" default="office_id asc" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfparam name="url.q" type="string" default="" />
<cfimport path="EmployeeDirectory.models.cfc.*" />
<cf_pageWrapper>

<h2>Offices</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset officesArray = application.officesService.listPaged(url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.officesService.count() />
		<cf_officesBreadcrumb method="list"/>
		<cf_officesSearch q="#url.q#" />
		<cf_officesList orderby="#url.orderby#" officesArray = "#officesArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="searchresult">
		<cfset officesArray = application.officesService.searchPaged(url.q, url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.officesService.searchCount(url.q) />
		<cf_officesBreadcrumb method="list"/>
		<cf_officesSearch q="#url.q#" />
		<cf_officesList method="searchresult" q="#url.q#" orderby="#url.orderby#" officesArray = "#officesArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#"  totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset offices = application.officesService.get(url.office_id) />
		<cf_officesBreadcrumb method="read" offices = "#offices#"/>
		<cf_officesSearch q="#url.q#" />
		<cf_officesRead offices = "#offices#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.office_id eq 0>
			<cfset offices = New offices() />
			<cfset new = true />
		<cfelse>
			<cfset offices = application.officesService.get(url.office_id) />
			<cfset new = false />
		</cfif>
		<cf_officesBreadcrumb method="edit" offices = "#offices#"  new="#new#" /> 

		<cf_officesEdit offices = "#offices#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="clone">
		<cfset ref = application.officesService.get(url.office_id) />
		<cfset offices = entityNew("offices") />
		<cfset offices.setoffice_name(ref.getoffice_name())  />
		<cfset offices.setaddress1(ref.getaddress1())  />
		<cfset offices.setaddress2(ref.getaddress2())  />
		<cfset offices.setphone1(ref.getphone1())  />
		<cfset offices.setphone2(ref.getphone2())  />
		<cfset offices.setfax1(ref.getfax1())  />
		<cfset offices.setfax2(ref.getfax2())  />
		<cfset offices.setmisc1(ref.getmisc1())  />
		<cfset offices.setmisc2(ref.getmisc2())  />

		<cf_officesBreadcrumb method="new" offices = "#offices#"  new="true" /> 

		<cf_officesEdit offices = "#offices#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset offices = EntityNew("offices") />
		<cfset offices = offices.populate(form) />
		<cfset application.officesService.update(offices) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&office_id=#offices.getoffice_id()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
			<cfset offices = application.officesService.get(url.office_id) />
		<cfset application.officesService.destroy(offices) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>