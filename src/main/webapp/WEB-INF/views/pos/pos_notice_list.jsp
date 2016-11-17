<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<sec:authentication property="name" var="LoingUser" />
		<input type="hidden" name="id" value="${LoingUser}">
		<table>
			<tr>
				<td>No</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<c:forEach items="${result }" var="list">
				<tr>
					<td>${list.noticenum }</td>
					<td><a href="${pageContext.request.contextPath}/pos/ps_notice_contant?noticenum=${list.noticenum }">${list.title }</a></td>
					<td>${list.name}</td>
					<td>${list.noticedate }</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>