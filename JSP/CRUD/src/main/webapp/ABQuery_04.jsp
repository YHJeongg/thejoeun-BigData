<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>

	<h4>수정후 확인 버튼을 누르세요!</h4>
<%	
	request.setCharacterEncoding("utf-8");

	int seq = Integer.parseInt(request.getParameter("seq"));
	String strName = null;
	String strTel = null;
	String strAddress = null;
	String strEmail = null;
	String strRelation = null;
	
	String url_mysql = "jdbc:mysql://localhost:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";	
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String query = "select seq, name, tel, address, email, relation from ABQuery where seq = " + seq;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
		
		ResultSet rs = stmt_mysql.executeQuery(query);
		
		while(rs.next()) {
			strName = rs.getString(2);
			strTel = rs.getString(3);
			strAddress = rs.getString(4);
			strEmail = rs.getString(5);
			strRelation = rs.getString(6);
		}
		conn_mysql.close();
		
		session.setAttribute("SEQ", seq);
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>


	<form method="post">
	SEQ : <input type="text" name="seq" size="10" readonly="true" value="<%=seq%>"> <br>
	성명 : <input type="text" name="name" size="10" value="<%=strName%>"> <br>
	전화번호 : <input type="text" name="tel" size="20" value="<%=strTel%>"> <br>
	주소 : <input type="text" name="address" size="30" value="<%=strAddress%>"> <br>
	전자우편 : <input type="text" name="email" size="30" value="<%=strEmail%>"> <br>
	관계 : <input type="text" name="relation" size="30" value="<%=strRelation%>"> <br><br>
	<input type="submit" value="수정" onclick="javascript: form.action='ABQuery_05.jsp';"/><br>
    <input type="submit" value="삭제" onclick="javascript: form.action='ABQuery_06.jsp';"/>
	</form>
</body>
</html>