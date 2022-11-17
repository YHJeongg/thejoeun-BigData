<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성인 확인</title>
</head>
<body>
<h1><%=request.getParameter("adult") %></h1>
당신의 나이는 <%=request.getParameter("age") %>살 이므로 주류 구매가 <%=request.getParameter("posible") %>합니다. <br>
<a href="ResponseAge_01.jsp">처음으로 이동</a>
</body>
</html>