<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!--     <a href="order">재고 관리</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="pos_menu2">매출 관리 </a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="pos_menu3">계정 관리</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="pos_menu4">계 산</a> -->




<center>
<div>
<a href=#none onclick=this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';>
재고 관리
</a><DIV style='display:none'>
<a href="order">
├ 발주 신청
</a><br><p></p>
<a href="ps_item_selectAll">
├ 상품 리스트
</a><br><p></p>
<a href="ps_item_select">
├ 상품 리스트 세부 검색
</a><br><p></p>
<a href="ps_item_delete">
└ 상품 제거
</a>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a href=#none onclick=this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';>
매출 관리
</a><DIV style='display:none'>
<a href="#">
├ 일일 정산
</a><br><p></p>
<a href="#">
├ 주간 정산
</a><br><p></p>
<a href="#">
└ 월간 정산
</a>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a href=#none onclick=this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';>
출/퇴근 관리
</a><DIV style='display:none'>
<a href="#">
├ 출근 입력
</a><br><p></p>
<a href="#">
├ 퇴근 입력
</a><br><p></p>
<a href="#">
└ 출/퇴근 이력 조회
</a>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<a href="#">
계  산
</a><DIV style='display:none'>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
</center>