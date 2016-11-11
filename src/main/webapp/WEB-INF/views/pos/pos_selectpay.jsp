<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,com.pyeon2.vo.*" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<sec:authorize access="hasAuthority('ROLE_USER')">
        <form action="ps_selectpay" method="post">
    </sec:authorize>   
    
    <sec:authorize access="hasAuthority('ROLE_MANAGER')">
     	<form action="ps_selectpays" method="post">
    </sec:authorize>  
	
		 <sec:authentication property="name" var="LoingUser" />
		<input type="hidden" value="${LoingUser }" name="ids">
		<select id="year" name="year">
						<option value="" hidden=""></option>
						<option value= "2014" >2014</option>
						<option value= "2015" >2015</option>
						<option value= "2016" >2016</option>
		</select> 년&nbsp;&nbsp;
		<select id="year" name="month">
						<option value="" hidden=""></option>
						<option value= "01" >1월</option>
						<option value= "02" >2월</option>
						<option value= "03" >3월</option>
						<option value= "04" >4월</option>
						<option value= "05" >5월</option>
						<option value= "06" >6월</option>
						<option value= "07" >7월</option>
						<option value= "08" >8월</option>
						<option value= "09" >9월</option>
						<option value= "10" >10월</option>
						<option value= "11" >11월</option>
						<option value= "12" >12월</option>
		</select> 년&nbsp;&nbsp;
		
		<input type="submit" value="검색">
		<table>
			<tr>
				<td align="center">이름</td>
				<td align="center">년</td>
				<td align="center">월</td>
				<td align="center">지역</td>
				<td align="center">업무 시간</td>
				<td align="center">급여</td>
			</tr>
			<c:forEach items="${result}" var="user">
			<tr>
				<td align="center">${user.userid }</td>
				<td align="center">${user.year }</td>
				<td align="center">${user.month }</td>
				<td align="center">${user.area }</td>
				<td align="center">${user.hour }</td>
				<td align="center">${user.money }</td>
			</tr>
			</c:forEach>
			
		</table>
	</form>
</body>
</html>