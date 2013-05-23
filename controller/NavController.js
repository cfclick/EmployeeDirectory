/**
 * @author shirakg
 */
EmployeeDirectory.controller('NavController', function($scope,EmployeeModel){
	
		EmployeeModel.listAsArray(false);
		alert('hi');
	
});