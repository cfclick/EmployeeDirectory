/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component persistent="true" schema="EmployeeDirectory"{

	property name="office_id" ormtype="integer" type="numeric" fieldtype="id" generator="native";
	property name="office_name" type="string";
	property name="address1" type="string";
	property name="address2" type="string";
	property name="phone1" type="string";
	property name="phone2" type="string";
	property name="fax1" type="string";
	property name="fax2" type="string";
	property name="misc1" type="string";
	property name="misc2" type="string";

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote offices function init() {
		return This;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() {
		if (getoffice_id() eq 0 OR getoffice_id() eq ""){
			setoffice_id(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public offices function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "office_id") AND arguments.formstruct.office_id gt 0){

			var item = EntityLoad("offices", arguments.formstruct.office_id, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setoffice_id(arguments.formstruct.office_id);
			}
		}

		if (StructKeyExists(arguments.formstruct, "office_name")){
			This.setoffice_name(arguments.formstruct.office_name);
		}

		if (StructKeyExists(arguments.formstruct, "address1")){
			This.setaddress1(arguments.formstruct.address1);
		}

		if (StructKeyExists(arguments.formstruct, "address2")){
			This.setaddress2(arguments.formstruct.address2);
		}

		if (StructKeyExists(arguments.formstruct, "phone1")){
			This.setphone1(arguments.formstruct.phone1);
		}

		if (StructKeyExists(arguments.formstruct, "phone2")){
			This.setphone2(arguments.formstruct.phone2);
		}

		if (StructKeyExists(arguments.formstruct, "fax1")){
			This.setfax1(arguments.formstruct.fax1);
		}

		if (StructKeyExists(arguments.formstruct, "fax2")){
			This.setfax2(arguments.formstruct.fax2);
		}

		if (StructKeyExists(arguments.formstruct, "misc1")){
			This.setmisc1(arguments.formstruct.misc1);
		}

		if (StructKeyExists(arguments.formstruct, "misc2")){
			This.setmisc2(arguments.formstruct.misc2);
		}

		return This;
	}
}