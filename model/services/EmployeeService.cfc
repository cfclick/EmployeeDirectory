component  output="false"
{
	remote array function getAllEmployees(){
		var ar = [];
		var emp = entityLoad("Employee",{},'firstName asc' );
		var str = {};
		for( var i=1; i <= arraylen(emp); i++ )
		{
			str = emp[i];
			str['fullname']= emp[i].getfirstName() & ' ' & emp[i].getlastName() & ' (' & emp[i].getextension() & ')';
			ar[i] = serializeJSON(str);
		}		
		return ar;
	}
	
	remote cfc.Department[] function getAllDepartments(){
		return entityload("Department");
	}
}