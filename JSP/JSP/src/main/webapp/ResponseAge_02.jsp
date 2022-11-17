<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int age = Integer.parseInt(request.getParameter("age"));
	
	String adult = URLEncoder.encode("성인", "utf-8");
	String posible = URLEncoder.encode("가능", "utf-8");
	String kids = URLEncoder.encode("미성년자", "utf-8");
	String imposible = URLEncoder.encode("불가능", "utf-8");
	
	if(age >= 20) {
		response.sendRedirect("http://localhost:8080/JSP/ResponseAge_03.jsp?age=" + age + "&adult="+adult+"&posible=" + posible);
	} else {
		response.sendRedirect("http://localhost:8080/JSP/ResponseAge_03.jsp?age=" + age + "&adult="+kids+"&posible=" + imposible);
	}
%>