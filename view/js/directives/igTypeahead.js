EmployeeDirectory.directive('typeahead', function(EmployeeModel){
  return{
    restrict: 'E',
    replace: true,
    scope: {
      choice: '=',
      list: '='
    },
    template: '<input type="text" ng-model="choice" />',
    link: function(scope, element, attrs){
      scope.typeaheadElement = element;
      $(element).typeahead({
        source: scope.list,
		highlighter: function(item) {
			
			return JSON.parse(item).fullname;
		},
		matcher: function (item) {
			return JSON.parse(item).fullname.toLocaleLowerCase().indexOf(this.query.toLocaleLowerCase()) != -1;
		},
        updater: function(item){
           scope.$apply(function(){
           // scope.choice = EmployeeModel.get(JSON.parse(item).id);
		   scope.choice = JSON.parse(item);
          });
          return JSON.parse(item).fullname;
        }
      });
    }
  };
});
