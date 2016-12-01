<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authorize ifAnyGranted="ROLE_ADMIN">
		<meta http-equiv="Refresh" content="0; url=company">
	</sec:authorize>
	<sec:authorize ifAnyGranted="ROLE_USER ,ROLE_MANAGER">
		<meta http-equiv="Refresh" content="0; url=pos">
	</sec:authorize>
	
	
	<c:url value="/j_spring_security_check" var="loginURL"></c:url>
	<form action="${loginURL}" method="post">
		<fieldset>
			<legend class="hidden">로그인 폼</legend>
			<ul id="loginBox">
				<li><label for="id">아이디</label> <input name="j_username"
					class="text" /></li>
				<li><label for="pwd">비밀번호</label> <input type="password"
					name="j_password" class="text" /></li>
			</ul>
			<p>
				<input type="submit" value="Login" />
			</p>
		</fieldset>
	</form>

</body>
</html>