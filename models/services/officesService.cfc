/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote officesService function init() {
		This.table = "offices";
		return This;
	}

	/**
	* @hint Returns the count of records in offices
	*/
	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from offices")[1];
	}

	/**
	* @hint Returns all of the records in offices.
	*/
	remote EmployeeDirectory.models.cfc.offices[] function list() {
		return entityLoad("offices", {}, "office_id asc");
	}

	/**
	* @hint Returns all of the records in offices, with paging.
	*/
	remote EmployeeDirectory.models.cfc.offices[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="office_id asc" ) {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("offices", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from offices.
	*/
	remote EmployeeDirectory.models.cfc.offices function get(required numeric id ) {
		return EntityLoad("offices", arguments.id, true);
	}

	/**
	* @hint Updates one record from offices.
	*/
	remote void function update(required any offices ) {
		arguments.offices.nullifyZeroID();
		EntitySave(arguments.offices);
	}

	/**
	* @hint Deletes one record from offices.
	*/
	remote void function destroy(required any offices ) {
		EntityDelete(arguments.offices);
	}

	/**
	* @hint Performs search against offices.
	*/
	remote EmployeeDirectory.models.cfc.offices[] function search(string q ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM offices";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " office_name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " address1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " address2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " misc1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " misc2 LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY office_id asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against offices., with paging.
	*/
	remote EmployeeDirectory.models.cfc.offices[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="office_id asc" ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM offices";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " office_name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " address1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " address2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " misc1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " misc2 LIKE '%#arguments.q#%'", "|");
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
		hqlString = hqlString & "FROM offices";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " office_name LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " address1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " address2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " phone2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " fax2 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " misc1 LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " misc2 LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}