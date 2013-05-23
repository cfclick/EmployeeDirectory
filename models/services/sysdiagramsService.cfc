/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote sysdiagramsService function init() {
		This.table = "sysdiagrams";
		return This;
	}

	/**
	* @hint Returns the count of records in sysdiagrams
	*/
	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from sysdiagrams")[1];
	}

	/**
	* @hint Returns all of the records in sysdiagrams.
	*/
	remote EmployeeDirectory.models.cfc.sysdiagrams[] function list() {
		return entityLoad("sysdiagrams", {}, "diagram_id asc");
	}

	/**
	* @hint Returns all of the records in sysdiagrams, with paging.
	*/
	remote EmployeeDirectory.models.cfc.sysdiagrams[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="diagram_id asc" ) {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("sysdiagrams", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from sysdiagrams.
	*/
	remote EmployeeDirectory.models.cfc.sysdiagrams function get(required numeric id ) {
		return EntityLoad("sysdiagrams", arguments.id, true);
	}

	/**
	* @hint Updates one record from sysdiagrams.
	*/
	remote void function update(required any sysdiagrams ) {
		arguments.sysdiagrams.nullifyZeroID();
		EntitySave(arguments.sysdiagrams);
	}

	/**
	* @hint Deletes one record from sysdiagrams.
	*/
	remote void function destroy(required any sysdiagrams ) {
		EntityDelete(arguments.sysdiagrams);
	}

	/**
	* @hint Performs search against sysdiagrams.
	*/
	remote EmployeeDirectory.models.cfc.sysdiagrams[] function search(string q ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM sysdiagrams";
		if (len(arguments.q) gt 0){
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY diagram_id asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against sysdiagrams., with paging.
	*/
	remote EmployeeDirectory.models.cfc.sysdiagrams[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="diagram_id asc" ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM sysdiagrams";
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
		hqlString = hqlString & "FROM sysdiagrams";
		if (len(arguments.q) gt 0){
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}