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

	<form action="${pageContext.request.contextPath}/company/com_delete"
		method="POST">
		<c:forEach items="${ list }" var="member">
			<table>
				<tr>
					<td>${ member.id }님의 정보를 정말 삭제하시겠습니까?</td>
					<td>
					<input type="hidden" name="id" value="${ member.id }">
					<input type="submit" value="삭제"></td>
				</tr>
			</table>
		</c:forEach>
	</form>

</body>
</html>