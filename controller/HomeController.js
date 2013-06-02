/**
 * @author shirakg
 */
EmployeeDirectory.controller('HomeController', function($scope,$routeParams,$window,EmployeeModel){
	$scope.title = "Search";
	
	$scope.employees = JSON.parse($window.localStorage.getItem('emplist'));
	//alert($scope.employees);
	if(!$scope.employees){
		alert('no local');
		$scope.employees = EmployeeModel.getAllEmployees();
		$window.localStorage.setItem('emplist',JSON.stringify($scope.employees));
	}
	
});
