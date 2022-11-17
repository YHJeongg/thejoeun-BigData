<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int firstNum = Integer.parseInt(request.getParameter("firstNum"));
	int secondNum = Integer.parseInt(request.getParameter("secondNum"));

	response.sendRedirect("calcExam_03.jsp?firstNum=" + firstNum + "&secondNum=" + secondNum + "&Num=0");
%>