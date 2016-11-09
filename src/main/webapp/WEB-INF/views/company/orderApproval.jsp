<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td align="center">item_code</td>
			<td align="center">item_name</td>
			<td align="center">count</td>
			<td align="center">category</td>
			<td align="center">area</td>
			<td align="center">p2_time</td>
			<td align="center">발주 승인</td>
		</tr>

		<!-- 	result는 controller의 addObject로 부터 가져온다. -->

		<c:forEach items="${orderList}" var="orderList">
			<form action="orderApproval" method="post">
				<input type="hidden" name="item_code" value="${orderList.item_code}"> 
				<input type="hidden" name="count" value="${orderList.count}"> 
				<input type="hidden" name="area" value="${orderList.area}">
			<tr>

				<td>${orderList.item_code}</td>
				<td>${orderList.item_name}</td>
				<td>${orderList.count}</td>
				<td>${orderList.category}</td>
				<td>${orderList.area}</td>
				<td>${orderList.p2_time}</td>
				<td><input type="submit" value="승인"></td>
			</tr>
			</form>
		</c:forEach>

	</table>
</body>
</html>