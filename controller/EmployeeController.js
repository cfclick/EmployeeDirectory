/**
 * @author shirakg
 */
EmployeeDirectory.controller('EmployeeController', function($scope, $routeParams, EmployeeModel,DepartmentModel){
    
	$scope.deptarments = DepartmentModel.list();
	
	if ($routeParams.emp_id == 0) 
        $scope.title = "Add new Employee";
    else 
        if ($routeParams.emp_id > 0) {
            $scope.title = "Edit Employee";
            $scope.employee = EmployeeModel.get(this.selectedEmpId);
        }
        else {
   			$scope.title = "Invlid reques";
        }
	
	$scope.addNew = function (){
		//var empObj = {};
		
		alert($scope.employee);
		if($scope.employee != null)
		{
			var empObj = {};
			empObj.emp_id = 0;
			empObj.firstname = $scope.employee.firstname;
			empObj.lastname = $scope.employee.lastname;
			empObj.extension = $scope.employee.extension;
			empObj.dept_id = 2;
			empObj.unit_id = 1;
			empObj.first_aid = 'Y';
			empObj.cpr = 'Y';
			alert(JSON.stringify(empObj));
			EmployeeModel.update(JSON.stringify(empObj));
		}
		
	};
    
    //this.selectedEmpId = $routeParams.emp_id;

});
