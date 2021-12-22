<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.library.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="topMenu">

	<div class="topMenu_left"></div>
	<div class="topMenu_right">
		
		<!-- 
			<li><a href="">출판도시문화재단</a></li>
			<li><a href="">지혜의숲</a></li>
			<li><a href="">라이브러리스테이 지지향</a></li>
			<li><a href="">어린이책잔치</a></li>
			<li><a href="">파주북소리</a></li>
			<li><a href="">출판도시 인문학당</a></li>
			<li><a href="">로그인</a></li>
		-->
			<c:if test="${empty member}">
				<div id="login_bar">
					<form action="LS" method="POST" class ="login_bar">
						<input type="hidden" name="command" value="login_action">
						<input type="hidden" name="log_method" value="A"> 
						<input type="hidden" name="test" value="${pageContext.request.contextPath}"> 
						<input type="text" name="userId" placeholder="아이디" required> 
						<input type="password" name="userPwd" placeholder="비밀번호" required>
						<input type="submit" value="로그인" class="btnAll"> 
						<input type="button" value="회원가입" onclick="location.href='LS?command=signup_form_action'" class="btnAll">
						
						
					</form>
				</div>
			</c:if>


					<ul>
					
						<li><a href="LS?command=admin_member_log_action">전체 회원로그 보기</a></li>
						

					<li><a href="LS?command=login_profile_action">개인정보관리</a></li>
					</ul>
				<span>${member.member_name}님 안녕하세요</span>&nbsp;&nbsp;&nbsp;
				<span><a href="LS?command=logout_action">로그아웃</a></span>

			<script>
				window.onload = function() {
					if (!location.hash) {
						location.hash = '#reload';
						location.href = location.href;
					}
				}
			</script>


	</div>
</div>