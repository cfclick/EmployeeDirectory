/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component persistent="true" schema="EmployeeDirectory"{

	property name="company_id" ormtype="integer" type="numeric" fieldtype="id" generator="native";
	property name="company_name" type="string";
	property name="company_abbrv" type="string";
	property name="departmentses" fieldtype="one-to-many" cfc="departments" fkColumn="company_id" cascade="all-delete-orphan" SingularName="departments" orderby="dept_id asc" remotingFetch="true";

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote companies function init() {
		return This;
	}

	/**
	* @hint Returns the count of related (one to many) records in departments
	*/
	public numeric function getdepartmentsCount() {
		var hql = "select departmentses.size from companies companies where companies.company_id = '#This.getcompany_id()#'";
		var result = ormExecuteQuery(hql)[1];
		return result;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() {
		if (getcompany_id() eq 0 OR getcompany_id() eq ""){
			setcompany_id(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public companies function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "company_id") AND arguments.formstruct.company_id gt 0){

			var item = EntityLoad("companies", arguments.formstruct.company_id, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setcompany_id(arguments.formstruct.company_id);
			}
		}

		if (StructKeyExists(arguments.formstruct, "company_name")){
			This.setcompany_name(arguments.formstruct.company_name);
		}

		if (StructKeyExists(arguments.formstruct, "company_abbrv")){
			This.setcompany_abbrv(arguments.formstruct.company_abbrv);
		}

		return This;
	}
}