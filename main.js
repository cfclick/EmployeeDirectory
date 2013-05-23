/**
 * @author shirakg
 */
       
var employeeDirectoryConfig = function ($routeProvider) {
            $routeProvider
            .when('/', { controller: 'HomeController', templateUrl: 'view/Home.html' })
            .when('/addEditEmp/:emp_id', { controller: 'EmployeeController', templateUrl: 'view/Employee.html' })
           // .when('/reloadEmployees', { controller: 'HomeController', templateUrl: 'view/Home.html' })
            .otherwise({ redirectTo: '/' });
        }

var EmployeeDirectory = angular.module("EmployeeDirectory",[]).config( employeeDirectoryConfig );
