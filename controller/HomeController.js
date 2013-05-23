/**
 * @author shirakg
 */
EmployeeDirectory.controller('HomeController', function($scope,$routeParams,$window,EmployeeModel){
	$scope.title = "Search";
	 
	$scope.employees = JSON.parse($window.localStorage.getItem('emplist'));
	//alert($scope.employees);
	if(!$scope.employees){
		alert('no local');
		$scope.employees = EmployeeModel.listAsArray();
		$window.localStorage.setItem('emplist',JSON.stringify($scope.employees));
	}
			
	$("#searchfield").typeahead({
        minLength: 3,
        source: $scope.employees
    });
	
	$scope.fetchData = function(){
		localStorage.removeItem('emplist');
		
		$window.refresh();
		//alert('hi home');
	};
	
	$scope.selectedEmpId = $routeParams.emp_id;
	
	
});
