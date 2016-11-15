<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	function button_event(btn) {
		var name = btn;
		var val = document.forms[name].elements['id'].value;

		if (val != null) {
			if (confirm("[" + val + "]" + "님의 정보를 정말로 삭제하시겠습니까?") == true) {
				document.forms[name].submit();
			} else {
				return false;
			}
		}
	}
</script>

<title>아르바이트 멤버 현황</title>
</head>
<body>
	<sec:authentication property="name" var="LoingUser" />
	<sec:authorize access="hasAuthority('ROLE_MANAGER')">
		<a href="${pageContext.request.contextPath}/pos/ps_user_insertForm?id=${LoingUser}">회원정보입력</a>
	</sec:authorize>

	<table>
		<tr>
			<td>ID</td>
			<td>NAME</td>
			<td>POSITION</td>
			<td>PHONE</td>
			<td>AGE</td>
			<td>ADDRESS</td>
			<td>GENDER</td>
			<td>AREA</td>
			<td>TIME</td>
		</tr>

		<c:forEach items="${ list }" var="member">
			<tr>
				<td>${ member.id }</td>
				<td>${ member.name }</td>
				<td>${ member.position }</td>
				<td>${ member.phone }</td>
				<td>${ member.age }</td>
				<td>${ member.address }</td>
				<td>${ member.gender }</td>
				<td>${ member.area }</td>
				<td>${ member.optime }</td>
				<td><input type="button" value="수정"
					onclick="document.location.href='${pageContext.request.contextPath}/pos/ps_user_updateForm?id=${member.id}'"></td>
				<td>
					<form
						action="${pageContext.request.contextPath}/pos/ps_user_delete"
						method="POST" name="${member.id}">

						<input type="hidden" name="id" value="${member.id}"> <input
							type="submit" value="삭제"
							onclick="button_event('${member.id}');return false;" />
					</form>
				</td>
			</tr>
		</c:forEach>

	</table>

</body>
</html>