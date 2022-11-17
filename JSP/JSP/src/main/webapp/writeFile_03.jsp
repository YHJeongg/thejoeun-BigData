<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 저장 결과</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String result = request.getParameter("result");
	
	if(result.equals("save")){
		out.println("저장 되었습니다.");
	} else {
		out.println("파일에 데이터를 쓸수 없습니다.");
	}
%>
</body>
</html>