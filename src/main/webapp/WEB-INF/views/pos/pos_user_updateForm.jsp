<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ƹ�����Ʈ�� ���� ����</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/pos/ps_user_update"
		method="POST">
		<c:forEach items="${ list }" var="list">
			<table>
				<tr>
					<td>���̵�</td>
					<td><input type="text" name="id" value="${ list.id }"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="pwd" value="${ list.pwd }"></td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td><input type="text" name="name" value="${ list.name }"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="position"
						value="${ list.position }" readonly="readonly"></td>
				</tr>
				<tr>
					<td>��ȭ��ȣ</td>
					<td><input type="text" name="phone" value="${ list.phone }"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="age" value="${ list.age }"></td>
				</tr>
				<tr>
					<td>�ּ�</td>
					<td><input type="text" name="address"
						value="${ list.address }"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="gender" value="${ list.gender }"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>����(�����ڴ� ����)</td>
					<td><input type="text" name="area" value="${ list.area }"
						readonly="readonly"></td>
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
					<td><input type="submit" value="����"></td>
				</tr>
			</table>
		</c:forEach>
	</form>

</body>
</html>