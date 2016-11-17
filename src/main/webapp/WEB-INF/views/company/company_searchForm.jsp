<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자/지점장 리스트 출력</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/company/com_search" method="post">
		<select class="com_stock_select1" name="position">
			<option value="all">전체 검색</option>
			<option value="admin">관리자</option>
			<option value="manager">지점장</option>
		</select> &nbsp;&nbsp; 
		<input
			class="com_stock_button" width="40" type="image"
			src="/controller/resources/images/choice.png" alt="submit">
	</form>
<<<<<<< HEAD
	<br><br><br><br><br><br>
	
=======

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
				<td><input type="button" value="수정"
					onclick="document.location.href='${pageContext.request.contextPath}/company/com_updateForm?id=${member.id}'"></td>
				<td>
	 				<form action="${pageContext.request.contextPath}/company/com_delete"
					method="POST" name="${member.id}">

					<input type="hidden" name="id" value="${member.id}">
					<input type="submit" value="삭제"
						onclick="button_event('${member.id}');return false;" />
				</form>
				</td>
			</tr>
		</c:forEach>

	</table>

>>>>>>> 50a407557b6df51c345e52aaca676749d3d77ee8
</body>
</html>