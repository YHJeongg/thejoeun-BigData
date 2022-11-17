<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 선택 저장 내용</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String result = request.getParameter("result");
	String str = request.getParameter("str");
	
	if(result.equals("fail1")){
		out.println("파일이 존재하지 않습니다.");
	} else if(result.equals("fail2")) {
		out.println("파일을 읽을수 없습니다.");
	}
%>
</body>
</html>