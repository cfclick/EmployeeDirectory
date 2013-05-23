<!doctype html>
<html ng-app="EmployeeDirectory">
	<head>
		<title>CNI Employee Directory</title>
		<meta http-equiv="x-ua-compatible" content="IE=9,IE=8">
		<!--- lib --->
		<script src="libs/angular.min.js" type="application/javascript"></script>
		<!---End Lib --->

		<!--- Controllers --->
		<script src="main.js" ></script>
		<script src="controller/HomeController.js"></script>
		<script src="controller/EmployeeController.js"></script>
		<script src="controller/NavController.js"></script>
		<!--- end controllers --->

		<!--- models --->
		<script src="models/js/serviceFactory.js"></script>
		<!--- end models --->

		<!---Style sheet--->
		<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
		<!--- end stylesheet --->
	</head>
	<body >
		<div style="margin:5px">
			<div ng-controller="HomeController" class="btn-group">

			  <a href="#/" class="btn"  ><i class="icon-home"></i>CNI Employee Directory</button>
			  <a href="#/addEditEmp/0" class="btn" ><i class="icon-plus"></i></a>
			  <a class="btn" ng-click="fetchData()"><i class="icon-refresh"></i></a>
			</div>
			<div ng-view="">
			</div>
		</div>
	</body>
</html>
<cfajaxproxy cfc="models.services.employeesService" jsclassname="EmployeeServiceProxy" >
<cfajaxproxy cfc="models.services.departmentsService" jsclassname="DepartmentServiceProxy" >

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/bootstrap/js/jquery.js"></script>
<!--- <script src="assets/bootstrap/js/google-code-prettify/prettify.js"></script>--->
<script src="assets/bootstrap/js/bootstrap-transition.js"></script>
<script src="assets/bootstrap/js/bootstrap-alert.js"></script>
<script src="assets/bootstrap/js/bootstrap-modal.js"></script>
<script src="assets/bootstrap/js/bootstrap-dropdown.js"></script>
<script src="assets/bootstrap/js/bootstrap-scrollspy.js"></script>
<script src="assets/bootstrap/js/bootstrap-tab.js"></script>
<script src="assets/bootstrap/js/bootstrap-tooltip.js"></script>
<script src="assets/bootstrap/js/bootstrap-popover.js"></script>
<script src="assets/bootstrap/js/bootstrap-button.js"></script>
<script src="assets/bootstrap/js/bootstrap-collapse.js"></script>
<script src="assets/bootstrap/js/bootstrap-carousel.js"></script>
<script src="assets/bootstrap/js/bootstrap-typeahead.js"></script>
<script src="assets/bootstrap/js/application.js"></script>

