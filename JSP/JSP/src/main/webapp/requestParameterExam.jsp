<%@page import="java.util.Arrays"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	int firstNum = Integer.parseInt(request.getParameter("firstNum"));
	int secondNum = Integer.parseInt(request.getParameter("secondNum"));
	/* String calc = request.getParameter("calc"); */
	String[] calc = request.getParameterValues("calc");
	double result = 0;

	/* switch (calc) {
		case "덧셈" :
			result = firstNum + secondNum;
			break;
		case "뺄셈" :
			result = firstNum - secondNum;
			break;
		case "곱셈" :
			result = firstNum * secondNum;
			break;
		default :
			result = (double) firstNum / secondNum;
			break;
	} */
	%>

	<%=Arrays.toString(calc) %> <br>

	<%
	if (Arrays.toString(calc).contains("덧셈")) {
		out.println("덧셈 결과는 " + (firstNum + secondNum) + "입니다. <br>");
	}  
	if (Arrays.toString(calc).contains("뺄셈")) {
		out.println("뺄셈 결과는 " + (firstNum - secondNum) + "입니다. <br>");
	}  
	if (Arrays.toString(calc).contains("곱셈")) {
		out.println("곱셈 결과는 " + (firstNum * secondNum) + "입니다. <br>");
	} 
	if(Arrays.toString(calc).contains("나눗셈")) {
		out.println("나눗셈 결과는 " + ((double) firstNum / secondNum) + "입니다. <br>");
	}
	%>


	<br>
</body>
</html>