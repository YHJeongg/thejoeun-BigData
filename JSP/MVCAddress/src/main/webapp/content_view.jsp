<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정 및 삭제</title>
</head>
<body>
	<h2>수정 및 삭제</h2>
	<form action="modify.do" method="post">
		<table>
			<tr>
				<td>번호</td>
				<td><input type="text" name="seq" value="${content_view.seq}" readonly="true" size="30"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="30" value="${content_view.name}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" size="30" value="${content_view.tel}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" size="30" value="${content_view.address}"></td>
			</tr>
			<tr>
				<td>전자우편</td>
				<td><input type="text" name="email" size="30" value="${content_view.email}"></td>
			</tr>
			<tr>
				<td>관계</td>
				<td><input type="text" name="relation" size="30" value="${content_view.relation}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;&nbsp;<a href="list.do">목록보기</a>
				&nbsp;&nbsp;&nbsp;<a href="delete.do?seq=${content_view.seq}">삭제</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>