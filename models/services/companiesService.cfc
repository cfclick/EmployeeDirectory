/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote companiesService function init() {
		This.table = "companies";
		return This;
	}

	/**
	* @hint Returns the count of records in companies
	*/
	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from companies")[1];
	}

	/**
	* @hint Returns all of the records in companies.
	*/
	remote EmployeeDirectory.models.cfc.companies[] function list() {
		return entityLoad("companies", {}, "company_id asc");
	}

	/**
	* @hint Returns all of the records in companies, with paging.
	*/
	remote EmployeeDirectory.models.cfc.companies[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="company_id asc" ) {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("companies", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from companies.
	*/
	remote EmployeeDirectory.models.cfc.companies function get(required numeric id ) {
		return EntityLoad("companies", arguments.id, true);
	}

	/**
	* @hint Updates one record from companies.
	*/
	remote void function update(required any companies ) {
		arguments.companies.nullifyZeroID();
		EntitySave(arguments.companies);
	}

	/**
	* @hint Deletes one record from companies.
	*/
	remote void function destroy(required any companies ) {
		EntityDelete(arguments.companies);
	}

	/**
	* @hint Performs search against companies.
	*/
	remote EmployeeDirectory.models.cfc.companies[] function search(string q ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM companies";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " company_name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " company_abbrv LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY company_id asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against companies., with paging.
	*/
	remote EmployeeDirectory.models.cfc.companies[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="company_id asc" ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM companies";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " company_name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " company_abbrv LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY #arguments.orderby#";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Determines total number of results of search for paging purposes.
	*/
	remote numeric function searchCount(string q ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "SELECT count(*) ";
		hqlString = hqlString & "FROM companies";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " company_name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " company_abbrv LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}