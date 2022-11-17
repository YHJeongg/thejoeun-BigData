<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 가입 결과</h1><br>
가입 되었습니다.<br>
<h1>가입내용</h1><br>
아이디 : <%=session.getAttribute("ID") %><br>
패스워드 : <%=session.getAttribute("PW") %><br>
성명 : <%=session.getAttribute("NAME") %>
<%session.invalidate(); %>
</body>
</html>