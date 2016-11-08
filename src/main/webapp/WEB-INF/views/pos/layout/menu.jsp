<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">


<div class="w3-container">
  <ul class="w3-navbar w3-card-2 w3-white w3-center">
    <li></li>
    <li style="width:25%" class="w3-dropdown-hover">
      <a href="#">재고 관리 <i class="fa fa-caret-down"></i></a>
      <div style="width:328.5px;" class="w3-dropdown-content w3-light-gray w3-card-4">
      	<a href="order">발 주 신 청</a>
        <a href="ps_item_selectAll">상 품 리 스 트</a>
        <a href="ps_item_select">상품 리스트 세부 검색</a>
        <a href="ps_item_delete">상 품 제 거</a>
      </div>
    </li>
    
    <li style="width:25%" class="w3-dropdown-hover">
      <a href="#">매출 관리 <i class="fa fa-caret-down"></i></a>
      <div style="width:328.5px;" class="w3-dropdown-content w3-light-gray w3-card-4">
      	<a href="#">일 일 정 산</a>
        <a href="#">주 간 정 산</a>
        <a href="#">월 간 정 산</a>
      </div>
    </li>

    <li style="width:25%" class="w3-dropdown-hover">
      <a href="#">출 / 퇴근 관리 <i class="fa fa-caret-down"></i></a>
      <div style="width:328.5px;" class="w3-dropdown-content w3-light-gray w3-card-4">
      	<a href="order">출 근 입 력</a>
        <a href="ps_item_selectAll">퇴 근 입 력</a>
        <a href="ps_item_select">출 / 퇴근 이력 조회</a>
      </div>
    </li>
    
    <li style="width:25%"><a href="#">계  산</a></li>
  </ul>
</div>
