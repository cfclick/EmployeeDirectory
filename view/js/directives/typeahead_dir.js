/**
 * @author shirakg
 */
EmployeeDirectory.directive("userTypeahead", function($scope,$window,EmployeeModel){

    //searchUsers function removed for brevity, but it goes here
	$scope.employees = JSON.parse($window.localStorage.getItem('emplist'));
	alert('here');
    return {
        restrict: 'A'
        ,link: function(scope, element, attrs){

            element.typeahead({
                source: scope.employees
                , updater: function (item) {
                    scope.employeeDetail= EmployeeModel.get(JSON.parse(item).id);
                    return '';
                }
                , items: 10
            });

        }
    };
});