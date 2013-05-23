/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote departmentsService function init() {
		This.table = "departments";
		return This;
	}

	/**
	* @hint Returns the count of records in departments
	*/
	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from departments")[1];
	}

	/**
	* @hint Returns all of the records in departments.
	*/
	remote EmployeeDirectory.models.cfc.departments[] function list() {
		return entityLoad("departments", {}, "dept_id asc");
	}

	/**
	* @hint Returns all of the records in departments, with paging.
	*/
	remote EmployeeDirectory.models.cfc.departments[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="dept_id asc" ) {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("departments", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from departments.
	*/
	remote EmployeeDirectory.models.cfc.departments function get(required numeric id ) {
		return EntityLoad("departments", arguments.id, true);
	}

	/**
	* @hint Updates one record from departments.
	*/
	remote void function update(required any departments ) {
		arguments.departments.nullifyZeroID();
		EntitySave(arguments.departments);
	}

	/**
	* @hint Deletes one record from departments.
	*/
	remote void function destroy(required any departments ) {
		EntityDelete(arguments.departments);
	}

	/**
	* @hint Performs search against departments.
	*/
	remote EmployeeDirectory.models.cfc.departments[] function search(string q ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM departments";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " dept_name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone2 LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY dept_id asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against departments., with paging.
	*/
	remote EmployeeDirectory.models.cfc.departments[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="dept_id asc" ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM departments";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " dept_name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone2 LIKE '%#arguments.q#%'", "|");
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
		hqlString = hqlString & "FROM departments";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " dept_name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone2 LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}