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
<div align="center">
	<h1>영화 검색</h1>
</div>
<div class="container" align="center">
	<div class="row">
	<table class="table table-hover">
	<thead>
		<tr>
			<th>영화 이미지</th>
			<th>영화 제목</th>
		</tr>
	</thead>
	<% int count = 0; %>
		<c:forEach items="${list}" var="dto">
		<% count++; %>
			<tr>
				<td><img src="${dto.image}"></td>
				<td style="vertical-align: middle;">${dto.title}</td>
			</tr>
		</c:forEach>
	</table>
	검색결과는 <%=count %>건 입니다.
	</div></div>
</body>
</html>