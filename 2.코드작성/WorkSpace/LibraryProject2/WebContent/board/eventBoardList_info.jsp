<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.vo.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세 페이지</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibraryAll.css?ver=9">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibraryHeader.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection_lft.css?ver=1">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection_rgt.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Libraryfooter.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/frame.css?ver=4">
</head>
<body id="firstPage">
	<jsp:include page="/include/header.jsp" />
	<section>
		<jsp:include page="/include/topMenu.jsp" />
		
		<div class="container">
			<article class="frame">
				<div class="frame_con" >
					<div class="frame_inner">
					<%
						BoardVO bVo = (BoardVO) request.getAttribute("board");
						String content = bVo.getBoard_content();
						if (content != null) {
							content = content.replace("\n", "<br>").replace("<textarea id=", "")
												.replace("\"textbox\" rows=\"10\" cols=\"30\">", "")
												.replace("</textarea>", "");
						} else {
							content = "";
						}
						
						SimpleDateFormat asdf = new SimpleDateFormat("yyyy.MM.dd");
						String date = asdf.format(bVo.getBoard_time());
					%>
						<div>${board.getBoard_title()}</div> 
						<div>
							<span>작성일 <%=date%></span> <span>조회수 ${board.getBoard_count()}</span>
						</div>
						<div>
							<img alt="이벤트사진" src="image/${board.getBoard_picture()}" onerror="this.src='image/icon/noImg.png'">
						</div>
						
						<br>
						<div><%=content%></div>

					<!-- 하단 버튼모음 -->
						<div class="Content_btn ">
						<!-- 목록 -->
							<div>
								<input type="button" value="목록으로" onclick="location.href='LS?command=SelectBoardList&type=event'">
							</div>
						<!-- 다음/이전 -->			
							<div class="Content_btn_list">
								<c:if test="${firstAndEnd_idx[1] == board.getBoard_idx()}">
									<input type="button" value="다음" onclick="location.href='LS?command=imgBoardList_info&idx=${nextBoard_idx}&type=event'">
								</c:if>
								<c:if test="${firstAndEnd_idx[0] == board.getBoard_idx()}">
									<input type="button" value="이전" onclick="location.href='LS?command=imgBoardList_info&idx=${beforeBoard_idx}&type=event'">
								</c:if>
								<c:if test="${firstAndEnd_idx[1] != board.getBoard_idx() && board.getBoard_idx() != firstAndEnd_idx[0]}">
									<input type="button" value="이전" onclick="location.href='LS?command=imgBoardList_info&idx=${beforeBoard_idx}&type=event'">
									<input type="button" value="다음" onclick="location.href='LS?command=imgBoardList_info&idx=${nextBoard_idx}&type=event'">
								</c:if>
							</div>
						<!-- 게시물 수정/삭제 -->
							<div>
								<c:if test="${member.member_type == 'admin'}">
									<input type="button" value="게시물 수정" onclick="location.href='LS?command=updateBoard_form_action&idx=${board.getBoard_idx()}'">
									<input type="button" value="게시물 삭제" onclick="location.href='LS?command=deleteBoard_action&idx=${board.getBoard_idx()}&type=${board.getBoard_type()}'">
								</c:if>
							</div>	
							
						</div> <!-- Content_btn -->
					</div> <!-- frame_inner -->
				</div> <!-- frame_con -->	
			</article>
		</div>
	</section>
</body>
</html>