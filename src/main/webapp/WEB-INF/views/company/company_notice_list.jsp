<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>
	<sec:authentication property="name" var="LoingUser" />
	<form
		action="${pageContext.request.contextPath}/company/com_notice_write"
		method="post">
		<input type="hidden" name="id" value="${LoingUser}">
		<table class="ex1">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제 목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>

			<c:forEach items="${result }" var="list">
				<tbody>
					<tr class="odd">
						<td class="date2">${list.noticenum }</td>
						<td class="date2"><a
							href="${pageContext.request.contextPath}/company/com_notice_contant?noticenum=${list.noticenum }">${list.title }</a></td>
						<td class="date2">${list.name}</td>
						<td class="date2">${list.noticedate }</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<br> <input style="display: block; float: right; margin-right: 70px;" width="40"
			type="image" src="/controller/resources/images/write.png"
			alt="submit">
	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>