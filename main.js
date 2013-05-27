/**
 * @author shirakg
 */
       
var employeeDirectoryConfig = function ($routeProvider) {
            $routeProvider
            .when('/', { controller: 'HomeController', templateUrl: 'view/Home.html' })
            .when('/addEditEmp/:emp_id', { controller: 'EmployeeController', templateUrl: 'view/Employee.html' })
            .when('/department', { controller: 'HomeController', templateUrl: 'view/Department.html' })
            .otherwise({ redirectTo: '/' });
        }

var EmployeeDirectory = angular.module("EmployeeDirectory",[]).config( employeeDirectoryConfig );

 function mainCtrl($scope,$window,$location){
	//alert('hello');
	
	$scope.fetchData = function(){
		//alert('fetch data');
		$window.localStorage.removeItem('emplist');
		
		$location.url('#/');
		//alert('hi home');
	};
}
