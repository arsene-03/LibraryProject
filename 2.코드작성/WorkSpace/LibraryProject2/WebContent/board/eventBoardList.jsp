<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.vo.BoardVO"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 게시판 페이지</title>
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
	href="${pageContext.request.contextPath}/css/frame.css?ver=6">
</head>
<body id="firstPage">
	<jsp:include page="/include/header.jsp" />
	<section>
		<jsp:include page="/include/topMenu.jsp" />
		
		<div class="container">
			<article class="frame">
				<div class="frame_con" >
					<div class="frame_inner">
						<div>이벤트</div>
						<div>total_${totalCnt}</div>
				
						<!-- 검색창 -->
						<div>
							<form action="LS" method="POST">
								<input type="hidden" name="command" value="SelectBoardList">
								<input type="hidden" name="type" value="event">
								<input type="hidden" name="_section" value="">
								<input type="hidden" name="_pageNum" value="">
								<input type="text" name="searchText">
								<input type="image" src="./image/icon/btn_search.png" name="Submit" value="Submit">
							</form>
						</div>
						
						<table>
							<%
							List<BoardVO> boardList_event = (List) request.getAttribute("boardList");
	
							for (BoardVO board : boardList_event) {
								SimpleDateFormat asdf = new SimpleDateFormat("yyyy.MM.dd");
								String date = asdf.format(board.getBoard_time());
								String content = board.getBoard_content();
								
								if (content != null) {
									content = content.replace("\n", "")
												.replace("<textarea id=", "")
												.replace("\"textbox\" rows=\"10\" cols=\"30\">", "")
												.replace("</textarea>", "");
								} else {
								content = "";
								}
							%>
							<tr>
							
								<!-- 게시판 이미지 부분 -->
								<td>
									<a href="LS?command=imgBoardList_info&idx=<%=board.getBoard_idx()%>&type=event">
										<img alt="이벤트" src="image/<%=board.getBoard_picture()%>" width="482px" height="197px" onerror="this.src='image/icon/noImg.png'">
									</a>
								</td>
								
								<!-- 게시판 제목/내용 부분 -->
								<td>
									<div><%=board.getBoard_title()%></div>
									<div><%=content%></div>
									<div>
										<span><%=date%></span><span>조회수 <%=board.getBoard_count()%></span>
									</div>
								</td>
								
							</tr>
							<%
							}
							%>
						</table>

					<!-- 페이징 -->
	 						<div class = "cls2">
								<c:if test="${totalCnt != null}">
									<c:choose>
										<c:when test="${totalCnt > 100}">
											<c:if test="${(section*100) < totalCnt}"><!-- >> -->
												<c:forEach var="page" begin="1" end="10" step="1">
													<c:if test="${section <=1 && page==1}">
										<!-- 이전버튼 -->  <a href="#"><img alt="pre" src="image/icon/preBut.png"></a>
													</c:if>
													
													<c:if test="${section >1 && page==1}">
										<!-- 이전버튼 -->  <a href="LS?command=SelectBoardList&type=event&section=${section-1}&pageNum=${10}"><img alt="pre" src="image/icon/preBut.png"></a>
													</c:if>
													
								        <!-- 페이지 넘버 --> <a href="LS?command=SelectBoardList&type=event&section=${section}&pageNum=${page}"><SPAN class ="page_number">&nbsp;&nbsp;${(section-1)*10+page}&nbsp;&nbsp;</SPAN><c:if test="${page<10}"></c:if></a>
													
													<c:if test="${page == 10}">
										<!-- 다음버튼 -->	<a href="LS?command=SelectBoardList&type=event&section=${section+1}&pageNum=${1}"><img alt="next" src="image/icon/nextBut.png"></a>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${(section)*100 > totalCnt}">
												<c:forEach var="page" begin="1" end="${((totalCnt+9)-((section-1)*100))/10}" step="1">
													<c:if test="${section >1 && page==1}">
										<!-- 이전버튼 --> <a href="LS?command=SelectBoardList&type=event&section=${section-1}&pageNum=${10}"><img alt="pre" src="image/icon/preBut.png"></a>
													</c:if>	
										<!-- 페이지 넘버 --><a href="LS?command=SelectBoardList&type=event&section=${section}&pageNum=${page}"><SPAN class ="page_number">&nbsp;&nbsp;${(section-1)*10+page}&nbsp;&nbsp;</SPAN><c:if test="${page<10}"></c:if></a>
												</c:forEach>
										<!-- 다음버튼 -->	<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
											</c:if>
										</c:when>
										
										<c:when test="${totalCnt == 90}">
										<!-- 이전버튼 -->  <a href="#"><img alt="pre" src="image/icon/preBut.png"></a>
											<c:forEach var="page" begin="1" end="10" step="1">
										<!-- 페이지 넘버 --><a href="LS?command=SelectBoardList&type=event&section=${section}&pageNum=${page}"><SPAN class ="page_number">&nbsp;&nbsp;${(section-1)*10+page}&nbsp;&nbsp;</SPAN><c:if test="${page<10}"></c:if></a>
											</c:forEach>
										<!-- 다음버튼 -->	<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
										</c:when>
										
										<c:when test="${totalCnt < 90}">
										<!-- 이전버튼 --> <a href="#"><img alt="pre" src="image/icon/preBut.png"></a>
											<c:forEach var="page" begin="1" end="${(totalCnt+9)/10}" step="1">	
										<!-- 페이지 넘버 --><a href="LS?command=SelectBoardList&type=event&section=${section}&pageNum=${page}"><SPAN class ="page_number">&nbsp;&nbsp;${(section-1)*10+page}&nbsp;&nbsp;</SPAN><c:if test="${page<10}"></c:if></a>
											</c:forEach>
										<!-- 다음버튼 -->	<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
										</c:when>
									</c:choose>
								</c:if>
							</div> <!-- cls2 -->
							
					<!-- 관리자 접속 시 게시물 등록 버튼 -->	
						<c:if test="${member.member_type == 'admin'}">
							<div class="insertBtn">
								<input type="button" value="게시물 등록" onclick="location.href='LS?command=insertBoard_form_action&type=event'">
							</div>
						</c:if>
		
					</div> <!-- frame_inner_Board -->
				</div> <!-- frame_con -->
			</article>
		</div> <!-- container -->
	</section>
</body>
</html>