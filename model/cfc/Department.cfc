component  output="false" persistent="true" table="Department"   
{
	property name="Id" column="Dept_Pk" fkcolumn=""  ormtype="int" fieldtype="id"  generator="native" type="numeric";
	property name="name" column="Name" ormtype="string" length="200" type="string";
	property name="description" column="Description" ormtype="text" type="string";
	//property name="employees" fieldtype="one-to-many" cfc="Employee" fkcolumn="Emp_PK" type="array";          
}