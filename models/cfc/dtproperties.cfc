/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component persistent="true" schema="dbo"{

	property name="id" ormtype="integer" type="numeric" fieldtype="id" generator="native";
	property name="objectid" ormtype="integer" type="numeric";
	property name="property" type="string" fieldtype="id" generator="native";
	property name="value" type="string";
	property name="lvalue" type="binary";
	property name="version" ormtype="integer" type="numeric";
	property name="uvalue" type="string";

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote dtproperties function init() {
		return This;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() {
		if (getid() eq 0 OR getid() eq ""){
			setid(JavaCast("Null", ""));
		}
		if (getproperty() eq 0 OR getproperty() eq ""){
			setproperty(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public dtproperties function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "id") AND arguments.formstruct.id gt 0){

			var item = EntityLoad("dtproperties", arguments.formstruct.id, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setid(arguments.formstruct.id);
			}
		}

		if (StructKeyExists(arguments.formstruct, "objectid")){
			This.setobjectid(arguments.formstruct.objectid);
		}

		if (StructKeyExists(arguments.formstruct, "property") AND arguments.formstruct.property gt 0){

			var item = EntityLoad("dtproperties", arguments.formstruct.property, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setproperty(arguments.formstruct.property);
			}
		}

		if (StructKeyExists(arguments.formstruct, "value")){
			This.setvalue(arguments.formstruct.value);
		}

		if (StructKeyExists(arguments.formstruct, "lvalue")){
			This.setlvalue(arguments.formstruct.lvalue);
		}

		if (StructKeyExists(arguments.formstruct, "version")){
			This.setversion(arguments.formstruct.version);
		}

		if (StructKeyExists(arguments.formstruct, "uvalue")){
			This.setuvalue(arguments.formstruct.uvalue);
		}

		return This;
	}
}