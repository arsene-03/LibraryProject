<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.vo.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편의시설 상세 페이지</title>

</head>
<body>
	<%
		BoardVO bVo = (BoardVO)request.getAttribute("board");
		String content = bVo.getBoard_content();	
		if(content!=null) {
			content = content.replace("\n", "<br>")
					.replace("<textarea id=", "")
					.replace("\"textbox\" rows=\"10\" cols=\"30\">", "")
					.replace("</textarea>", "");
		}else {
			content ="";
			
		}
		SimpleDateFormat asdf = new SimpleDateFormat("yyyy.MM.dd");
		String date = asdf.format(bVo.getBoard_time());
	%>
	<div>${board.getBoard_title()}</div>
	<div>
	<span>작성일 <%=date%></span>
	<span>조회수 ${board.getBoard_count()}</span>
	</div>
	
	<img alt="편의시설" id="mainPhoto" src="image/${board.getBoard_picture()}" width="651px" height="434px" onerror="this.src='image/icon/noImg.png'">

	<img alt="편의시설" id="yes" src="image/${board.getBoard_picture()}" width="209px" height="138px" onerror="this.src='image/icon/noImg.png'" onclick="changePic(event)">
	<img alt="편의시설" id="yes" src="image/${board.getBoard_picture2()}" width="209px" height="138px" onerror="this.src='image/icon/noImg.png'" onclick="changePic(event)">
	<img alt="편의시설" id="yes" src="image/${board.getBoard_picture3()}" width="209px" height="138px" onerror="this.src='image/icon/noImg.png'" onclick="changePic(event)">
	<img alt="편의시설" id="yes" src="image/${board.getBoard_picture4()}" width="209px" height="138px" onerror="this.src='image/icon/noImg.png'" onclick="changePic(event)">
	<img alt="편의시설" id="yes" src="image/${board.getBoard_picture5()}" width="209px" height="138px" onerror="this.src='image/icon/noImg.png'" onclick="changePic(event)">
	<img alt="편의시설" id="yes" src="image/${board.getBoard_picture6()}" width="209px" height="138px" onerror="this.src='image/icon/noImg.png'" onclick="changePic(event)">

	<div>${board.getBoard_title()}</div>
	<div><%=content%></div>

	<input type="button" value="목록으로" onclick="location.href='LS?command=SelectBoardList&type=convenient'">
	<div>
		<c:if test="${firstAndEnd_idx[1] == board.getBoard_idx()}">
			<input type="button" value="다음" onclick="location.href='LS?command=imgBoardList_info&idx=${nextBoard_idx}&type=convenient'">
		</c:if>
		<c:if test="${firstAndEnd_idx[0] == board.getBoard_idx()}">
			<input type="button" value="이전" onclick="location.href='LS?command=imgBoardList_info&idx=${beforeBoard_idx}&type=convenient'">
		</c:if>
		<c:if test="${firstAndEnd_idx[1] != board.getBoard_idx() && board.getBoard_idx() != firstAndEnd_idx[0]}">
			<input type="button" value="이전" onclick="location.href='LS?command=imgBoardList_info&idx=${beforeBoard_idx}&type=convenient'">
			<input type="button" value="다음" onclick="location.href='LS?command=imgBoardList_info&idx=${nextBoard_idx}&type=convenient'">
		</c:if>
	</div>
	<c:if test="${member.member_type == 'admin'}">
		<input type="button" value="게시물 수정" onclick="location.href='LS?command=updateBoard_form_action&idx=${board.getBoard_idx()}'">
		<input type="button" value="게시물 삭제" onclick="location.href='LS?command=deleteBoard_action&idx=${board.getBoard_idx()}'"> 
	</c:if>
</body>
<script>
	function changePic(event) {
		var picture = event.currentTarget;
		var pic_src = picture.getAttribute('src');
		var mainPhoto = document.getElementById('mainPhoto');
	
		mainPhoto.setAttribute('src',pic_src);
	}
</script>
</html>