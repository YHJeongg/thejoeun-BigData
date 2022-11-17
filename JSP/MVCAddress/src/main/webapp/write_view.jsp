<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 작성</title>
</head>
<body>
	<h2>주소록 작성</h2>
	<form action="write.do" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="30"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" size="30"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" size="30"></td>
			</tr>
			<tr>
				<td>전자우편</td>
				<td><input type="text" name="email" size="30"></td>
			</tr>
			<tr>
				<td>관계</td>
				<td><input type="text" name="relation" size="30"></td>
			</tr>
			<tr>
				<td><input type="submit" value="입력"></td><td><a href="list.do">주소록 목록보기</a></td>
			</tr>
		</table>
	</form>
</body>
</html>