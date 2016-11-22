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
	<form action="ps_daymoneyconfirm" method="POST">
	<div style="float: left; width: 50%;">
		<table>
			<tr>
				<td colspan="4">수입</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>금액</td>
				<td>날자</td>
			</tr>
			<c:forEach items="${ result1}" var="list">
				<tr>
					<td>${list.sold }</td>
					<td>${list.pay }</td>
					<td>${list.sal_time }</td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<div style="float: right; width: 50%;">
			<table>
				<tr>
					<td colspan="4">수입</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>금액</td>
					<td>날자</td>
				</tr>
				<c:forEach items="${ result2}" var="list2">
					<tr>
						<td>${list2.spend }</td>
						<td>${list2.pay }</td>
						<td>${list2.sal_time }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<input type="hidden" value="${ area}" name="area" >
		<input type="submit" value="정산">
	</form>
</body>
</html>