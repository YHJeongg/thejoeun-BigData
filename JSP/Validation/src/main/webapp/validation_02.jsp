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
		if(form.id.value == "") {
			alert("아이디를 입력해 주세요.")
			form.id.focus()
			return false
		} else if(form.passwd.value == "") {
			alert("비밀번호를 입력해 주세요.")
			form.passwd.focus()
			return false
		}
		form.submit()
		return true
	}
</script>
<body>
	<form name="loginForm" action="validation_02_Process.jsp" method="post">
		<p>아이디 : <input type="text" name="id"></p>
		<p>비밀번호 : <input type="password" name="passwd"></p>
		<p><input type="button" value="OK" onclick="checkLogin()"></p>
	</form>
</body>
</html>