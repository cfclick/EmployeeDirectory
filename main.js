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
	
	$scope.fetchData = function(){
		$window.localStorage.removeItem('emplist');		
		$location.url('#/');
	};
	
	/*
$scope.onMessageHandler = function(msg){
		alert(JSON.stringify(msg));
	};
*/
	
	/*
$scope.onErrorHandler = function(err){
		alert(JSON.stringify(err));
	};
*/
	
	/*
$scope.onSocketOpen = function(msg){
		alert(JSON.stringify(msg));
	};
*/
}


