<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반갑습니다</title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	int firstNum = Integer.parseInt(request.getParameter("firstNum"));
	int secondNum = Integer.parseInt(request.getParameter("secondNum"));
	int sum = firstNum + secondNum;
	
%>
	안녕하세요, <%=request.getParameter("yourname") %>님!<br>
	두 수의 합은 <%=sum %> 입니다.
</body>
</html>