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
	<table>
		<tr>
			<td>item_code</td>
			<td>item_name</td>
			<td>count</td>
			<td>category</td>
			<td>area</td>
			<td>발주 날짜</td>
			<td>발주 삭제</td>
		</tr>
		<c:forEach items="${result}" var="list">
			<tr>
				<td>${list.item_code}</td>
				<td>${list.item_name}</td>
				<td>${list.count}</td>
				<td>${list.category}</td>
				<td>${list.area}</td>
				<td>${list.p2_time}</td>
				<td class="date8"><input width="40" type="image"
					src="/controller/resources/images/delete.png" alt="button"
					onclick="document.location.href='ps_order_temp_delete?item_code=${list.item_code}&area=${list.area}&page=${pageMaker.cri.page }'">
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<form action="${pageContext.request.contextPath}/pos/ps_order_temp" method="post">
		<input type="hidden" value="${result }">
		<input type="submit" value="발주 신청">
	</form>
	
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }"></form>
				<li><a href="${pageContext.request.contextPath}/pos/ps_order_temp?page=${pageMaker.startPage - 1 }&item_code=${item_code}&area=${area}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
				<a href="${pageContext.request.contextPath}/pos/ps_order_temp?page=${idx}&item_code=${item_code}&area=${area}">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="${pageContext.request.contextPath}/pos/ps_order_temp?page=${pageMaker.endPage + 1 }&item_code=${item_code}&area=${area}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>