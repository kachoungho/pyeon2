<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ù ������</title>
</head>
<body>
	<div style="float: left; width: 50%; margin-top: 10px;">
		<table class="ex1">
			<thead>
				<tr>
					<th style="text-align: left; background-color: #FFFFFF;"><font
						color="#054A75"> ���� �̽��ΰ� </font> <font color=red> ( ${ count } �� ) </font> <input
						style="float: right; margin-right: 20px;" type="image"
						src="/controller/resources/images/more.png" alt="button"
						onclick="document.location.href='${pageContext.request.contextPath}/company/com_orderApproval'" /></th>
				</tr>
			</thead>
		</table>

		<table class="ex1">
			<thead>
				<tr class="odd">
					<th scope="col">��ǰ��</th>
					<th scope="col">����</th>
					<th scope="col">ī�װ�</th>
					<th scope="col">����</th>
					<th scope="col">���ֽð�</th>
					<th scope="col">����</th>
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
			<input type=text name=memoYear size=2 value="${currentYear}">��
			<input type=text name=memoMonth size=2 value="${currentMonth+1}">��
			<input type=text name=memoDay size=2 value="${currentDate}">��
		</center>
		<center>
			<table border=0>
				<tr>
					<td align=center width=200>
						<!-- �� ��--> <a
						href="${pageContext.request.contextPath}/company?year=${year-1}&month=${month}">��</a>
						${year}�� <a
						href="${pageContext.request.contextPath}/company?year=${year+1}&month=${month}">��</a>
						<!-- �� --> <a
						href="${pageContext.request.contextPath}/company?year=${year}&month=${month-1}">��</a>
						${month+1}�� <a
						href="${pageContext.request.contextPath}/company?year=${year}&month=${month+1}">��</a>
					</td>
<%-- 					<td align=right width=200>${currentYear}-${currentMonth+1}-${currentDate}</td> --%>
				</tr>
			</table>
			
			<table class="ex1">
				<!-- �޷� �κ� -->
				<thead>
					<tr style="text-align: center;" class="odd">
						<th width=70 style="color: red; text-align: center;" scope="col">��</th>
						<!-- ��=1 -->
						<th width=70 style="text-align: center;" scope="col">��</th>
						<!-- ��=2 -->
						<th width=70 style="text-align: center;" scope="col">ȭ</th>
						<!-- ȭ=3 -->
						<th width=70 style="text-align: center;" scope="col">��</th>
						<!-- ��=4 -->
						<th width=70 style="text-align: center;" scope="col">��</th>
						<!-- ��=5 -->
						<th width=70 style="text-align: center;" scope="col">��</th>
						<!-- ��=6 -->
						<th width=70 style="color: blue; text-align: center;" scope="col">��</th>
						<!-- ��=7 -->
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

					<c:forEach var="a" begin="1" end="${end}">
						<td style="vertical-align: top; cursor: pointer;"
						onmouseover="this.style.backgroundColor='#F3F5BB'"
						onmouseout="this.style.backgroundColor='#f9f9f9'"
						onclick="">
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