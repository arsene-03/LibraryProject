<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.vo.BoardVO"%>
<%@ page import="com.library.vo.ReviewVO"%>
<%@ page import="com.library.vo.MemberVO"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관에게 바라다 상세 페이지</title>
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
	href="${pageContext.request.contextPath}/css/frame.css?ver=14">
</head>
<body id="firstPage">
	<jsp:include page="/include/header.jsp" />
	<section>
		<jsp:include page="/include/topMenu.jsp" />
		<div class="container">
			<article class="frame">
				<div class="frame_con" >
				<div class="suggestPage_info_Img"></div>
					<div class="frame_inner">
						
					<%
						BoardVO bVo = (BoardVO) request.getAttribute("board");
						String content = bVo.getBoard_content();
						if (content != null) {
 							content = content.replace("\n", "<br>")
												.replace("<textarea id=", "")
												.replace("\"textbox\" rows=\"10\" cols=\"30\">", "")
												.replace("</textarea>", ""); 
						} else {
							content = "";
						}
						
						SimpleDateFormat asdf = new SimpleDateFormat("yyyy.MM.dd");
						String date = asdf.format(bVo.getBoard_time());
					%>
						<div class="img_topTitle">
							<span>${board.getBoard_title()}</span>
							<span>작성일 <%=date%>&nbsp;&nbsp;&nbsp; 조회수 ${board.getBoard_count()}</span>
						</div>
						<div class="suggestBox">
							<div class="writer">작성자 : ${board.getMember_id()}</div>
							<div class="wirterContent"><%=content%></div>
						</div>
						
						<div class="reviewBox">
							<span>댓글</span>
							<form action="LS" method="POST" class="reviewText">
								<textarea rows="" cols="" name="review_content" required></textarea>
								<input type="hidden" name="command" value="reviewInsert">
								<input type="hidden" name="board_idx" value="${board.getBoard_idx()}">
								<input type="hidden" name="member_id" id="member_id" value="${member.member_id}">
								<input type="submit" class="btnAll" value="작성" onclick="isLoginCheck()">
							</form>
						</div>
						
						<div>
							<ul>
							<%
								List<ReviewVO> reviewList = (List)request.getAttribute("reviewList");
								MemberVO member = (MemberVO)request.getAttribute("member");
							if(reviewList!=null){
								
							
								for(ReviewVO review:reviewList) {
									String reviewDate = asdf.format(review.getReview_time());
							%>
								<li class="reviewLi"> <div class="reviewWriter">작성자:&nbsp;&nbsp;&nbsp;<%=review.getMember_id()%></div><div class="reviewContent"><%=review.getReview_content()%></div><span><%=reviewDate%>
									<c:if test="${member.member_type == 'admin'}">
										<a href="LS?command=reviewDelete&review_idx=<%=review.getReview_idx()%>&board_idx=${board.getBoard_idx()}">삭제</a>
									</c:if>
										</span>
										</li>
							<%		

								}
							}
							%>
							</ul>
						</div>



					<!-- 하단 버튼모음 -->
						<div class="Content_btn ">
						<!-- 목록 -->
							<div>
								<input type="button" value="목록으로" onclick="location.href='LS?command=SelectBoardList&type=suggest'">
							</div>
						<!-- 다음/이전 -->			
							<div class="Content_btn_list">
								<c:if test="${firstAndEnd_idx[1] == board.getBoard_idx()}">
									<input type="button" value="다음" onclick="location.href='LS?command=imgBoardList_info&idx=${nextBoard_idx}&type=suggest'">
								</c:if>
								<c:if test="${firstAndEnd_idx[0] == board.getBoard_idx()}">
									<input type="button" value="이전" onclick="location.href='LS?command=imgBoardList_info&idx=${beforeBoard_idx}&type=suggest'">
								</c:if>
								<c:if test="${firstAndEnd_idx[1] != board.getBoard_idx() && board.getBoard_idx() != firstAndEnd_idx[0]}">
									<input type="button" value="이전" onclick="location.href='LS?command=imgBoardList_info&idx=${beforeBoard_idx}&type=suggest'">
									<input type="button" value="다음" onclick="location.href='LS?command=imgBoardList_info&idx=${nextBoard_idx}&type=suggest'">
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
	<script>
		var memberId = document.getElementById('member_id').value;
		console.log(memberId.length);
		function isLoginCheck() {
			if(memberId.length == 0){
				alert('로그인을 먼저 해주세요');
				return false;	
			}
			return true;
		}
	</script>
</body>
</html>