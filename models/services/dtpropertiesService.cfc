/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote dtpropertiesService function init() {
		This.table = "dtproperties";
		return This;
	}

	/**
	* @hint Returns the count of records in dtproperties
	*/
	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from dtproperties")[1];
	}

	/**
	* @hint Returns all of the records in dtproperties.
	*/
	remote EmployeeDirectory.models.cfc.dtproperties[] function list() {
		return entityLoad("dtproperties", {}, "property asc");
	}

	/**
	* @hint Returns all of the records in dtproperties, with paging.
	*/
	remote EmployeeDirectory.models.cfc.dtproperties[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="property asc" ) {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("dtproperties", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from dtproperties.
	*/
	remote EmployeeDirectory.models.cfc.dtproperties function get(required struct id ) {
		return EntityLoad("dtproperties", arguments.id, true);
	}

	/**
	* @hint Updates one record from dtproperties.
	*/
	remote void function update(required any dtproperties ) {
		arguments.dtproperties.nullifyZeroID();
		EntitySave(arguments.dtproperties);
	}

	/**
	* @hint Deletes one record from dtproperties.
	*/
	remote void function destroy(required any dtproperties ) {
		EntityDelete(arguments.dtproperties);
	}

	/**
	* @hint Performs search against dtproperties.
	*/
	remote EmployeeDirectory.models.cfc.dtproperties[] function search(string q ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM dtproperties";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " property LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " value LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " uvalue LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY property asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against dtproperties., with paging.
	*/
	remote EmployeeDirectory.models.cfc.dtproperties[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="property asc" ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM dtproperties";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " property LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " value LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " uvalue LIKE '%#arguments.q#%'", "|");
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
		hqlString = hqlString & "FROM dtproperties";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " property LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " value LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " uvalue LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}