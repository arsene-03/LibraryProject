<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
    <form action="LS" method="POST" name="frm">
    	<input type="hidden" name="command" value="signup_action">	
    	<fieldset>
    		<legend>필수정보</legend>
    			<table>
    				<tr>
    					<td><label for="member_id">아이디: </label></td>
    					<td><input type="text" name="member_id" id="member_id"></td>
    					<td>
    						<input type="button" value="중복확인" onclick="idChk()">
    						<input type="hidden" name="reid" id="reid">
    					</td>
    				</tr>
    				<tr>
    					<td><label for="member_name">이름: </label></td>
    					<td><input type="text" name="member_name" id="member_name"></td>
    				</tr>
    				<tr>
    					<td><label for="member_pwd">비밀번호: </label></td>
    					<td><input type="password" name="member_pwd" id="member_pwd"></td>
    				</tr>
    				<tr>
    					<td><label for="member_pwdChk">비밀번호 확인: </label></td>
    					<td><input type="password" name="member_pwdChk" id="member_pwdChk"></td>
    				</tr>
    				<tr>
    					<td><label for="member_type">회원 유형: </label></td>
    					<td>
    						<label for="common">일반회원</label>
    						<input type="radio" name="member_type" id="common" value="common" checked>
    						<label for="admin">관리자</label>
    						<input type="radio" name="member_type" id="admin" value="admin">
    						
    					</td>
    				</tr>
    			</table>
    	</fieldset>
    	<fieldset>
    		<legend>부가정보</legend>
    			<table>
    				<tr>
    					<td><label for="jumin_1">주민번호: </label></td>
    					<td><input type="text" name="jumin_1" id="jumin_1" maxlength="6"> - <input type="text" name="jumin_2" id="jumin_2" maxlength="7"></td>
    				</tr>
    				<tr>
    					<td><label for="member_address">주소: </label></td>
    					<td><input type="text" name="member_address" id="member_address"></td>
    				</tr>
    				<tr>
    					<td><label for="member_email">이메일: </label></td>
    					<td><input type="email" name="member_email" id="member_email"></td>
    				</tr>
    				<tr>
    					<td><label for="member_tel_1">전화번호: </label></td>
    					<td>
    						<input type="tel" name="member_tel_1" id="member_tel_1" maxlength="3"> - 
    						<input type="tel" name="member_tel_2" id="member_tel_2" maxlength="4"> - 
    						<input type="tel" name="member_tel_3" id="member_tel_3" maxlength="4">
    					</td>
    				</tr>
    			</table>		
    	</fieldset>
        <input type="submit" value="회원가입" onclick="return joinCheck()">
        <input type="reset" value="취소">
    </form>
</body>
</html>