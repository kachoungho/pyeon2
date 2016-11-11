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
<form action="${pageContext.request.contextPath}/pos/ps_order" method="post"><br>
상품 코드 : <input type="text" name="item_code"><br>
상품 이름 : <input type="text" name="item_name"><br>
상품 갯수 : <input type="text" name="count"><br>
상품 카테고리 : <input type="text" name="category"><br>
지점 : <input type="text" name="area"><br>
<input type="submit" value="신청">

</form>
</body>
</html>