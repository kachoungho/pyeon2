<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.pyeon2.vo.*" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td align="center">item_code</td>
			<td align="center">item_name</td>
			<td align="center">item_image</td>
			<td align="center">price</td>
			<td align="center">count</td>
			<td align="center">hit</td>
			<td align="center">category</td>
			<td align="center">area</td>
		</tr>

		<!-- 	result는 controller의 addObject로 부터 가져온다. -->
	
		<c:forEach items="${result }" var="product" varStatus="idx">
			<tr>
				<td>${product.item_code }</td>
				<td>${product.item_name }</td>
				<td>${product.item_image }</td>
				<td>${product.price }</td>
				<td>${product.count }</td>
				<td>${product.hit }</td>
				<td>${product.category }</td>
				<td>${product.area }</td>
				<td>
					<input type="button" value="삭제" onclick="document.location.href='ps_item_delete_now?item_code=${product.item_code}&area=${product.area}&page=${pageMaker.cri.page }'">
					<%-- <form action="itemdelete">	
						<input type="hidden" value="${product[idx.index].ItemVO.item_code}">
						<input type="hidden" value="${product[idx.index].ItemVO.area}">
						<input type="submit" value="삭제">
					</form> --%>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	
	<form action="ps_item_select_now" method="post">
		검색할 제품 : <input type="text" name="item_name">
		<input type="hidden" value="${pageMaker.cri.page }">
		<input type="submit" value="검색">
	</form>

	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="ps_item_select_now?page=${pageMaker.startPage - 1 }">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
				<a href="ps_item_select_now?page=${idx}">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="ps_item_select_now?page=${pageMaker.endPage + 1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>