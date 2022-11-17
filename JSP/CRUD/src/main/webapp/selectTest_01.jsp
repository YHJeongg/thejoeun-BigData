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
<%
	int cnt = 0;
	String url_mysql = "jdbc:mysql://localhost:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";	
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String query = "select id, userid from wtest";
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
		
		ResultSet rs = stmt_mysql.executeQuery(query);
%>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>유저아이디</th>
		</tr>	

<%
		while(rs.next()) {
%>
		<tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %>
		</tr>
<%
			cnt++;
		}
		
		conn_mysql.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
	</table><br>
	총 인원은 <%=cnt %>명 입니다.
	
</body>
</html>
</body>
</html>