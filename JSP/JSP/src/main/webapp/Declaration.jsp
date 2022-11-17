<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int i = 10;
	String str = "I have a dream.";
	
	out.println("i = " + i + "<br>");
	out.println("str = " + str + "<br>");
	out.println("sum = " + sum(12,15) + "<br>");
%>

<%!
	public int sum(int a, int b){
	return a + b;
}
%>

<%
	int b = 1;
	for(int j = 2; j < 6; j++) {
		out.println(j + " + " + b + " = " + sum(j,b) + "<br>");
	}
%>

</body>
</html>