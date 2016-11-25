<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>wow</h1>
<h3>${year}년 / ${month + 1}월 / ${day }일</h3>
<form action="${pageContext.request.contextPath}/company/com_calendarMemoInsert">
	<input type="text" name="memo">
	<input type="submit" value="입력">
	<input type="hidden" value=${year } name="year">
	<input type="hidden" value=${month } name="month">
	<input type="hidden" value=${day } name="day">
</form>
</body>
</html>