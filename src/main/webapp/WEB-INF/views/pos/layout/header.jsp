<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<h1>Header에 들어갈 부분 css필요</h1>
<se:authentication property="name" var="LoingUser" />


<se:authorize access="hasAuthority('ROLE_USER')">
	(${LoingUser})님 로그인 중
	<a href="usermoneyfinsh?id=${LoingUser}">로 그 아 웃</a>
</se:authorize>

<se:authorize access="hasAuthority('ROLE_MANAGER')">
	(${LoingUser})님 로그인 중
	<a href="${pageContext.request.contextPath}/j_spring_security_logout">로 그 아 웃</a>
</se:authorize>



<%-- <a href="${pageContext.request.contextPath}/j_spring_security_logout">로그아웃</a> --%>