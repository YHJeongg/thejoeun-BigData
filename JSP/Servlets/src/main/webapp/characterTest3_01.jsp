<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>성격 테스트</title>
	</head>
	<body>
		<form action="characterTest3" method="post">
		<h1>성격 테스트</h1>
		<br>
		당신의 성격을 테스트 합니다. 데이터를 입력한 후 확인 버튼을 눌러주세요.
		이름은? <input type="text" name="name" size="7"> <br>
		좋아하는 색은?
					<input type="radio" name="color" value="노랑"> 노랑
					<input type="radio" name="color" value="빨강" checked="checked"> 빨강
					<input type="radio" name="color" value="파랑"> 파랑<br>
		
		좋아하는 동물은?
					<select name="animal">
						<option value="강아지" selected="selected">강아지</option>
						<option value="고양이">고양이</option>
						<option value="햄스터">햄스터</option>
						<option value="거북이">거북이</option>
					</select>
					<br>
		좋아하는 음식은? (모두고르세요)
					<input type="checkbox" name="food" value="짜장면"> 짜장면 
					<input type="checkbox" name="food" value="짬뽕"> 짬뽕
					<input type="checkbox" name="food" value="탕수육"> 탕수육
					<br>
					
					<input type="submit" class="btn btn-info" name="okBtn" value="확인">
					
		</form>
	</body>
</html>