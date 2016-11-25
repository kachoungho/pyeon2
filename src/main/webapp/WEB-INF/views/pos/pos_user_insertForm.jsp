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
    var width = 500; //�˾�â�� ����ɶ� ��ġ����
    var height = 600; //�˾�â�� ����ɶ� ��ġ����
    new daum.Postcode({
        width : width, //�˾�â�� ����ɶ� ��ġ����
        height : height, //�˾�â�� ����ɶ� ��ġ����
        oncomplete: function(data) {
             // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
 
            // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
            var extraRoadAddr = ''; // ���θ� ������ �ּ� ����
 
            // ���������� ���� ��� �߰��Ѵ�.
            if(data.bname !== ''){
                extraRoadAddr += data.bname;
            }
            // �ǹ����� ���� ��� �߰��Ѵ�.
            if(data.buildingName !== ''){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
             
            // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
            document.getElementById("post1").value = data.postcode1;
            document.getElementById("post2").value = data.postcode2;
            document.getElementById("addr1").value = fullRoadAddr;
            document.getElementById("addr2").value = data.jibunAddress;
 
            document.getElementById("addr2").focus();
        }
    }).open({
        left : (window.screen.width / 2) - (width / 2), //�˾�â�� ����ɶ� ��ġ����
        top : (window.screen.height / 2) - (height / 2) //�˾�â�� ����ɶ� ��ġ����
    });
}
</script>
<title>�Ƹ�����Ʈ�� ���� �Է�</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/pos/ps_user_insert"
		method="post">
		<table id="table_insert">
			<tr>
				<th colspan="2"><label id="label_insert"> ���� ���� �Է� </label></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" style=""
					src="/controller/resources/images/id.png">���̵�</th>
				<th><input id="input_insert" type="text" name="id"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/pwd.png">��й�ȣ</th>
				<th><input id="input_insert" type="password" name="pwd"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/name.png">�̸�</th>
				<th><input id="input_insert" type="text" name="name"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/rank.png">����</th>
				<th><select id="select_insert" name="position">
						<option value="user">�Ƹ�����Ʈ</option>
				</select></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/phone.png">��ȭ��ȣ</th>
				<th><input id="input_insert" type="text" name="phone"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/age.png">�������</th>
				<th><input id="input_insert" type="text" name="age"></th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert" src="/controller/resources/images/address.png">�ּ�</th>
				<th>
				<font face="Jeju Gothic">
				<input id="post1" readonly="" size="5" name="post1"> - <input id="post2" readonly="" size="5" name="post2">
				<input onclick="openDaumPostcode()" type="button" value="�����ȣã��"><br>
				<span id="callbacknestsgroomtistorycom738395" style="width:1px; height:1px; float:right">
				<embed allowscriptaccess="always" id="bootstrappersgroomtistorycom738395" src="http://sgroom.tistory.com/plugin/CallBack_bootstrapperSrc?nil_profile=tistory&nil_type=copied_post" width="1" height="1" wmode="transparent" type="application/x-shockwave-flash" enablecontextmenu="false" flashvars="&callbackId=sgroomtistorycom738395&host=http://sgroom.tistory.com&embedCodeSrc=http%3A%2F%2Fsgroom.tistory.com%2Fplugin%2FCallBack_bootstrapper%3F%26src%3D%2F%2Fs1.daumcdn.net%2Fcfs.tistory%2Fresource%2F2cd0e6a5029f432304ab4c6e08ea4914bdf74199%2Fblog%2Fplugins%2FCallBack%2Fcallback%26id%3D73%26callbackId%3Dsgroomtistorycom738395%26destDocId%3Dcallbacknestsgroomtistorycom738395%26host%3Dhttp%3A%2F%2Fsgroom.tistory.com%26float%3Dleft" swliveconnect="true">
				</span>
				<span style="LINE-HEIGHT: 8%"><br></span>
				<input id="addr1" readonly="" size="40" name="addr1" placeholder="���θ��ּ�"><br>
				<span style="LINE-HEIGHT: 8%"><br></span>
				<input id="addr2" size="40" name="addr2" placeholder="�����ּ�">
				</font>
				</th>
			</tr>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/gender.png">����</th>
				<th><select id="select_insert" name="gender">
						<option value="man">����</option>
						<option value="woman">����</option>
				</select></th>
			</tr>
			<c:forEach items="${ list }" var="list">
				<tr>
					<th id="tr_insert"><img class="img_insert"
						src="/controller/resources/images/area.png">����</th>
					<th><input id="input_insert" type="text" name="area"
						value="${ list.area }" readonly="readonly"></th>
				</tr>
			</c:forEach>
			<tr>
				<th id="tr_insert"><img class="img_insert"
					src="/controller/resources/images/clock.png">�ٹ��ð�</th>
				<th><select id="select_insert" name="optime">
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="�߰�">�߰�</option>
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