<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

	String queryName = request.getParameter("query");
	String queryContent = request.getParameter("content");

	if(queryName == null) {
		queryName = "address";
		queryContent = "";
	}

	int cnt = 0;
	String url_mysql = "jdbc:mysql://localhost:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";	
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String query = "select seq, name, tel, address, email, relation from ABQuery ";
	String query2 = "where " + queryName + " like '%" + queryContent + "%'";
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
		
		ResultSet rs = stmt_mysql.executeQuery(query + query2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>주소록 명단 리스트</title>
</head>
<body>
<div class="container">
<h3>주소록 명단 리스트</h3></div><br>
<div class="container">
<form action="ABQuery.jsp" class="form-inline">
	<span style="font-size:1.2em">검색 선택 :</span> &nbsp;
		<select name="query" class="form-control">
			<option value="name" selected="selected">이름</option>
			<option value="tel">전화번호</option>
			<option value="address">주소</option>
			<option value="relation">관계</option>
		</select> &nbsp;
		<input type="text" class="form-control" name="content" size="30">
</form><br></div>
<hr>


<div class="container">
	<table class="table table-bordered">
		<tr>
			<th>Seq</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>전자우편</th>
			<th>관계</th>
		</tr>	

<%
		while(rs.next()) {
%>
		<tr>
			<td><a href="ABQuery_04.jsp?seq=<%=rs.getInt(1)%>"><%=rs.getInt(1) %></a></td>
			<td><%=rs.getString(2) %>
			<td><%=rs.getString(3) %>
			<td><%=rs.getString(4) %>
			<td><%=rs.getString(5) %>
			<td><%=rs.getString(6) %>
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
	</div><center>
	<form action="ABQuery_02.jsp" method="post">
		<input class="btn btn-default" type="submit" value="입력"><br>
	</form>
	
	<hr>
	총 인원은 <%=cnt %>명 입니다.
	</center>
</body>
</html>