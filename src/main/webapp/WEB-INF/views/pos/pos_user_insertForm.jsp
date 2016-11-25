<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
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
				<th id="tr_insert"><img class="img_insert"
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
				
				<input type="text" id="postcode" placeholder="�����ȣ" name="postcode"
				style="margin-left: 20px;
				border: none;
				border-right: 1px solid #009688;
				border-bottom: 1px solid #009688;
				width: 80px;
				font-family: 'Jeju Gothic', sans-serif;
				">
				<input type="button" onclick="execDaumPostcode()" value="�����ȣ ã��"><br>
				<input type="text" id="address" placeholder="�ּ�" name="address"
				style="margin-left: 20px;
				border: none;
				border-right: 1px solid #009688;
				border-bottom: 1px solid #009688;
				width: 300px;
				font-family: 'Jeju Gothic', sans-serif;
				">
				<input type="text" id="address2" placeholder="���ּ�" name="address2"
				style="margin-left: 20px;
				border: none;
				border-right: 1px solid #009688;
				border-bottom: 1px solid #009688;
				width: 300px;
				font-family: 'Jeju Gothic', sans-serif;
				">

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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

            // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var fullAddr = ''; // ���� �ּ� ����
            var extraAddr = ''; // ������ �ּ� ����

            // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
            if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                fullAddr = data.roadAddress;

            } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                fullAddr = data.jibunAddress;
            }

            // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
            if(data.userSelectedType === 'R'){
                //���������� ���� ��� �߰��Ѵ�.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // �ǹ����� ���� ��� �߰��Ѵ�.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
            document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
            document.getElementById('address').value = fullAddr;

            // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
            document.getElementById('address2').focus();
        }
    }).open();
}
</script>

</body>
</html>