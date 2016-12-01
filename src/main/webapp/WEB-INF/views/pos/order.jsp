<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="order" method="post">
상품 코드 : <input type="text" name="item_code">
상품 이름 : <input type="text" name="item_name">
상품 갯수 : <input type="text" name="count">
상품 카테고리 : <input type="text" name="category">
지점 : <input type="text" name="area">
<input type="submit" value="신청">
<sec:authentication property="name" var="LoingUser" />
	<sec:authorize access="hasAuthority('ROLE_USER')">
		${LoingUser}님 접속중
		
	</sec:authorize>

</form>
</body>
</html>