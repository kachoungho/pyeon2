<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">


<div><!--  class="w3-container" -->
  <ul class="w3-navbar w3-card-2 w3-white w3-center">
    <li></li>
    <li style="width:33.33%" class="w3-dropdown-hover">
      <a href="#">재고 관리 <i class="fa fa-caret-down"></i></a>
      <div style="width:440px;" class="w3-dropdown-content w3-light-gray w3-card-4">
      	<a href="${pageContext.request.contextPath}/company/com_orderApproval">발 주 승 인</a>
        <a href="${pageContext.request.contextPath}/company/com_stock">매장별 재고 현황</a>
        <a href="${pageContext.request.contextPath}/company/com_companyStock">본사 재고 현황</a>
      </div>
    </li>
    
    <li style="width:33.33%" class="w3-dropdown-hover">
      <a href="#">매장 관리 <i class="fa fa-caret-down"></i></a>
      <div style="width:440px;" class="w3-dropdown-content w3-light-gray w3-card-4">
      	<a href="#">매 장 현 황</a>
      </div>
    </li>

    <li style="width:33.33%" class="w3-dropdown-hover">
      <a href="#">인사 관리 <i class="fa fa-caret-down"></i></a>
      <div style="width:440px;" class="w3-dropdown-content w3-light-gray w3-card-4">
      	<a href="${pageContext.request.contextPath}/company/com_searchForm">직원 검색</a>
<<<<<<< HEAD
      	<a href="${pageContext.request.contextPath}/company/com_insertForm">직원 정보 추가</a>
=======
      	<a href="${pageContext.request.contextPath}/company/com_insertForm">직원 정보 등록</a>
>>>>>>> 50a407557b6df51c345e52aaca676749d3d77ee8
      </div>
    </li>
  </ul>
</div>