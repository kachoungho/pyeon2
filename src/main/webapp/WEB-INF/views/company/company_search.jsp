<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자/지점장 선택 후 리스트 출력</title>
</head>
<body>

	<form action="com_search" method="get">
		<select name="position">
			<option value="admin">관리자</option>
			<option value="manager">지점장</option>
		</select> &nbsp;&nbsp; <input type="submit" value="sorting">
		<a href="com_searchForm">전체검색</a> 
		<table>
			<tr>
				<td>ID</td>
				<td>NAME</td>
				<td>POSITION</td>
				<td>PHONE</td>
				<td>AGE</td>
				<td>ADDRESS</td>
				<td>GENDER</td>
				<td>AREA</td>
			</tr>

			<c:forEach items="${ result }" var="member">
				<tr>
					<td>${ member.id }</td>
					<td>${ member.name }</td>
					<td>${ member.position }</td>
					<td>${ member.phone }</td>
					<td>${ member.age }</td>
					<td>${ member.address }</td>
					<td>${ member.gender }</td>
					<td>${ member.area }</td>
				</tr>
			</c:forEach>

		</table>
	</form>
</body>
</html>