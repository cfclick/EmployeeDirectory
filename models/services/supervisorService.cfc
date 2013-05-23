/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote supervisorService function init() {
		This.table = "Supervisor";
		return This;
	}

	/**
	* @hint Returns the count of records in supervisor
	*/
	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from supervisor")[1];
	}

	/**
	* @hint Returns all of the records in supervisor.
	*/
	remote EmployeeDirectory.models.cfc.supervisor[] function list() {
		return entityLoad("supervisor", {}, "sup_id asc");
	}

	/**
	* @hint Returns all of the records in supervisor, with paging.
	*/
	remote EmployeeDirectory.models.cfc.supervisor[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="sup_id asc" ) {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("supervisor", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from supervisor.
	*/
	remote EmployeeDirectory.models.cfc.supervisor function get(required numeric id ) {
		return EntityLoad("supervisor", arguments.id, true);
	}

	/**
	* @hint Updates one record from supervisor.
	*/
	remote void function update(required any supervisor ) {
		arguments.supervisor.nullifyZeroID();
		EntitySave(arguments.supervisor);
	}

	/**
	* @hint Deletes one record from supervisor.
	*/
	remote void function destroy(required any supervisor ) {
		EntityDelete(arguments.supervisor);
	}

	/**
	* @hint Performs search against supervisor.
	*/
	remote EmployeeDirectory.models.cfc.supervisor[] function search(string q ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM supervisor";
		if (len(arguments.q) gt 0){
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY sup_id asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against supervisor., with paging.
	*/
	remote EmployeeDirectory.models.cfc.supervisor[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="sup_id asc" ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM supervisor";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
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
		hqlString = hqlString & "FROM supervisor";
		if (len(arguments.q) gt 0){
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}