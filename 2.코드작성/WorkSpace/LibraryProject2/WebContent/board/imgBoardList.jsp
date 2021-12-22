<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.library.vo.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편의시설 게시판 페이지</title>
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
	href="${pageContext.request.contextPath}/css/frame.css?ver=42">
</head>
<body id="firstPage">
	<jsp:include page="/include/header.jsp" />
	<section>
		<jsp:include page="/include/topMenu.jsp" />
		
		<div class="container">
			<article class="frame">
				<div class="frame_con">
					<div class="frame_inner_Board">
						
						<div>
							<div class="pageTitle">편의시설 안내</div>
							<br>
						
							<table class="imgBoard">
								<tr>
								<%
									int count = 1;
									List<BoardVO> boardList_convenient = (List) request.getAttribute("boardList");
									
									for (BoardVO board : boardList_convenient) {
										count++;
								%>
									<td>
									<!-- 이미지 부분 -->
										<a href="LS?command=imgBoardList_info&idx=<%=board.getBoard_idx()%>&type=convenient">
											<img alt="편의시설" src="image/<%=board.getBoard_picture()%>"	onerror="this.src='image/icon/noImg.png'" class="imgBoardImg">
										</a>
										
									<!-- 제목 + 버튼 부분 -->
										<div class="imgTitleTag"><span><%=board.getBoard_title()%></span> 
											<input type="button" value="+더보기"	onclick="location.href='LS?command=imgBoardList_info&idx=<%=board.getBoard_idx()%>&type=convenient'" class="btnAll">
										</div>
									</td>
								<%
										if (count % 3 == 1) {
											out.println("</tr>");
											out.println("<tr>");
										}
									}
								%>
								</tr>
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
										<!-- 이전버튼 -->  <a href="LS?command=SelectBoardList&type=convenient&section=${section-1}&pageNum=${10}"><img alt="pre" src="image/icon/preBut.png"></a>
													</c:if>
													
								        <!-- 페이지 넘버 --> <a href="LS?command=SelectBoardList&type=convenient&section=${section}&pageNum=${page}"><SPAN class ="page_number">&nbsp;&nbsp;${(section-1)*10+page}&nbsp;&nbsp;</SPAN><c:if test="${page<10}"></c:if></a>
													
													<c:if test="${page == 10}">
										<!-- 다음버튼 -->	<a href="LS?command=SelectBoardList&type=convenient&section=${section+1}&pageNum=${1}"><img alt="next" src="image/icon/nextBut.png"></a>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${(section)*100 > totalCnt}">
												<c:forEach var="page" begin="1" end="${((totalCnt+9)-((section-1)*100))/10}" step="1">
													<c:if test="${section >1 && page==1}">
										<!-- 이전버튼 --> <a href="LS?command=SelectBoardList&type=convenient&section=${section-1}&pageNum=${10}"><img alt="pre" src="image/icon/preBut.png"></a>
													</c:if>	
										<!-- 페이지 넘버 --><a href="LS?command=SelectBoardList&type=convenient&section=${section}&pageNum=${page}"><SPAN class ="page_number">&nbsp;&nbsp;${(section-1)*10+page}&nbsp;&nbsp;</SPAN><c:if test="${page<10}"></c:if></a>
												</c:forEach>
										<!-- 다음버튼 -->	<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
											</c:if>
										</c:when>
										
										<c:when test="${totalCnt == 90}">
										<!-- 이전버튼 -->  <a href="#"><img alt="pre" src="image/icon/preBut.png"></a>
											<c:forEach var="page" begin="1" end="10" step="1">
										<!-- 페이지 넘버 --><a href="LS?command=SelectBoardList&type=convenient&section=${section}&pageNum=${page}"><SPAN class ="page_number">&nbsp;&nbsp;${(section-1)*10+page}&nbsp;&nbsp;</SPAN><c:if test="${page<10}"></c:if></a>
											</c:forEach>
										<!-- 다음버튼 -->	<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
										</c:when>
										
										<c:when test="${totalCnt < 90}">
										<!-- 이전버튼 --> <a href="#"><img alt="pre" src="image/icon/preBut.png"></a>
											<c:forEach var="page" begin="1" end="${(totalCnt+9)/10}" step="1">	
										<!-- 페이지 넘버 --><a href="LS?command=SelectBoardList&type=convenient&section=${section}&pageNum=${page}"><SPAN class ="page_number">&nbsp;&nbsp;${(section-1)*10+page}&nbsp;&nbsp;</SPAN><c:if test="${page<10}"></c:if></a>
											</c:forEach>
										<!-- 다음버튼 -->	<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
										</c:when>
									</c:choose>
								</c:if>
							</div> <!-- cls2 -->
							
					<!-- 관리자 접속 시 게시물 등록 버튼 -->	
						<c:if test="${member.member_type == 'admin'}">
							<div class="insertBtn">
								<input type="button" value="게시물 등록" onclick="location.href='LS?command=insertBoard_form_action&type=convenient'">
							</div>
						</c:if>
						
						</div> <!-- 본문div -->
					</div> <!-- frame_inner_Board -->
				</div> <!-- frame_con -->
			</article>
		</div> <!-- container -->
	</section>
</body>
</html>