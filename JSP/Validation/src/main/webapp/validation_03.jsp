<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkLogin() {
		var form = document.loginForm
		if(form.id.value.length < 4 || form.id.value.length > 12) {
			alert("아이디는 4~12자 이내로 입력 가능합니다.")
			form.id.select()
			return false
		}
			
		if(form.passwd.value.length < 4) {
			alert("비밀번호는 4자 이상으로 입력 가능합니다.")
			form.passwd.select()
			return false
		}
		alert("1234")
		form.submit()
		return true
	}
</script>
<body>
	<form name="loginForm" action="validation_03_Process.jsp" method="post">
		<p>아이디 : <input type="text" name="id"></p>
		<p>비밀번호 : <input type="password" name="passwd"></p>
		<p><input type="button" value="OK" onclick="checkLogin()"></p>
	</form>
</body>
</html>