<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 선택 저장 결과</title>
</head>
<body>
<h1>상품 선택 저장 결과</h1><br><br>
<%
	request.setCharacterEncoding("utf-8");
	String result = request.getParameter("result");
	
	if(result.equals("save")){
		out.println("저장 되었습니다.");
	} else {
		out.println("파일에 데이터를 쓸수 없습니다.");
	}
%>
<br><br>
<form action="cart_04.jsp" method="post">
	<input type="submit" value="저장 결과 불러오기" />
</form>
</body>
</html>