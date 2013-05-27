/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component persistent="true" table="Supervisor" schema="EmployeeDirectory"{

	property name="sup_id" ormtype="integer" type="numeric" fieldtype="id" generator="native";
	property name="emp_id" ormtype="integer" type="numeric";
	property name="title_id" ormtype="integer" type="numeric";

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote supervisor function init() {
		return This;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() {
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public supervisor function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "sup_id")){
			This.setsup_id(arguments.formstruct.sup_id);
		}

		if (StructKeyExists(arguments.formstruct, "emp_id")){
			This.setemp_id(arguments.formstruct.emp_id);
		}

		if (StructKeyExists(arguments.formstruct, "title_id")){
			This.settitle_id(arguments.formstruct.title_id);
		}

		return This;
	}
}