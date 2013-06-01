 <cfscript>
	ORMReload();
	//applicationStop();
	/*	e = new cfc.Employee();
	writeDump(e);
	
	d = new cfc.Department();
	writeDump(d);  
	*/
	re = entityload("Department");
	writeDump(re);
	
	em = entityload("employee");
	writeDump(em);
	
/*	d.setName('Information Service');
	d.setDescription('IT (Information Services)');
	
	e.setFirstName('Shirak');
	e.setLastName('Avakian');
	e.setExtension(3322);
	a = [];
	arrayAppend(a,e);
	d.addEmployees(e);
	entitysave(d);
	//d.setEmployees(a);
	//  
	entitysave(e);
	writeDump(d);
	
	re = entityload("Department");
	writeDump(re);*/
</cfscript>
