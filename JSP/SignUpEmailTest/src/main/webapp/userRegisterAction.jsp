<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jsplec.dto.UserDTO"%>
<%@ page import="com.jsplec.dao.UserDAO"%>
<%@ page import="com.jsplec.util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	/* 로그인한 상태라면 가입을 진행할 수 없다. */
	String userID = null;
	/* if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null){
		userID = (String) session.getAttribute("userID");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 상태입니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	} */
	String userPassword = null;
	String userEmail = null;
	if(request.getParameter("userID") != null){
		userID = (String) request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null){
		userPassword = (String) request.getParameter("userPassword");
	}
	if(request.getParameter("userEmail") != null){
		userEmail = (String) request.getParameter("userEmail");
	}
	
	/********** 입력하지 않은 사항이 있을 때 처리 ***********/
	
	if(userID == null || userPassword == null || userEmail == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력을 다시 확인해주세요');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userID, userPassword, userEmail, SHA256.getSHA256(userEmail), false));
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.back();"); 
		script.println("</script>");
		script.close();
	} else{
		session.setAttribute("userID", userID);    // ID 등록
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendAction.jsp'"); // 이메일 인증
		script.println("</script>");
		script.close();
	}
	
%>