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
			<option value="all">��ü����</option>
			<option value="����">����</option>
			<option value="����">����</option>
			<option value="�ν���Ʈ">�ν���Ʈ</option>
			<option value="�ַ�">�ַ�</option>
		</select> <input type="submit" value="�� ��">
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
				<td align="center">��    ��</td>
				<td align="center">�Һ��� ����</td>
				<td align="center">��� ����</td>	
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