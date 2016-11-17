<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<title>아르바이트생 정보 입력</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/pos/ps_user_insert"
		method="post">
		<table id="table_insert">
			<tr>
				<th colspan="2"><label id="label_insert"> 직원 정보 입력 </label></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" style=""
					src="/controller/resources/images/id.png">아이디</th>
				<th><input id="input_insert" type="text" name="id"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/pwd.png">비밀번호</th>
				<th><input id="input_insert" type="password" name="pwd"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/name.png">이름</th>
				<th><input id="input_insert" type="text" name="name"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/rank.png">직급</th>
				<th><select id="select_insert" name="position">
						<option value="user">아르바이트</option>
				</select></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/phone.png">전화번호</th>
				<th><input id="input_insert" type="text" name="phone"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/age.png">생년월일</th>
				<th><input id="input_insert" type="text" name="age"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/address.png">주소</th>
				<th><input id="input_insert" type="text" name="address"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/gender.png">성별</th>
				<th><select id="select_insert" name="gender">
						<option value="man">남자</option>
						<option value="woman">여자</option>
				</select></th>
			</tr>
			<c:forEach items="${ list }" var="list">
				<tr>
					<th id="tr_insert"><img class="img_insert"
						src="/controller/resources/images/area.png">지점</th>
					<th><input id="input_insert" type="text" name="area"
						value="${ list.area }" readonly="readonly"></th>
				</tr>
			</c:forEach>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/clock.png">근무시간</th>
				<th><select id="select_insert" name="optime">
						<option value="오전">오전</option>
						<option value="오후">오후</option>
						<option value="야간">야간</option>
				</select></th>
			</tr>

			<tr>
				<th></th>
				<th><input id="button_insert" width="40" type="image"
					src="/controller/resources/images/check.png" alt="submit">
				</th>
			</tr>
		</table>
	</form>

</body>
</html>