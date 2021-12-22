<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.library.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
	<p>메인화면</p>
	<a href="LS?command=forest">소개 화면으로</a>
	<a href="LS?command=SelectBoardList&type=convenient">편의 시설</a>
	<a href="LS?command=SelectBoardList&type=notice">공지사항</a>
	<a href="LS?command=SelectBoardList&type=event">이벤트</a>
	<a href="LS?command=SelectBoardList&type=suggest">도서관에 바라다</a>
<c:if test="${empty member}">
	<div id="login_bar">
		<form action="LS" method="POST">
			<input type="hidden" name="command" value="login_action">
			<input type="hidden" name="log_method" value="A">
			<input type="text" name="userId" placeholder="아이디" required>
			<input type="password" name="userPwd" placeholder="비밀번호" required>
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='LS?command=signup_form_action'">
		</form>
	</div>
</c:if>
<c:if test="${not empty member}">
	<span>${member.member_name}님 안녕하세요</span>
	<span><a href="LS?command=logout_action">로그아웃</a></span>
</c:if>
<script>
	window.onload = function() {
		if (!location.hash) { 
			location.hash = '#reload';
			location.href = location.href;
		}
	}
</script>
</body>
</html>