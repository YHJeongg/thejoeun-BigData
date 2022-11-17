<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름 입력</title>
</head>
<body>
	이름을 입력하고 확인 버튼을 누르세요.
	<br><br>
	<form action="request_02.jsp" method="get">
		이름 : <input type="text" name="yourname"><br><br>

		첫번째 숫자를 입력하세요 : <input type="text" name="firstNum"><br><br>
		두번째 숫자를 입력하세요 : <input type="text" name="secondNum"><br><br>
		<input type="submit" value="확인">
	</form>
	<%
		String name = "James";
	%>
	<a href="http://localhost:8080/JSP/request_02.jsp?yourname=<%=name%>">Test</a>
</body>
</html>