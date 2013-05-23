/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component persistent="true" schema="dbo"{

	property name="dept_id" ormtype="integer" type="numeric" fieldtype="id" generator="native";
	property name="dept_name" type="string";
	property name="fax1" type="string";
	property name="company_id" fieldtype="many-to-one" cfc="companies" fkColumn="company_id" missingRowIgnored="true" inverse="true" remotingFetch="true";
	property name="fax2" type="string";
	property name="phone1" type="string";
	property name="phone2" type="string";
	property name="employeeses" fieldtype="one-to-many" cfc="employees" fkColumn="dept_id" cascade="all-delete-orphan" SingularName="employees" orderby="emp_id asc" remotingFetch="true";

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote departments function init() {
		return This;
	}

	/**
	* @hint Returns the count of related (one to many) records in employees
	*/
	public numeric function getemployeesCount() {
		var hql = "select employeeses.size from departments departments where departments.dept_id = '#This.getdept_id()#'";
		var result = ormExecuteQuery(hql)[1];
		return result;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() {
		if (getdept_id() eq 0 OR getdept_id() eq ""){
			setdept_id(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public departments function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "dept_id") AND arguments.formstruct.dept_id gt 0){

			var item = EntityLoad("departments", arguments.formstruct.dept_id, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setdept_id(arguments.formstruct.dept_id);
			}
		}

		if (StructKeyExists(arguments.formstruct, "dept_name")){
			This.setdept_name(arguments.formstruct.dept_name);
		}

		if (StructKeyExists(arguments.formstruct, "fax1")){
			This.setfax1(arguments.formstruct.fax1);
		}

		if (StructKeyExists(arguments.formstruct, "company_id")){
			company_id = entityLoad("companies", arguments.formStruct.company_id, true);
			This.setcompany_id(company_id);
		}

		if (StructKeyExists(arguments.formstruct, "fax2")){
			This.setfax2(arguments.formstruct.fax2);
		}

		if (StructKeyExists(arguments.formstruct, "phone1")){
			This.setphone1(arguments.formstruct.phone1);
		}

		if (StructKeyExists(arguments.formstruct, "phone2")){
			This.setphone2(arguments.formstruct.phone2);
		}

		return This;
	}
}