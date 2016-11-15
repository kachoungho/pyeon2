<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.pyeon2.vo.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
  function input(index) {
    if (index == 1) {
      document.daily.action="${pageContext.request.contextPath}/pos/ps_calc";
    }
    if (index == 2) {
      document.daily.action="${pageContext.request.contextPath}/pos/ps_daycalc";
    }
    if (index == 3) {
        document.daily.action="${pageContext.request.contextPath}/pos/ps_daycalcfin";
    }
    if (index == 4) {
        document.daily.action="${pageContext.request.contextPath}/pos/ps_calccancle";
    }
   
    document.daily.submit();
  }
</script>

</head>
<body>
<form method="post" name=daily id = daily>
<table>
	<tr>
		<td align="center">item_code</td>
		<td align="center">item_name</td>
		<td align="center">count</td>
		<td align="center">category</td>
		<td align="center">area</td>
		<td align="center">금액</td>
	</tr>
	
<!-- 	result는 controller의 addObject로 부터 가져온다. -->

	<c:forEach items="${result }" var="cal">
		<tr>
			<td align="center">${cal.item_code }</td>
			<td align="center">${cal.item_name }</td>
			<td align="center">${cal.count }</td>
			<td align="center">${cal.category }</td>
			<td align="center">${cal.area }</td>
			<td align="right"><fmt:formatNumber value = "${cal.price}" groupingUsed = "true"/> 원</td>
		</tr>
	</c:forEach>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr> 
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr> 
	
	<tr>
		<td align="center">총액</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td align="right"><input type="hidden" name = "total" value="${total}"><fmt:formatNumber value = "${total}" groupingUsed = "true"/> 원</td>
		
	</tr>
	
	<tr>
		<td align="center">지 불 액</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td align="right">
			<form method="post" name=daily id = daily>
				<input type="text" name = "pay" value="0"> 원
				<input type="button" value = "입력" onclick = 'input(2)'/>
			</form>
		</td>
	</tr> 
	
	<tr>
		<td align="center">거스름돈</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td align="right"><input type="hidden" name="pay" value="${pay }"><fmt:formatNumber value = "${pay}" groupingUsed = "true"/> 원</td>
	</tr> 
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td>
			<input type="button" value = "취소" onclick = 'input(4)'>
		</td>
		<td align="right">
			<input type="button" value = "계산" onclick = 'input(3)'>
		</td>
	</tr> 
</table>
<br><br><br>


	<input type="text" name="item_code">
	<input type="hidden" name="id" value="${ vo.id }"> 
	<input type="button" value = "입력" onclick = 'input(1)'/>
</form>


</body>
</html>