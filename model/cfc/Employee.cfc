component  displayname="Employee" output="false" persistent="true" table="employee"    
{
	property name="Id" column="Emp_PK" type="numeric" ormtype="int" fieldtype="id" generator="native" ;
	property name="firstName" column="FirstName" type="string" ormtype="string" length="50" ;
	property name="lastName" column="LastName" type="string" ormtype="string" length="50" ;  
	property name="extension" column="Extension" type="numeric" ormtype="int";    
	property name="Department" ormtype="int" fieldtype="many-to-one" cfc="Department" update="false" insert="false" fkcolumn="Dept_Pk" remotingfetch="true";               
}