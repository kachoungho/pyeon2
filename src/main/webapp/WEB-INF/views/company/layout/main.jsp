<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">

.menu {
	margin: auto; 
	height: 40px;
	
}

.body {
	/* margin-left: 310px; */
	height: 100%;
}

.header {
	height: 100px;
	background-color: red;
}

.footer {
	height: 100px;
	background-color: red;
}

</style>
<title>스프링 프로젝트</title>
</head>
<body>
	<div class="test">
		<div class="header">
			<tiles:insertAttribute name="header" />
		</div>

		<div class="menu">
			<tiles:insertAttribute name="menu" />
		</div>
		
		<div class="body">
			<tiles:insertAttribute name="body" />
		</div>

		<div class="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

</body>
</html>