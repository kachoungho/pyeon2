<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<script type="text/javascript">
  function input(index) {
    if (index == 1) {
      document.daily.action="${pageContext.request.contextPath}/company/com_notice_modify";
    }
    if (index == 2) {
      document.daily.action="${pageContext.request.contextPath}/company/com_notice_delete";
    }
    document.daily.submit();
  }
</script>
</head>
				
			
<body>
	<form method="post" name=daily id = daily>
		<c:forEach items="${result }" var="list">
			<input type="hidden" value="${ list.noticenum}" name="noticenum">
			<table>
				<tr>
					<td>제목</td>
					<td>${list.title }</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${list.name }</td>
				</tr>
				<tr>
					<td>직급</td>
					<td>${list.position }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${list.contant }</td>
				</tr>
			</table>
			
			<input type="button" value = "수정" onclick = 'input(1)'/>
			<input type="button" value = "삭제" onclick = 'input(2)'/>
			
			<input type="button" value = "목록 가기" onclick="document.location.href='${pageContext.request.contextPath}/company/com_notice_list'"/>
		</c:forEach>
	</form>
</body>
</html>