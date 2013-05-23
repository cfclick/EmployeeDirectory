/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component persistent="true" schema="dbo"{

	property name="unit_id" ormtype="integer" type="numeric" fieldtype="id" generator="assigned";
	property name="dept_id" ormtype="integer" type="numeric" fieldtype="id" generator="assigned";
	property name="unit_name" type="string";

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote units function init() {
		return This;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() {
		if (getunit_id() eq 0 OR getunit_id() eq ""){
			setunit_id(JavaCast("Null", ""));
		}
		if (getdept_id() eq 0 OR getdept_id() eq ""){
			setdept_id(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public units function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "unit_id") AND arguments.formstruct.unit_id gt 0){

			var item = EntityLoad("units", arguments.formstruct.unit_id, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setunit_id(arguments.formstruct.unit_id);
			}
		}

		if (StructKeyExists(arguments.formstruct, "dept_id") AND arguments.formstruct.dept_id gt 0){

			var item = EntityLoad("units", arguments.formstruct.dept_id, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setdept_id(arguments.formstruct.dept_id);
			}
		}

		if (StructKeyExists(arguments.formstruct, "unit_name")){
			This.setunit_name(arguments.formstruct.unit_name);
		}

		return This;
	}
}