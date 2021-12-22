<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" name="result" value="${result}">
	<input type="hidden" name="result_condi" value="${result_condi}">
	<input type="hidden" name="condi" value="${condi}">
	<input type="hidden" name="msg" value="${msg}">
	<input type="hidden" name="login_method" value="${login_method}">
	<input type="hidden" name="type" value="${type}">
</body>
<script>
	var result = document.getElementsByTagName('input')[0].value;
	var result_condi = document.getElementsByTagName('input')[1].value;
	var condi = document.getElementsByTagName('input')[2].value;
	var msg = document.getElementsByTagName('input')[3].value;
	var login_method = document.getElementsByTagName('input')[4].value;
	var type = document.getElementsByTagName('input')[5].value;
	var referrer = document.referrer;
	if (result=='insert') {
		switch (condi) {
		case "insert":
			if(result_condi) {
				alert("게시물을 등록했습니다.");
			}else {
				alert("게시물 등록을 실패했습니다.")
			}
			break;
		case "update":
			if(result_condi) {
				alert("게시물을 수정했습니다.");	
			}else {
				alert("게시물 수정을 실패했습니다.");
			}
			break;
		}
		url = "LS?command=SelectBoardList&type="+type;
		location.href=url;
	}else if(result=='delete') {
		if(result_condi) {
			alert("게시물을 삭제했습니다.");
		}else {
			alert("게시물 삭제를 실패했습니다.");
		}
		url = "LS?command=SelectBoardList&type="+type;
		location.href=url;
	}else if(result=='login') {
		alert(msg);
		if (login_method == 'A') {
			location.href = referrer;
		}else if(login_method == 'B') {
			location.href = "LS?command=main";
		}else if(login_method == 'fail') {
			location.href = "LS?command=login_form_action";
		}
	}else if(result=='signup') {
		alert('회원가입이 완료되었습니다.')
		location.href = "LS?command=login_form_action";
	}

</script>
</html>