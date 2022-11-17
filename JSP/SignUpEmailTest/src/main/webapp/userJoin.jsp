<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 회원가입 이메일 인증 테스트</title>
<style type="text/css">
	body { padding:0px; margin:0px; }
	
	#divPosition {
		position: absolute;
		height: 600px;
		width: 400px;
		margin: -150px 0px 0px -200px;
		top: 50%;
		left: 50%;
	}
</style>
</head>
<body>
		<div class="container-flex" id="divPosition">
			<div class="row">
				<div class="col-sm-4" align="center">
				<form action="userRegisterAction.jsp" method="post">
					<fieldset>
						<legend align="top">회원가입</legend>					
						<table>
							<tr>
								<td><label>아이디</label></td>
								<td><input type="text" name="userID" class="form-control"></td>
							</tr>
							<tr>
								<td><label>비밀번호</label></td>
								<td><input type="password" name="userPassword" class="form-control"></td>
							</tr>
							<tr>
								<td><label>이메일</label> 
								<td><input type="text" name="userEmail" class="form-control"></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" class="btn btn-primary" value="회원가입"></td>
							</tr>
						</table>
					</fieldset>
				</form>
				</div>
			</div>
		</div>
</body>
</html>