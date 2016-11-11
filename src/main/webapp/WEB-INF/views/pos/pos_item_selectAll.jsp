<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, com.pyeon2.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td align="center">상품 이미지</td>
			<td align="center">카 테 고 리</td>
			<td align="center">상 품 코 드</td>
			<td align="center">상 품 명</td>			
			<td align="center">소비자 가격</td>
			<td align="center">재고 수량</td>
			<td align="center">판 매 량</td>			
			<td align="center">지    점</td>
		</tr>

		<!-- 	result는 controller의 addObject로 부터 가져온다. -->

		<c:forEach items="${result }" var="product">
			<tr>
				<td align="center"><img width="30" height="60" src="${product.item_image }"></td>
				<td align="center">${product.category }</td>
				<td align="center">${product.item_code }</td>
				<td align="center">${product.item_name }</td>
				<td align="center">${product.price }</td>
				<td align="center">${product.count }</td>
				<td align="center">${product.hit }</td>
				<td align="center">${product.area }</td>
			</tr>
		</c:forEach>


	</table>
</body>
</html>