<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>정보 입력 폼</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/company/com_insert" method="get">
		<table>
			<tr>
				<td>아이디</td>		
				<td><input type="text" name="id"></td>		
			</tr>
			<tr>
				<td>비밀번호</td>		
				<td><input type="password" name="pwd"></td>		
			</tr>
			<tr>
				<td>이름</td>		
				<td><input type="text" name="name"></td>		
			</tr>
			<tr>
				<td>직급</td>		
				<td>
				<select name="position">
					<option value="admin">관리자</option>
					<option value="manager">지점장</option>
				</select>
				</td>		
			</tr>
			<tr>
				<td>전화번호</td>	
				<td><input type="text" name="phone"></td>		
			</tr>
			<tr>
				<td>나이</td>	
				<td><input type="text" name="age"></td>		
			</tr>
			<tr>
				<td>주소</td>		
				<td><input type="text" name="address"></td>		
			</tr>
			<tr>
				<td>성별</td>		
				<td>
				<select name="gender">
					<option value="man">남자</option>
					<option value="woman">여자</option>
				</select>
				</td>		
			</tr>
			<tr>
				<td>지점(관리자는 본사)</td>		
				<td><input type="text" name="area"></td>		
			</tr>
			
			<tr>
			<td><input type="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>