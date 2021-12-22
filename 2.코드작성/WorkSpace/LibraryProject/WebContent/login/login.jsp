<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Login.css?ver=23">

<body>
    <div id="login_box">
        <div class="login_ImgColor">
           <a href="LS?command=main"><img src="${pageContext.request.contextPath}/img/logo_2.png" alt="로고"></a>
        </div>
        <form action="LS">
            <input type="hidden" name="command" value="login_action">
            <input type="hidden" name="log_method" value="B">
            <input type="text" name="userId" placeholder="아이디" required>
            <br>
            <input type="password" name="userPwd" placeholder="비밀번호" required>
            <br>
            <div class="Loginbtn">
                <input type="submit" value="로그인">
                <input type="button" value="회원가입" onclick="location.href='LS?command=signup_form_action'">
            </div>
        </form>
    </div>
</body>
</html>