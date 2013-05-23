component{

	This.name = "dsnShirakG_Phone";
	This.ormenabled = true;
	This.datasource = "dsnShirakG_Phone";
	This.customTagPaths = GetDirectoryFromPath(GetCurrentTemplatePath()) & "customtags";
	This.ormsettings.eventHandler = "EmployeeDirectory.models.cfc.eventHandler";
	This.ormsettings.dbcreate = "update";
	This.ormsettings.logSQL = true;


	public boolean function onRequestStart() {

		if (structKeyExists(url, "reset_app")){
			ApplicationStop();
			location(cgi.script_name, false);
		}

		return true;
	}

	public boolean function onApplicationStart() {
		application.departmentsService = new EmployeeDirectory.models.services.departmentsService();
		application.unitsService = new EmployeeDirectory.models.services.unitsService();
		application.companiesService = new EmployeeDirectory.models.services.companiesService();
		application.dtpropertiesService = new EmployeeDirectory.models.services.dtpropertiesService();
		application.supervisorService = new EmployeeDirectory.models.services.supervisorService();
		application.employeesService = new EmployeeDirectory.models.services.employeesService();
		application.sysdiagramsService = new EmployeeDirectory.models.services.sysdiagramsService();
		application.officesService = new EmployeeDirectory.models.services.officesService();
		return true;
	}
}