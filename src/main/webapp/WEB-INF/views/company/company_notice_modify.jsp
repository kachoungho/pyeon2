<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


</head>
				
<body>
	<form action="${pageContext.request.contextPath}/company/com_notice_contant" method="post">
		<c:forEach items="${result }" var="list">
			<input type="hidden" value="${ list.noticenum}" name="noticenum">
			<table>
				<tr>
					<td>����</td>
					<td><input type="text" name="title" value="${list.title }"></td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td>${list.name }</td>
				</tr>
				<tr>
					<td>����</td>
					<td>${list.position }</td>
				</tr>
				<tr>
					<td>����</td>
					<td><textarea rows="15" cols="50" name="contant">${list.contant }</textarea>
				</tr>
			</table>
			<input type="submit" value = "���� �Ϸ�" />
		</c:forEach>
	</form>
</body>
</html>