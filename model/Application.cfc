component  output="false"
{
	this.name = "EmployeeDirectoryService";
	this.ormSettings.autogenmap = "true";
	this.datasource = "dsnEmployeeDirectorySQL";
	this.ormEnabled = true;
	this.ormsettings.dbcreate = "update";//dropcreate
	this.rootDir = getDirectoryFromPath(getCurrentTemplatePath());
	this.mappings[ "/cfc" ] = "#this.rootDir#cfc/";
	
}