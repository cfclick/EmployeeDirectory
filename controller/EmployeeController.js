/**
 * @author shirakg
 */
EmployeeDirectory.controller('EmployeeController', function($scope, $routeParams, EmployeeModel){

    $scope.deptarments = EmployeeModel.getAllDepartments();
	
    if ($routeParams.Id == 0) 
        $scope.title = "Add new Employee";
    else 
        if ($routeParams.Id > 0) {
            $scope.title = "Edit Employee";
            $scope.employee = EmployeeModel.get($routeParams.Id);          
            for (var i = 0; i < $scope.deptarments.length; i++) {
                if ($scope.deptarments[i].dept_id == $scope.employee.dept_id.dept_id) {
                    $scope.dept = $scope.deptarments[i];
                    break;
                }
            }
        }
        else {
            $scope.title = "Invlid reques";
        }
    
    $scope.addNew = function(){
    
      //  alert(JSON.stringify($scope.dept));
		
		var empId = 0;
		if($scope.employee.emp_id > 0 )
			empId = $scope.employee.emp_id;
			alert(empId);
        if ($scope.employee != null) {
            var empObj = {};
            empObj.emp_id = empId;
            empObj.firstname = $scope.employee.firstname;
            empObj.lastname = $scope.employee.lastname;
            empObj.extension = $scope.employee.extension;
            empObj.dept_id = $scope.dept.dept_id;
            empObj.unit_id = 1;
            empObj.first_aid = 'Y';
            empObj.cpr = 'Y';
          //  alert(JSON.stringify(empObj));
            EmployeeModel.update(JSON.stringify(empObj));
        }
        
    };
});
