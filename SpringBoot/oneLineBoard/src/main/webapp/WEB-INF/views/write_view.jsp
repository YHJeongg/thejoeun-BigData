<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>글작성</title>
</head>
<body>
	
	<!-- <form action="write.do" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="bName" size="20"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" size="50"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="입력">&nbsp;&nbsp;&nbsp;<a href="list.do">목록보기</a></td>
			</tr>
		</table>
	</form> -->
<div class="container">
<h2>글작성</h2><br>
  <form action="write" method="post">
    <div class="form-group">
      <label for="usr">이름 : </label>
      <input type="text" class="form-control" name="bName">
    </div>
    <div class="form-group">
      <label for="pwd">제목 : </label>
      <input type="text" class="form-control" name="bTitle">
    </div>
    <div class="form-group">
    	<input type="submit" value="입력" class="btn btn-default">&nbsp;&nbsp;&nbsp;<a href="list">목록보기</a>
    </div>
  </form>
</div>
</body>
</html>