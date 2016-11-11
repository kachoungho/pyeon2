<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/pos/ps_item_delete" method="post">
	<h3>삭제 페이지</h3>
	삭제할 상품 번호 : <input type="text" name = "item_code"><br>
	지역 : <input type="text" name="area"><br>
	<input type="submit" value="삭제">
</form>
</body>
</html>