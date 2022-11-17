<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객정보 수정</title>
</head>
<body>

	<h4>고객명단 수정 및 삭제</h4>
<%	
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String strUserid = null;
	String strName = null;
	String strTel = null;
	String strAddress = null;
	
	String url_mysql = "jdbc:mysql://localhost:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";	
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String query = "select userid, name, tel, address from purchaserinfo where userid = '" + userid + "'";
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
		
		ResultSet rs = stmt_mysql.executeQuery(query);
		
		while(rs.next()) {
			strUserid = rs.getString(1);
			strName = rs.getString(2);
			strTel = rs.getString(3);
			strAddress = rs.getString(4);
		}
		conn_mysql.close();
		
		session.setAttribute("ID", userid);
		session.setAttribute("OLD", strUserid);
		
		if(strUserid == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("dataError.jsp");
			dispatcher.forward(request, response);
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>


	<form method="post">
	사용자 ID : <input type="text" name="userid" size="10" readonly="true" value="<%=strUserid%>"> <br>
	성명 : <input type="text" name="name" size="10" value="<%=strName%>"> <br>
	전화번호 : <input type="text" name="tel" size="20" value="<%=strTel%>"> <br>
	주소 : <input type="text" name="address" size="30" value="<%=strAddress%>"> <br>
	<input type="submit" value="수정" onclick="javascript: form.action='purchaserSelect_03.jsp';"/><br>
    <input type="submit" value="삭제" onclick="javascript: form.action='purchaserSelect_04.jsp';"/>
	</form>
</body>
</html>