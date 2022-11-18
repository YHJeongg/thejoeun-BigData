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
<title>MVC 게시판</title>
</head>
<body>
<div class="container" align="center">
	<h1>MVC 게시판</h1>
	<div class="col-lg-20" align="center">
	<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
			<th>삭제</th>
		</tr>
	</thead>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.bId}</td>
				<td>${dto.bName}</td>
				<td>${dto.bTitle}</td>
				<td>${dto.insertdate}</td>
				<td><a href="delete?bId=${dto.bId}">X</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><a href="write_view">글작성</a></td>
		</tr>
	</table>
	</div></div>
</body>
</html>