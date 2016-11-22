<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>정산 목록</h3>
	<form action="ps_daymoneyconfirmSelect" method="post">
		<input type="hidden" name="area" value="${area }">
		<select name="year">
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
	<!-- 	<select name="month">
			<option value="2015">31</option>
			<option value="2014">30</option>
			<option value="2013">29</option>
			<option value="2016">28</option>
			<option value="2015">27</option>
			<option value="2014">26</option>
			<option value="2013">25</option>
			<option value="2016">24</option>
			<option value="2015">23</option>
			<option value="2014">22</option>
			<option value="2013">21</option>
			<option value="2016">20</option>
			<option value="2015">19</option>
			<option value="2014">18</option>
			<option value="2013">17</option>
			<option value="2016">16</option>
			<option value="2015">15</option>
			<option value="2014">14</option>
			<option value="2013">13</option>
			<option value="2016">12</option>
			<option value="2015">11</option>
			<option value="2014">10</option>
			<option value="2013">9</option>
			<option value="2016">8</option>
			<option value="2015">7</option>
			<option value="2014">6</option>
			<option value="2013">5</option>
			<option value="2016">4</option>
			<option value="2015">3</option>
			<option value="2014">2</option>
			<option value="2013">1</option>
		</select> -->
		<input type="submit" value="select">
	</form>
	<c:if test="${result == null }">
		<h2>내용이 없습니다.</h2>
	</c:if>
	<c:if test="${result != null }">
	<table>
		<tr>
			<th>제목</th>
			<th>수입 / 지출</th>
			<th>금액</th>
			<th>날자</th>
		</tr>
		<c:forEach items="${ result}" var="list">
			<tr>
				<td>${list.title }</td>
				<td>${list.content }</td>
				<td>${list.pay }</td>
				<td><fmt:formatDate value="${list.dayda }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
		
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
					href="ps_daymoneyconfirm?page=${pageMaker.startPage - 1 }&year=${year}&month=${month}&area=${area}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
					<a href="ps_daymoneyconfirm?page=${idx}&year=${year}&month=${month}&area=${area}">${idx }</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="ps_daymoneyconfirm?page=${pageMaker.endPage + 1 }&year=${year}&month=${month}&area=${area}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>