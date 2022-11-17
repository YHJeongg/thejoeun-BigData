<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkMember(){
		
		var regExpUserid = /^[a-z|A-Z]+$/
		var regExpName = /^[가-힣]+$/
		var regExpTel = /^\d{3}-\d{3,4}-\d{4}$/
		var regExpAddress = /^[가-힣|0-9| ]*$/
		
		var form = document.Member
		
		var userid = form.userid.value
		var name = form.name.value
		var tel = form.tel.value
		var address = form.address.value
		
		if(!regExpUserid.test(userid)){
			alert("아이디는 영어로 입력해 주세요")
			form.userid.select()
			return
		}
		
		if(!regExpName.test(name)){
			alert("이름은 한글만으로 입력해 주세요")
			form.name.select()
			return
		}
		
		if(!regExpTel.test(tel)){
			alert("연락처 입력을 확인해 주세요")
			form.tel.select()
			return
		}
		
		if(!regExpAddress.test(address)){
			alert("주소를 확인해 주세요")
			form.address.select()
			return
		}
		form.submit()
	}
</script>
<body>
	<h3>아래의 항목을 입력후 확인 버튼을 누르세요!</h3>
	<form name="Member" action="purchaserInsert_02.jsp" method="post">
		<p>사용자 ID : <input type="text" name="userid" size="10">
		<p>성명 : <input type="text" name="name" size="10">
		<p>전화번호 : <input type="text" maxlength="13" size="20" name="tel">
		<p>주소 : <input type="text" name="address" size="40">
		<p><input type="button" value="확인" onclick="checkMember()">
	</form>
</body>
</html>