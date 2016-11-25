<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/company/com_importSpendList" method="post">
		<select name="area">
			<option value="">지역 선택</option>
			<option value="판교">판교</option>
			<option value="야탑">야탑</option>
			<option value="서현">서현</option>
		</select>
		<select name="year">
			<option value="">년도</option>
			<option value="2016">2016</option>
			<option value="2015">2015</option>
			<option value="2014">2014</option>
			<option value="2013">2013</option>
			<option value="2016">2012</option>
			<option value="2015">2011</option>
			<option value="2014">2010</option>
			<option value="2013">2009</option>
		</select>
		<select name="month">
			<option value="">월</option>
			<option value="12">12</option>
			<option value="11">11</option>
			<option value="10">10</option>
			<option value="9">9</option>
			<option value="8">8</option>
			<option value="7">7</option>
			<option value="6">6</option>
			<option value="5">5</option>
			<option value="4">4</option>
			<option value="3">3</option>
			<option value="2">2</option>
			<option value="1">1</option>
		</select>
		<input type="submit" value="검색">
	</form>
	
	<c:if test="${year != '' && month != '' }">
		<h4>지역 : ${area } / ${year }년 / ${month }월</h4>
	</c:if>

	<c:if test="${result == null }">
		<h2>내용이 없습니다.</h2>
	</c:if>
	<c:if test="${result != null }">
	<table>
		<tr>
			<th>지역</th>
			<th>제목</th>
			<th>수입 / 지출</th>
			<th>금액</th>
			<th>날자</th>
		</tr>
		<c:forEach items="${ result}" var="list">
			<tr>
				<td>${list.area }</td>
				<td>${list.title }</td>
				<td>${list.content }</td>
				<td>${list.pay }</td>
				<td><fmt:formatDate value="${list.dayda }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>

		<tr><td colspan="4"></td></tr>
		<tr><td colspan="4"></td></tr>

		<tr>
			<td>수입</td>
			<td>${pay1 }</td>
			<td>지출</td>
			<td>${pay2 }</td>
		</tr>
		<tr>
			<td>순이익</td>
			<td></td>
			<td></td>
			<td>${total }</td>
		</tr>
	</table>
	</c:if>
	
	<div>
		<ul class="com_stock_li-paging">
			<c:if test="${pageMaker.prev }">
				<li><a
					href="com_importSpendList?page=${pageMaker.startPage - 1 }&year=${year}&month=${month}&area=${area}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
					<a href="com_importSpendList?page=${idx}&year=${year}&month=${month}&area=${area}">${idx }</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="com_importSpendList?page=${pageMaker.endPage + 1 }&year=${year}&month=${month}&area=${area}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>