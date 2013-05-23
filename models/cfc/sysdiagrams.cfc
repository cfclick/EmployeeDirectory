/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component persistent="true" schema="dbo"{

	property name="name" type="string";
	property name="principal_id" ormtype="integer" type="numeric";
	property name="diagram_id" ormtype="integer" type="numeric" fieldtype="id" generator="native";
	property name="version" ormtype="integer" type="numeric";
	property name="definition" type="binary";

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote sysdiagrams function init() {
		return This;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() {
		if (getdiagram_id() eq 0 OR getdiagram_id() eq ""){
			setdiagram_id(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public sysdiagrams function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "name")){
			This.setname(arguments.formstruct.name);
		}

		if (StructKeyExists(arguments.formstruct, "principal_id")){
			This.setprincipal_id(arguments.formstruct.principal_id);
		}

		if (StructKeyExists(arguments.formstruct, "diagram_id") AND arguments.formstruct.diagram_id gt 0){

			var item = EntityLoad("sysdiagrams", arguments.formstruct.diagram_id, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setdiagram_id(arguments.formstruct.diagram_id);
			}
		}

		if (StructKeyExists(arguments.formstruct, "version")){
			This.setversion(arguments.formstruct.version);
		}

		if (StructKeyExists(arguments.formstruct, "definition")){
			This.setdefinition(arguments.formstruct.definition);
		}

		return This;
	}
}