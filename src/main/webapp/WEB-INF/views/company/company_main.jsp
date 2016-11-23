<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>본사 첫 페이지</title>
</head>
<body>
	<div style="float: left; width: 50%; margin-top: 10px;">
		<table class="ex1">
			<thead>
				<tr>
					<th style="text-align: left; background-color: #FFFFFF;"><font
						color="#054A75"> 발주 미승인건</font> <font color=red> ( ${ count } 건 ) </font> <input
						style="float: right; margin-right: 20px;" type="image"
						src="/controller/resources/images/more.png" alt="button"
						onclick="document.location.href='${pageContext.request.contextPath}/company/com_orderApproval'" /></th>
				</tr>
			</thead>
		</table>

		<table class="ex1">
			<thead>
				<tr class="odd">
					<th scope="col">제품명</th>
					<th scope="col">수량</th>
					<th scope="col">카테고리</th>
					<th scope="col">지점</th>
					<th scope="col">발주시간</th>
					<th scope="col">상태</th>
				</tr>
			</thead>

			<c:forEach items="${result }" var="list">
				<tbody>
					<tr class="odd">
						<td class="date2">${ list.item_name }</td>
						<td class="date2">${ list.count }</td>
						<td class="date2">${ list.category }</td>
						<td class="date2">${ list.area }</td>
						<td class="date2">${ list.p2_time }</td>
						<td class="date2">${ list.state }</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>

	<div style="float: left; width: 50%;">
		<center>
			<input type=text name=memoYear size=2 value="${currentYear}">년
			<input type=text name=memoMonth size=2 value="${currentMonth+1}">월
			<input type=text name=memoDay size=2 value="${currentDate}">일
		</center>
		<center>
			<table border=0>
				<tr>
					<td align=center width=200>
						<!-- 년 도--> <a
						href="${pageContext.request.contextPath}/company?year=${year-1}&month=${month}">◀</a>
						${year}년 <a
						href="${pageContext.request.contextPath}/company?year=${year+1}&month=${month}">▶</a>
						<!-- 월 --> <a
						href="${pageContext.request.contextPath}/company?year=${year}&month=${month-1}">◀</a>
						${month+1}월 <a
						href="${pageContext.request.contextPath}/company?year=${year}&month=${month+1}">▶</a>
					</td>
<%-- 					<td align=right width=200>${currentYear}-${currentMonth+1}-${currentDate}</td> --%>
				</tr>
			</table>
			
			<table class="ex1">
				<!-- 달력 부분 -->
				<thead>
					<tr style="text-align: center;" class="odd">
						<th width=70 style="color: red; text-align: center;" scope="col">일</th>
						<!-- 일=1 -->
						<th width=70 style="text-align: center;" scope="col">월</th>
						<!-- 월=2 -->
						<th width=70 style="text-align: center;" scope="col">화</th>
						<!-- 화=3 -->
						<th width=70 style="text-align: center;" scope="col">수</th>
						<!-- 수=4 -->
						<th width=70 style="text-align: center;" scope="col">목</th>
						<!-- 목=5 -->
						<th width=70 style="text-align: center;" scope="col">금</th>
						<!-- 금=6 -->
						<th width=70 style="color: blue; text-align: center;" scope="col">토</th>
						<!-- 토=7 -->
					</tr>
				</thead>
			</table>
			<table style="width: 90%; background: #f9f9f9">
				<tr height=70>
					<c:set var="br" value="0" />
					<c:forEach var="i" begin="1" end="${startDay-1}">
						<td>&nbsp;</td>
						<c:set var="br" value="${br+1}" />
						<c:if test="${br == 7}">
							<br>
						</c:if>
					</c:forEach>

					<c:forEach var="a" begin="1" end="${end}" varStatus="idx">
						<td style="vertical-align: top; cursor: pointer;"
						onmouseover="this.style.backgroundColor='#F3F5BB'"
						onmouseout="this.style.backgroundColor='#f9f9f9'"
						onclick="document.location.href='${pageContext.request.contextPath}/company/com_calendarMemo?year=${year }&month=${month + 1}&day=${idx.index }'">
							<c:if test="${br==6 || br==13 || br==20 || br==27 || br==34}">
								<font style="color: blue">${a }</font>
							</c:if>
							<c:if test="${br==0 || br==7 || br==14 || br==21 || br==28 || br==35}">
								<font style="color: red">${a }</font>
							</c:if>
							<c:if test="${br!=0 && br!=7 && br!=14 && br!=21 && br!=28 && br!=35 && br!=6 && br!=13 && br!=20 && br!=27 && br!=34}">
								<font style="color: black">${a }</font>
							</c:if><br>
							<c:set var="br" value="${br+1}" />
							<c:if test="${(br%7) == 0 && a != end }">
						</td>
				</tr>
				<tr height=70>
					</c:if>
					</c:forEach>
					<c:set var="brend" value="${br}" />
					<c:forEach var="i" begin="0" end="7">
						<c:if test="${(brend%7) != 0 }">
							<c:set var="brend" value="${brend+1}" />
						</c:if>
					</c:forEach>
					<c:forEach var="i" begin="${br}" end="${brend-1}">
						<td>&nbsp;</td>
					</c:forEach>
				</tr>
			</table>
			<br> <br> <br>
		</center>
		<script>
			// tooltip demo
			$('.tooltip-demo').tooltip({
				selector : "[data-toggle=tooltip]",
				container : "body"
			})
			// popover demo
			$("[data-toggle=popover]").popover()
		</script>
	</div>
</body>
</html>