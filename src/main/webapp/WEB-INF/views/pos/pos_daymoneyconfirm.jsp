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
	<h3>일일 정산 목록</h3>
	<table>
		<tr>
			<th>제목</th>
			<th>수입 / 지출</th>
			<th>금액</th>
			<th>날자</th>
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
			<td>수입</td>
			<td>${pay1 }</td>
			<td>지출</td>
			<td>${pay2 }</td>
		</tr>
		<tr>
			<td>순이익</td>
			<td></td>
			<td></td>
			<td>${total }</td>
		</tr>
	</table>
</body>
</html>