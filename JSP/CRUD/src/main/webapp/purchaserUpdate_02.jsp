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

<script type="text/javascript">
	function checkMember(){
		
		var regExpName = /^[가-힣]+$/
		var regExpTel = /^\d{3}-\d{3,4}-\d{4}$/
		var regExpAddress = /^[가-힣|0-9| ]*$/
		
		var form = document.Member
		
		var name = form.name.value
		var tel = form.tel.value
		var address = form.address.value
		
		if(!regExpName.test(name)){
			alert("이름은 한글만으로 입력해 주세요")
			form.name.select()
			return
		}
		
		if(!regExpTel.test(tel)){
			alert("연락처 입력을 확인해 주세요")
			form.tel.select()
			return
		}
		
		if(!regExpAddress.test(address)){
			alert("주소를 확인해 주세요")
			form.address.select()
			return
		}
		form.submit()
	}
</script>

	<h4>수정후 확인 버튼을 누르세요.</h4>
<%	
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String strUserid = null;
	String strName = null;
	String strTel = null;
	String strAddress = null;
	
	String url_mysql = "jdbc:mysql://localhost:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";	
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String query = "select userid, name, tel, address from purchaserinfo where userid = '" + id + "'";
	
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
		
		session.setAttribute("ID", id);
		session.setAttribute("OLD", strUserid);
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>



	<form name="Member" action="purchaserUpdate_03.jsp" method="post">
	사용자 ID : <input type="text" name="userid" size="10" readonly="true" value="<%=strUserid%>"> <br>
	성명 : <input type="text" name="name" size="10" value="<%=strName%>"> <br>
	전화번호 : <input type="text" name="tel" size="20" value="<%=strTel%>"> <br>
	주소 : <input type="text" name="address" size="30" value="<%=strAddress%>"> <br>
	<p><input type="button" value="확인" onclick="checkMember()">
	</form>
</body>
</html>