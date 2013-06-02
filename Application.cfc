component  output="false"
{
	
	this.name = "EmployeeDirectoryService";
	this.rootDir = getDirectoryFromPath(getCurrentTemplatePath());
	this.mappings[ "/cfc" ] = "#this.rootDir#model/cfc/";
	this.datasource = "dsnEmployeeDirectorySQL";
	
	//ORM Setting
	this.ormSettings.autogenmap = "true";	
	this.ormEnabled = true;
	this.ormsettings.dbcreate = "update";//dropcreate
	
	//Socket
	this.wschannels = [{name='EmpDirChannel'}];
}