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
	<h3>���� ���� ���</h3>
	<table>
		<tr>
			<th>����</th>
			<th>���� / ����</th>
			<th>�ݾ�</th>
			<th>����</th>
		</tr>
		<c:forEach items="${ result}" var="list">
			<tr>
				<td>${list.title }</td>
				<td>${list.content }</td>
				<td>${list.pay }</td>
				<td>${list.sal_time }</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td>����</td>
			<td>${pay1 }</td>
			<td>����</td>
			<td>${pay2 }</td>
		</tr>
		<tr>
			<td>������</td>
			<td></td>
			<td></td>
			<td>${total }</td>
		</tr>
	</table>
</body>
</html>