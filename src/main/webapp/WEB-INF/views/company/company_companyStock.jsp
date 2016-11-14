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
	<form action="${pageContext.request.contextPath}/company/com_companyStock" method="post">
		<select name="category">
			<option value="all">전체보기</option>
			<option value="음료">음료</option>
			<option value="스낵">스낵</option>
			<option value="인스턴트">인스턴트</option>
			<option value="주류">주류</option>
		</select> <input type="submit" value="선 택">
	</form>
	
	<c:if test="${result == null}">
		<br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br>
	</c:if>
	
	<c:if test="${result != null}">
	<br><br><br>
		<table>
			<tr>
				<td align="center">상품 이미지</td>
				<td align="center">카 테 고 리</td>
				<td align="center">상 품 코 드</td>
				<td align="center">상 품 명</td>	
				<td align="center">원    가</td>
				<td align="center">소비자 가격</td>
				<td align="center">재고 수량</td>	
			</tr>
		
			<c:forEach items="${result}" var="list">
				<tr>
					<td align="center"><img width="30" height="60" src="${list.item_image }"></td>
					<td align="center">${list.category}</td>
					<td align="center">${list.item_code}</td>
					<td align="center">${list.item_name}</td>
					<td align="center">${list.cost}</td>
					<td align="center">${list.price}</td>
					<td align="center">${list.count}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>