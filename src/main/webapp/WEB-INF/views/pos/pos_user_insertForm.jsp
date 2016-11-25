<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function openDaumPostcode() {
    var width = 500; //팝업창이 실행될때 위치지정
    var height = 600; //팝업창이 실행될때 위치지정
    new daum.Postcode({
        width : width, //팝업창이 실행될때 위치지정
        height : height, //팝업창이 실행될때 위치지정
        oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
            // 법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
             
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("post1").value = data.postcode1;
            document.getElementById("post2").value = data.postcode2;
            document.getElementById("addr1").value = fullRoadAddr;
            document.getElementById("addr2").value = data.jibunAddress;
 
            document.getElementById("addr2").focus();
        }
    }).open({
        left : (window.screen.width / 2) - (width / 2), //팝업창이 실행될때 위치지정
        top : (window.screen.height / 2) - (height / 2) //팝업창이 실행될때 위치지정
    });
}
</script>
<title>아르바이트생 정보 입력</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/pos/ps_user_insert"
		method="post">
		<table id="table_insert">
			<tr>
				<th colspan="2"><label id="label_insert"> 직원 정보 입력 </label></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" style=""
					src="/controller/resources/images/id.png">아이디</th>
				<th><input id="input_insert" type="text" name="id"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/pwd.png">비밀번호</th>
				<th><input id="input_insert" type="password" name="pwd"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/name.png">이름</th>
				<th><input id="input_insert" type="text" name="name"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/rank.png">직급</th>
				<th><select id="select_insert" name="position">
						<option value="user">아르바이트</option>
				</select></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/phone.png">전화번호</th>
				<th><input id="input_insert" type="text" name="phone"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/age.png">생년월일</th>
				<th><input id="input_insert" type="text" name="age"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" src="/controller/resources/images/address.png">주소</th>
				<th>
				<font face="Jeju Gothic">
				<input id="post1" readonly="" size="5" name="post1"> - <input id="post2" readonly="" size="5" name="post2">
				<input onclick="openDaumPostcode()" type="button" value="우편번호찾기"><br>
				<span id="callbacknestsgroomtistorycom738395" style="width:1px; height:1px; float:right">
				<embed allowscriptaccess="always" id="bootstrappersgroomtistorycom738395" src="http://sgroom.tistory.com/plugin/CallBack_bootstrapperSrc?nil_profile=tistory&nil_type=copied_post" width="1" height="1" wmode="transparent" type="application/x-shockwave-flash" enablecontextmenu="false" flashvars="&callbackId=sgroomtistorycom738395&host=http://sgroom.tistory.com&embedCodeSrc=http%3A%2F%2Fsgroom.tistory.com%2Fplugin%2FCallBack_bootstrapper%3F%26src%3D%2F%2Fs1.daumcdn.net%2Fcfs.tistory%2Fresource%2F2cd0e6a5029f432304ab4c6e08ea4914bdf74199%2Fblog%2Fplugins%2FCallBack%2Fcallback%26id%3D73%26callbackId%3Dsgroomtistorycom738395%26destDocId%3Dcallbacknestsgroomtistorycom738395%26host%3Dhttp%3A%2F%2Fsgroom.tistory.com%26float%3Dleft" swliveconnect="true">
				</span>
				<span style="LINE-HEIGHT: 8%"><br></span>
				<input id="addr1" readonly="" size="40" name="addr1" placeholder="도로명주소"><br>
				<span style="LINE-HEIGHT: 8%"><br></span>
				<input id="addr2" size="40" name="addr2" placeholder="지번주소">
				</font>
				</th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/gender.png">성별</th>
				<th><select id="select_insert" name="gender">
						<option value="man">남자</option>
						<option value="woman">여자</option>
				</select></th>
			</tr>
			<c:forEach items="${ list }" var="list">
				<tr>
					<th id="tr_insert"><img class="img_insert"
						src="/controller/resources/images/area.png">지점</th>
					<th><input id="input_insert" type="text" name="area"
						value="${ list.area }" readonly="readonly"></th>
				</tr>
			</c:forEach>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/clock.png">근무시간</th>
				<th><select id="select_insert" name="optime">
						<option value="오전">오전</option>
						<option value="오후">오후</option>
						<option value="야간">야간</option>
				</select></th>
			</tr>

			<tr>
				<th></th>
				<th><input id="button_insert" width="40" type="image"
					src="/controller/resources/images/check.png" alt="submit">
				</th>
			</tr>
		</table>
	</form>

</body>
</html>