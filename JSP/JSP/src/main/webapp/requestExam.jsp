<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator</title>
</head>
<body>
	<form action="requestParameterExam.jsp" method="get">
		계산을 위한 숫자를 입력하세요. <br> 
		<!-- 숫자 1 : <input type="text" name="firstNum" /> <br> 
		숫자 2 : <input type="text" name="secondNum" /> <br> -->
		숫자 1 : <select name="firstNum">
		<%
			for(int i = 1; i < 101; i++) {	
		%>
				<option><%=i %></option>
		<%
			}
		%>
		</select><br>
		
		숫자 2 : <select name="secondNum">
		<%
			for(int i = 1; i < 101; i++) {	
		%>
				<option><%=i %></option>
		<%
			}
		%>
		</select><br>
		
		계산방법 : <br> <!-- <br> <input type="radio" name="calc" value="덧셈"
			checked="checked" /> 덧셈 <br> <input type="radio" name="calc"
			value="뺄셈" /> 뺄셈 <br> <input type="radio" name="calc"
			value="곱셈" /> 곱셈 <br> <input type="radio" name="calc"
			value="나눗셈" /> 나눗셈 <br>  -->
			<input type="checkbox" name="calc" value="덧셈" checked="checked"> 덧셈 <br>
			<input type="checkbox" name="calc" value="뺄셈"> 뺄셈 <br>
			<input type="checkbox" name="calc" value="곱셈"> 곱셈 <br>
			<input type="checkbox" name="calc" value="나눗셈"> 나눗셈 <br>
			<input type="submit" class="btn btn-info" name="계산" value="계산" />
	</form>
</body>
</html>