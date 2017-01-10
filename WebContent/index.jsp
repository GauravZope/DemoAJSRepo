<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script LANGUAGE="JavaScript" TYPE="text/javascript" src="/AJS_With_HTTP_Java/js/angular.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
var myHTTPAJsApp = angular.module("myHTTPAJsApp", [])
						.controller("myAjsHttpCtrl", function($scope,$http) {
							$scope.getDataFromServer = function() {
								
								$http({
									method: 'GET',
									url : 'javaAngularJS'
								}).success(function(data, status, headers, config) {
									$scope.person = data;
								}).error(function(data, status, headers, config) {
									// called asynchronously if an error occurs
									// or server returns response with an error status.
								});
							};
						});
</script>
<title>Welcome Page</title>
</head>
<body data-ng-app="myHTTPAJsApp">
<div data-ng-controller="myAjsHttpCtrl">
<button data-ng-click="getDataFromServer()">Click Me!!!</button><br>
First Name : {{person.firstName }}<br>
Last Name: {{ person.lastName }}<br>
</div>
</body>
</html>