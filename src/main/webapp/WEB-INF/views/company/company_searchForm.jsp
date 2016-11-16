<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자/지점장 리스트 출력</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/company/com_search" method="post">
		<select name="position">
			<option value="all">전체 검색</option>
			<option value="admin">관리자</option>
			<option value="manager">지점장</option>
		</select> &nbsp;&nbsp; <input type="submit" value="sorting">
	</form>

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

</body>
</html>