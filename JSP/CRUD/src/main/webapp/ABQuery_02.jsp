<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>아래의 항목을 입력후 확인 버튼을 누르세요!</h3>
	<form action="ABQuery_03.jsp">
		<p>성명 : <input type="text" name="name" size="10">
		<p>전화번호 : <input type="text" name="tel" size="20">
		<p>주소 : <input type="text" name="address" size="30">
		<p>전자우편 : <input type="text" name="email" size="30">
		<p>관계 : <input type="text" name="relation" size="30">
		<p><input type="submit" value="입력">	
	</form>
</body>
</html>