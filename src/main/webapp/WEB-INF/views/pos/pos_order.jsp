<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.pyeon2.vo.*" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authentication property="name" var="name" />
<form action="${pageContext.request.contextPath}/pos/ps_order" method="post"><br>
상품 코드 : <input type="text" name="item_code" value="${item_code }">
상품 이름 : <input type="text" name="item_name" value="${item_name }">
상품 갯수 : <input type="text" name="count"><br>
상품 카테고리 : <input type="text" name="category" value="${category }">
지점 : <input type="text" name="area" value="${area }">
<input type="submit" value="신청">

</form>
<br>
	<table>
		<tr>
			<td>item_code</td>
			<td>item_name</td>
			<td>item_image</td>
			<td>cost</td>
			<td>price</td>
			<td>count</td>
			<td>category</td>
		</tr>
		
		<c:forEach items="${result}" var="list">
			<tr>
				<td>${list.item_code }</td>
				<td>${list.item_name }</td>
				<td><img src="${list.item_image }" width="50" height="50"></a></td>
				<td>${list.cost }</td>
				<td>${list.price }</td>
				<td>${list.count }</td>
				<td>${list.category }</td>
				<td>
					<input type="button" value="선 택" onclick="document.location.href='${pageContext.request.contextPath}/pos/ps_order?item_code=${list.item_code}&item_name=${list.item_name}&category=${list.category }&page=${pageMaker.cri.page }&name=${name}'">
				</td>
			</tr>
		</c:forEach>
		
	</table>

	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="${pageContext.request.contextPath}/pos/ps_order?page=${pageMaker.startPage - 1 }">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
				<a href="${pageContext.request.contextPath}/pos/ps_order?page=${idx}">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="${pageContext.request.contextPath}/pos/ps_order?page=${pageMaker.endPage + 1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>