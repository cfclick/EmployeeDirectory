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
	
	
			
	/*$("#searchfield").typeahead({
        minLength: 3,
        source: $scope.employees,
		highlighter: function(item) {
			return JSON.parse(item).fullname;
		},
		matcher: function (item) {
			return JSON.parse(item).fullname.toLocaleLowerCase().indexOf(this.query.toLocaleLowerCase()) != -1;
		},
		updater: function (item,$scope) {
			alert($scope);
                        scope.employeeDetail= EmployeeModel.get(JSON.parse(item).id);
                    
			//$scope.employeeDetail = EmployeeModel.get(JSON.parse(item).id);
			//$scope.emp = $scope.employeeDetail;
			alert(scope.employeeDetail );
			if(scope.employeeDetail.firstname.length > 0 )
				$('.slidingDiv').show();
			else
				$('.slidingDiv').hide();
			
			return JSON.parse(item).fullname;
		}
    });*/
	
});
