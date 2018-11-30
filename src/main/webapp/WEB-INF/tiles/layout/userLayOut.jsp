<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="tiles-extras" uri="http://tiles.apache.org/tags-tiles-extras" %>
<%
	String Ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>WelCome Bstory</title>

    <!-- Favicon -->
    <link rel="icon" href="<%=Ctx %>/resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="<%=Ctx %>/resources/css/style.css" rel="stylesheet">
    
</head>
<body>

	<!-- Preloader -->
    <div id="preloader">
        <div class="dorne-load"></div>
    </div>

	<div class="contentHeader">
		<tiles:insertAttribute name="header"/>
	</div>
  	<br /><br /><br /><br /><br />
  	
   	
   	<tiles:insertAttribute name="body" />   
   	
   	<%-- <tiles:insertAttribute name="footer"/> --%>
   	
    <!-- jQuery-2.2.4 js -->
    <script src="<%=Ctx %>/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="<%=Ctx %>/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap-4 js -->
    <script src="<%=Ctx %>/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="<%=Ctx %>/resources/js/others/plugins.js"></script>
    <!-- Active JS -->
    <script src="<%=Ctx %>/resources/js/active.js"></script>
    
    <!-- Popup -->
    <script src="<%=Ctx %>/resources/js/sweetalert.min.js"></script>
    
</body>
</html>