<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/idChk.css?ver=29">
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<div class="login_ImgColor">
		<h2>아이디 중복 체크</h2>
	</div>
	<form action="LS" method="POST" name="frm">
        <div class="idChkForm">
            <div class="idChkForm_1">
		    <input type="hidden" name="command" value="idChk_action">
		    <label for="member_id" id="idchkInputlabel">아이디: </label>
		    <input type="text" name="member_id" value="${member_id}" id="idchkInputText">
		    <input type="submit" value="중복 체크" id="idchkInputTextBtn"> <br>
            </div>
        </div>

		<c:if test="${result==1}">
			<script type="text/javascript">
				opener.document.frm.member_id.value = "";
			</script>
            <div class="idChkResult">
                <div class="idChkResult_1">${member_id}는 이미 사용중인 아이디 입니다.</div>
            </div>
		</c:if>
        
		<c:if test="${result==-1}">
            <div class="idChkResult">
                <div class="idChkResult_1">${member_id}는 사용 가능한 아이디입니다.</div>
            </div>

            <div id="idchkUseBtn">
			<input type="button" value="사용" onclick="idok()">
            </div>
		</c:if>
	</form>
</body>
</html>