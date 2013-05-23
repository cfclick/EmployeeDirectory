/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote unitsService function init() {
		This.table = "units";
		return This;
	}

	/**
	* @hint Returns the count of records in units
	*/
	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from units")[1];
	}

	/**
	* @hint Returns all of the records in units.
	*/
	remote EmployeeDirectory.models.cfc.units[] function list() {
		return entityLoad("units", {}, "dept_id asc");
	}

	/**
	* @hint Returns all of the records in units, with paging.
	*/
	remote EmployeeDirectory.models.cfc.units[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="dept_id asc" ) {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("units", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from units.
	*/
	remote EmployeeDirectory.models.cfc.units function get(required struct id ) {
		return EntityLoad("units", arguments.id, true);
	}

	/**
	* @hint Updates one record from units.
	*/
	remote void function update(required any units ) {
		arguments.units.nullifyZeroID();
		EntitySave(arguments.units);
	}

	/**
	* @hint Deletes one record from units.
	*/
	remote void function destroy(required any units ) {
		EntityDelete(arguments.units);
	}

	/**
	* @hint Performs search against units.
	*/
	remote EmployeeDirectory.models.cfc.units[] function search(string q ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM units";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " unit_name LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY dept_id asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against units., with paging.
	*/
	remote EmployeeDirectory.models.cfc.units[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="dept_id asc" ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM units";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " unit_name LIKE '%#arguments.q#%'", "|");
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
		hqlString = hqlString & "FROM units";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " unit_name LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}