<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<div id="login_bar2">
		<form action="LS">
			<input type="hidden" name="command" value="login_action">
			<input type="hidden" name="log_method" value="B">
			<input type="text" name="userId" placeholder="아이디" required>
			<input type="password" name="userPwd" placeholder="비밀번호" required>
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='LS?command=signup_form_action'">
		</form>
		</div>
</body>
</html>