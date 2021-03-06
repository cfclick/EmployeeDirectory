﻿<!doctype html>
<html ng-app="EmployeeDirectory">
	<head>
		<title>CNI Employee Directory</title>
		<meta http-equiv="x-ua-compatible" content="IE=9">
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
		<script src="model/js/serviceFactory.js"></script>
		<!--- end models --->

		<!--- directives --->
		<script src="view/js/directives/igTypeahead.js"></script>
		<!--- end directives --->

		<!---Style sheet--->
		<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/employeeDirectory.css" />
		<!--- end stylesheet --->
	</head>
	<body ng-controller='mainCtrl' >
		<div style="margin:5px">
			<div class="btn-group">

			  <a href="#/" class="btn"  ><i class="icon-home"></i> CNI Employee Directory</button>
			  <a href="#/addEditEmp/0" class="btn" ><i class="icon-plus"></i></a>
			  <a class="btn" ng-click="fetchData()"><i class="icon-refresh"></i></a>
			</div>
			<div ng-view="">
			</div>
		</div>
	</body>
</html>
<cfajaxproxy cfc="model.services.EmployeeService" jsclassname="EmployeeServiceProxy" >
<script>
	var onSocketOpen = function(msg){
		alert(JSON.stringify(msg));
	};
	
	var onMessageHandler = function(messageobj){
		alert(JSON.stringify(messageobj));
		};
	
	var onErrorHandler = function(err){
		alert(JSON.stringify(err));
	};
</script>

<cfwebsocket name="EmployeeDirectoy_Socket" 
			 subscribeto="EmpDirChannel" 
			 onmessage="onMessageHandler" 
			 onerror="onErrorHandler" 
			 onopen="onSocketOpen">

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/bootstrap/js/jquery.js"></script>
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

