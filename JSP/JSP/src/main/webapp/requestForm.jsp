<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>SignUp</title>
</head>
<body>
	<form action="requestParameter.jsp" method="post">
		<br>
		<table align="center">
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>아이디 : </td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>패스워드 : </td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>취미 : </td>
				<td><input type="checkbox" name="hobby" value="독서" checked="checked"> 독서 
					<input type="checkbox" name="hobby" value="요리"> 요리 
					<input type="checkbox" name="hobby" value="조깅"> 조깅 
					<input type="checkbox" name="hobby" value="수영"> 수영
				</td>
			</tr>
			<tr>
				<td>전공 : </td>
				<td>
					<input type="radio" name="major" value="국어" checked="checked"> 국어 
					<input type="radio" name="major" value="영어"> 영어
					<input type="radio" name="major" value="디자인"> 디자인
				</td>
			</tr>
			<tr>
				<td>Protocol : </td>
				<td>
					<select name="protocol">
						<option value="http" selected="selected">http</option>
						<option value="ftp">ftp</option>
						<option value="smtp">smtp</option>
						<option value="pop">pop</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" class="btn btn-info" name="전송" value="전송"></td>
				<td><input type="reset" class="btn btn-info" name="취소" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>