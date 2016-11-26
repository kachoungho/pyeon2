<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>정보 입력 폼</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/company/com_insert"
		method="post">

		<table id="table_insert">
			<tr>
				<th colspan="2">
					<label id="label_insert"> 직원 정보 입력 </label>
				</th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" style="" src="/controller/resources/images/id.png">아이디</th>
				<th><input id="input_insert" type="text" name="id"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" src="/controller/resources/images/pwd.png">비밀번호</th>
				<th><input id="input_insert" type="password" name="pwd"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" src="/controller/resources/images/name.png">이름</th>
				<th><input id="input_insert" type="text" name="name"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" src="/controller/resources/images/rank.png">직급</th>
				<th><select id="select_insert" name="position">
						<option value="admin">관리자</option>
						<option value="manager">지점장</option>
				</select></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" src="/controller/resources/images/phone.png">전화번호</th>
				<th><input id="input_insert" type="text" name="phone"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" src="/controller/resources/images/age.png">생년월일</th>
				<th><input id="input_insert" type="text" name="age"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" src="/controller/resources/images/address.png">주소</th>
				<th>
				<font face="Jeju Gothic">
				
				<input type="text" id="postcode" placeholder="우편번호" name="postcode">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="address" placeholder="주소" name="address">
				<input type="text" id="address2" placeholder="상세주소" name="address2">

				</font>
				</th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" src="/controller/resources/images/gender.png">성별</th>
				<th><select id="select_insert" name="gender">
						<option value="man">남자</option>
						<option value="woman">여자</option>
				</select></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" src="/controller/resources/images/area.png">지점</th>
				<th><input id="input_insert" type="text" name="area"></th>
			</tr>

			<tr>
				<th></th>
				<th><input id="button_insert" width="40" type="image"
					src="/controller/resources/images/check.png" alt="submit">
				</th>
			</tr>
		</table>
	</form>
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('address2').focus();
        }
    }).open();
}
</script>

</body>
</html>