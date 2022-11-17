<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>수정결과</h3>
	사용자 ID : <%=session.getAttribute("OLD")%> <br>
	성명 : <%=session.getAttribute("NEWNAME")%> <br>
	전화번호 : <%=session.getAttribute("NEWTEL")%> <br>
	주소 : <%=session.getAttribute("NEWADDRESS")%> <br>
	<%session.invalidate(); %>
</body>
</html>