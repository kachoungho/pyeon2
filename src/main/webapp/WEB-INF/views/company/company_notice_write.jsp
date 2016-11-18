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
	<form action="com_notice_list" method="post">
		<c:forEach items="${result }" var="list">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="hidden" value="${list.name }" name="name">${list.name }</td>
				</tr>
				<tr>
					<td>직급</td>
					<td><input type="hidden" value="${list.position }" name="position">${list.position }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="15" cols="50" name="contant"></textarea></td>
				</tr>
			</table>
			
			<input type="submit" value="글쓰기">
		</c:forEach>
	</form>
</body>
</html>