<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Addition</title>
</head>
<body>
	<h1>Addition</h1>
<%
	int sum = 0;
	int a = 2;
	for(int i = 1; i < 10; i++){
		sum = a * i;
		out.println(a + " * " + i + " = " + sum + "<br>");
		out.println("===============" + "<br>");
	}
	out.println("<br>");
	
	int sum2 = 0;
	for(int i = 1; i < 101; i++){
		sum2 += i;
	}
	out.print("1 + 2 + 3 + ..... + 99 + 100 = " + sum2 + "<br>");
%>
</body>
</html>