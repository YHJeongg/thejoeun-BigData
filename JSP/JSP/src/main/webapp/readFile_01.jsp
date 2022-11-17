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
<title>Insert title here</title>
</head>
<body>
<%
	BufferedReader reader = null;
	try {
		String filePath = application.getRealPath("input.txt");
		reader = new BufferedReader(new FileReader(filePath));
		while(true) {
			String str = reader.readLine();
			if(str == null) {
				break;
			}
			out.println(str + "<br>");
		}
		
	} catch(FileNotFoundException fnfe) {
		out.println("파일이 존재하지 않습니다.");
	} catch(IOException ioe) {
		out.println("파일을 읽을수 없습니다.");
	} finally {
		try {
			reader.close();
		} catch(Exception e) {
			
		}
	}
%>
</body>
</html>