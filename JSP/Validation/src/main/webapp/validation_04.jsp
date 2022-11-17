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
		for(i = 0; i < form.id.value.length; i++) {
			var ch = form.id.value.charAt(i)
			if((ch < 'a' || ch > 'z')) && (ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9')) {
				alert("아이디는 영문 소문자만 입력 가능 합니다.")
				form.id.select()
				return
			}
		}
		
		for(i = 0; i < form.passwd.value.length; i++) {
			var ch = form.passwd.value.charAt(i)
			if(ch > '0' || ch < '9') {
				alert("비밀번호는 숫자만 입력 가능 합니다.")
				form.passwd.select()
				return
			}
		}
		alert("완료되었습니다.")
		form.submit()
	}
</script>
<body>
	<form name="loginForm" action="validation_04_Process.jsp" method="post">
		<p>아이디 : <input type="text" name="id"></p>
		<p>비밀번호 : <input type="password" name="passwd"></p>
		<p><input type="button" value="OK" onclick="checkLogin()"></p>
	</form>
</body>
</html>