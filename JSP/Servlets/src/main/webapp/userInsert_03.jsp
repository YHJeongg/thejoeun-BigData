<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String check = request.getParameter("check");
	
	if(check.equals("동의 함")) {
		response.sendRedirect("userInsert_04.jsp");
	} else {
		response.sendRedirect("userInsert_01.jsp");
	}
%>