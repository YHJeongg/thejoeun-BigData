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
	request.setCharacterEncoding("utf-8");
	String sitename = request.getParameter("sitename");

	switch(sitename) {
	case "naver" :
	case "네이버" :
		response.sendRedirect("https://www.naver.com");
		break;
	case "daum" :
	case "다음" :
		response.sendRedirect("https://www.daum.net");
		break;
	case "google" :
	case "구글" :
		response.sendRedirect("https://www.google.com");
		break;
	default :
		response.sendRedirect("https://www.yahoo.com");
	}
%>
</body>
</html>