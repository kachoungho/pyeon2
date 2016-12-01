<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,com.pyeon2.vo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td align="center">이름</td>
			<td align="center">년</td>
			<td align="center">월</td>
			<td align="center">일</td>
			<td align="center">업무 시간</td>
			<td align="center">급여</td>
		</tr>
		<c:forEach items="${result}" var="user">
		<tr>
			<td>${user.userid }</td>
			<td>${user.year }</td>
			<td>${user.month }</td>
			<td>${user.day }</td>
			<td>${user.hour }</td>
			<td>${user.money }</td>
		</tr>
		</c:forEach>
		
	</table>
</body>
</html>