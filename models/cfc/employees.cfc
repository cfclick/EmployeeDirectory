/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component persistent="true" schema="dbo"{

	property name="emp_id" ormtype="integer" type="numeric" fieldtype="id" generator="native";
	property name="firstname" type="string";
	property name="lastname" type="string";
	property name="unit_id" ormtype="integer" type="numeric";
	property name="extension" type="string";
	property name="first_aid" type="string";
	property name="cpr" type="string";
	property name="dept_id" fieldtype="many-to-one" cfc="departments" fkColumn="dept_id" missingRowIgnored="true" inverse="true" remotingFetch="true";

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote employees function init() {
		return This;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() {
		if (getemp_id() eq 0 OR getemp_id() eq ""){
			setemp_id(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	remote employees function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "emp_id") AND arguments.formstruct.emp_id gt 0){

			var item = EntityLoad("employees", arguments.formstruct.emp_id, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setemp_id(arguments.formstruct.emp_id);
			}
		}

		if (StructKeyExists(arguments.formstruct, "firstname")){
			This.setfirstname(arguments.formstruct.firstname);
		}

		if (StructKeyExists(arguments.formstruct, "lastname")){
			This.setlastname(arguments.formstruct.lastname);
		}

		if (StructKeyExists(arguments.formstruct, "unit_id")){
			This.setunit_id(arguments.formstruct.unit_id);
		}

		if (StructKeyExists(arguments.formstruct, "extension")){
			This.setextension(arguments.formstruct.extension);
		}

		if (StructKeyExists(arguments.formstruct, "first_aid")){
			This.setfirst_aid(arguments.formstruct.first_aid);
		}

		if (StructKeyExists(arguments.formstruct, "cpr")){
			This.setcpr(arguments.formstruct.cpr);
		}

		if (StructKeyExists(arguments.formstruct, "dept_id")){
			dept_id = entityLoad("departments", arguments.formStruct.dept_id, true);
			This.setdept_id(dept_id);
		}

		return This;
	}
}