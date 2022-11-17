<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사칙연산 계산</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int firstNum = Integer.parseInt(request.getParameter("firstNum"));
	int secondNum = Integer.parseInt(request.getParameter("secondNum"));
	int Num = Integer.parseInt(request.getParameter("Num"));
%>
첫번째수 : <%=firstNum %> <br>
두번째수 : <%=secondNum %> <br><br>
<%
	switch(Num) {
	case 0 :
		out.println(firstNum + " + " + secondNum + " = " + (firstNum + secondNum));
		out.println("<form action='calcExam_03.jsp?firstNum=" + firstNum + "&secondNum=" + secondNum + "&Num=1' method='post'>");
		out.println("<input type='submit' value='뺄셈' />");
		out.println("</form>");
		break;
	case 1 :
		out.println(firstNum + " - " + secondNum + " = " + (firstNum - secondNum));
		out.println("<form action='calcExam_03.jsp?firstNum=" + firstNum + "&secondNum=" + secondNum + "&Num=2' method='post'>");
		out.println("<input type='submit' value='곱셈' />");
		out.println("</form>");
		break;
	case 2 :
		out.println(firstNum + " * " + secondNum + " = " + (firstNum * secondNum));
		out.println("<form action='calcExam_03.jsp?firstNum=" + firstNum + "&secondNum=" + secondNum + "&Num=3' method='post'>");
		out.println("<input type='submit' value='나눗셈' />");
		out.println("</form>");
		break;
	case 3 :
		out.println(firstNum + " / " + secondNum + " = " + String.format("%.3f",(double)firstNum / (double)secondNum));
		out.println("<form action='calcExam_01.jsp' method='post'>");
		out.println("<input type='submit' value='초기화면' />");
		out.println("</form>");
		break;
	}
%>
</html>