<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아르바이트생 정보 수정</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/pos/ps_user_update"
		method="POST">
		<c:forEach items="${ list }" var="list">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value="${ list.id }"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd" value="${ list.pwd }"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${ list.name }"></td>
				</tr>
				<tr>
					<td>직급</td>
					<td><input type="text" name="position"
						value="${ list.position }" readonly="readonly"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" value="${ list.phone }"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" value="${ list.age }"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"
						value="${ list.address }"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="gender" value="${ list.gender }"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>지점(관리자는 본사)</td>
					<td><input type="text" name="area" value="${ list.area }"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>근무시간</td>
					<td><select name="optime">
						<option value="am">오전</option>
						<option value="pm">오후</option>
						<option value="night">야간</option>
				</select></td>
				</tr>

				<tr>
					<td><input type="submit" value="수정"></td>
				</tr>
			</table>
		</c:forEach>
	</form>

</body>
</html>