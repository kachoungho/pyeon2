<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ƹ�����Ʈ�� ���� �Է�</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/pos/ps_user_insert"
		method="post">
		<table>
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><select name="position">
						<option value="user">�Ƹ�����Ʈ</option>
				</select></td>
			</tr>
			<tr>
				<td>��ȭ��ȣ</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>�ּ�</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><select name="gender">
						<option value="man">����</option>
						<option value="woman">����</option>
				</select></td>
			</tr>
			<tr>
			<c:forEach items="${ list }" var="list">
				<td>����</td>
				<td><input type="text" name="area" value="${ list.area }" readonly="readonly"></td>
			</c:forEach>
			</tr>
			<tr>
				<td>�ٹ��ð�</td>
				<td><select name="optime">
						<option value="am">����</option>
						<option value="pm">����</option>
						<option value="night">�߰�</option>
				</select></td>
			</tr>

			<tr>
				<td><input type="submit"></td>
			</tr>
		</table>
	</form>

</body>
</html>