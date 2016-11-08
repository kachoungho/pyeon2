<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.pyeon2.vo.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td align="center">item_code</td>
		<td align="center">item_name</td>
		<td align="center">item_image</td>
		<td align="center">price</td>
		<td align="center">count</td>
		<td align="center">hit</td>
		<td align="center">category</td>
		<td align="center">area</td>
	</tr>
	
<!-- 	result는 controller의 addObject로 부터 가져온다. -->

	<c:forEach items="${result }" var="product">
		<tr>
			<td>${product.item_code }</td>
			<td>${product.item_name }</td>
			<td>${product.item_image }</td>
			<td>${product.price }</td>
			<td>${product.count }</td>
			<td>${product.hit }</td>
			<td>${product.category }</td>
			<td>${product.area }</td>
		</tr>
	</c:forEach>


</table>
</body>
</html>