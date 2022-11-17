<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedReader"%>
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
	BufferedReader reader = null;
	try {
		String filePath = application.getRealPath("file.txt");
		reader = new BufferedReader(new FileReader(filePath));
		while(true) {
			String str = reader.readLine();
			if(str == null) {
				break;
			}
			out.println(str + "<br>");
		}
		response.sendRedirect("cart_05.jsp?reader=" + reader);
		
	} catch(FileNotFoundException fnfe) {
		response.sendRedirect("cart_05.jsp?result=fail1");
	} catch(IOException ioe) {
		response.sendRedirect("cart_05.jsp?result=fail2");
	} finally {
		try {
			reader.close();
		} catch(Exception e) {
			
		}
	}
%>
</body>
</html>