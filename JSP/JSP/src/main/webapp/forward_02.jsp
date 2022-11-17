<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	request.setAttribute("ADD", num1 + num2);
	request.setAttribute("SUB", num1 - num2);
	request.setAttribute("MUL", num1 * num2);
	request.setAttribute("DIV", (double) num1 / num2);
	request.setAttribute("TEST", "대한민국");
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("forward_03.jsp");
	dispatcher.forward(request, response);
%>