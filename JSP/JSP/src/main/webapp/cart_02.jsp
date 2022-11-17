<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String count = request.getParameter("count");
	String size = request.getParameter("size");
	String color = request.getParameter("color");
	
	String fileName = "file.txt";
	
	PrintWriter writer = null;
	
	try {
		String filePath = application.getRealPath(fileName);
		
		writer = new PrintWriter(filePath);
		writer.println("수량 : " + count);
		writer.println("크기 : " + size);
		writer.println("색상 : " + color);
		response.sendRedirect("cart_03.jsp?result=save");
		
	} catch(IOException ioe) {
		response.sendRedirect("cart_03.jsp?result=fail");
	} finally {
		try {
			writer.close();
		} catch(Exception e) {
			
		}
	} 
%>