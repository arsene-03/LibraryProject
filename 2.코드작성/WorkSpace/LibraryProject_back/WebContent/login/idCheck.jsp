<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<h2>아이디 중복 체크</h2>
	<form action="LS" method="POST" name="frm">
		<input type="hidden" name="command" value="idChk_action">
		<label for="member_id">아이디: </label>
		<input type="text" name="member_id" value="${member_id}">
		<input type="submit" value="중복 체크"> <br>

		<c:if test="${result==1}">
			<script type="text/javascript">
				opener.document.frm.member_id.value = "";
			</script>
			${member_id}는 이미 사용중인 아이디 입니다.
		</c:if>
		<c:if test="${result==-1}">
			${member_id}는 사용 가능한 아이디입니다.
			<input type="button" value="사용" onclick="idok()">
		</c:if>
	</form>
</body>
</html>