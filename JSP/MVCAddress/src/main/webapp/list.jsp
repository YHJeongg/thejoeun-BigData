<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>MVC 주소록</title>
</head>
<body>
<div class="container" align="center">
	<h1>MVC 주소록</h1>
	<div class="col-lg-20" align="center">
	<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>전자우편</th>
			<th>관계</th>
		</tr>
	</thead>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><a href="content_view.do?seq=${dto.seq}">${dto.seq}</a></td>
				<td>${dto.name}</td>
				<td>${dto.tel}</td>
				<td>${dto.address}</td>
				<td>${dto.email}</td>
				<td>${dto.relation}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6"><a href="write_view.do">주소록 등록</a></td>
		</tr>
	</table>
	</div></div>
</body>
</html>