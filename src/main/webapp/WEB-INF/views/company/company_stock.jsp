<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<form action="${pageContext.request.contextPath}/company/com_stock" method="post">
		<input type="hidden" value="${pageMaker.cri.page }">
		<select name="area">
			<option value="�Ǳ�">�� �� ��</option>
			<option value="����">�� �� ��</option>	
		</select>
		<select name="category">
			<option value="">category</option>
 			<option value="����">����</option>
  			<option value="����">����</option>
  			<option value="�ν���Ʈ">�ν���Ʈ</option>
  			<option value="�ַ�">�ַ�</option>
		</select>
		�˻��� ��ǰ : <input type="text" name="item_name">
		<input type="submit" value="�� ��"/>
	</form>
	
	<c:if test="${result == null}">
		<br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br>
	</c:if>
	
	<c:if test="${result != null}">
	<br><br><br>
		<table>
			<tr>
				<td align="center">��ǰ �̹���</td>
				<td align="center">ī �� �� ��</td>
				<td align="center">�� ǰ �� ��</td>
				<td align="center">�� ǰ ��</td>			
				<td align="center">�Һ��� ����</td>
				<td align="center">��� ����</td>
				<td align="center">�� �� ��</td>			
				<td align="center">��    ��</td>
			</tr>
		
			<c:forEach items="${result}" var="list">
				<tr>
				<td align="center"><img width="30" height="60" src="${list.item_image }"></td>
				<td align="center">${list.category}</td>
				<td align="center">${list.item_code}</td>
				<td align="center">${list.item_name}</td>
				<td align="center">${list.price}</td>
				<td align="center">${list.count}</td>
				<td align="center">${list.hit}</td>
				<td align="center">${list.area}</td>
			</tr>
			</c:forEach>
		</table>
	</c:if>

	<br>
	
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="${pageContext.request.contextPath}/company/com_stock?page=${pageMaker.startPage - 1 }&item_name=${item_name}&category=${category}&area=${area}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
				<a href="${pageContext.request.contextPath}/company/com_stock?page=${idx}&item_name=${item_name}&category=${category}&area=${area}">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="${pageContext.request.contextPath}/company/com_stock?page=${pageMaker.endPage + 1 }&item_name=${item_name}&category=${category}&area=${area}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>