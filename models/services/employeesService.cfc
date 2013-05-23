/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote employeesService function init() {
		This.table = "employees";
		return This;
	}

	remote EmployeeDirectory.models.cfc.employees function getEmployeeObject(){
		return new EmployeeDirectory.models.cfc.employees();
	}

	/**
	* @hint Returns the count of records in employees
	*/
	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from employees")[1];
	}

	/**
	* @hint Returns all of the records in employees.
	*/
	remote EmployeeDirectory.models.cfc.employees[] function list() {
		if(structkeyexists(application, 'emp'))
			return application.emp;
		else
			application.emp = entityLoad("employees", {}, "emp_id asc");
		return application.emp;
	}

	remote array function listAsArray() {

		var emp = entityLoad("employees", {}, "firstname asc");

		for( var i = 1; i <= arraylen(emp); i++ ){
			ar[i]= emp[i].getfirstname() & ' ' & emp[i].getlastname() & ' (' & emp[i].getextension() & ')';
		}

		return ar;
	}

	/**
	* @hint Returns all of the records in employees, with paging.
	*/
	remote EmployeeDirectory.models.cfc.employees[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="emp_id asc" ) {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("employees", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from employees.
	*/
	remote EmployeeDirectory.models.cfc.employees function get(required numeric id ) {
		return EntityLoad("employees", arguments.id, true);
	}

	/**
	* @hint Updates one record from employees.
	*/
	remote void function update(required any employees ) {

		var employee = new EmployeeDirectory.models.cfc.employees();
		employee.nullifyZeroID();
		if(isJSON(arguments.employees))
		{
			var emp = deserializeJSON( arguments.employees);

			employee..populate(emp);
		}

		EntitySave(employee);
	}

	/**
	* @hint Deletes one record from employees.
	*/
	remote void function destroy(required any employees ) {
		EntityDelete(arguments.employees);
	}

	/**
	* @hint Performs search against employees.
	*/
	remote EmployeeDirectory.models.cfc.employees[] function search(string q ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM employees";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " firstname LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " lastname LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " extension LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " first_aid LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " cpr LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY emp_id asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against employees., with paging.
	*/
	remote EmployeeDirectory.models.cfc.employees[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="emp_id asc" ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM employees";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " firstname LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " lastname LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " extension LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " first_aid LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " cpr LIKE '%#arguments.q#%'", "|");
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
		hqlString = hqlString & "FROM employees";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " firstname LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " lastname LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " extension LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " first_aid LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " cpr LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}