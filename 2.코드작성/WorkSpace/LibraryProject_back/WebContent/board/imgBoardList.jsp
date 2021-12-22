<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.library.vo.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편의시설 게시판 페이지</title>
</head>
<body>
	<div class="pageTitle">편의시설 안내</div>
	<table>
		<tr>
		<%	
			int count = 1;
			List<BoardVO> boardList_convenient = (List)request.getAttribute("boardList");
			for(BoardVO board:boardList_convenient){
			count++;
		%>
		<td>
			<a href="LS?command=imgBoardList_info&idx=<%=board.getBoard_idx()%>&type=convenient">
				<img alt="편의시설" src="image/<%=board.getBoard_picture()%>" width="317.8px" height="222px" onerror="this.src='image/icon/noImg.png'">
			</a>
			<br>
			<span>
				<%=board.getBoard_title()%>
			</span>
			<input type="button" value="+더보기" onclick="location.href='LS?command=imgBoardList_info&idx=<%=board.getBoard_idx()%>&type=convenient'">
		</td>
		<%
				if(count%3==1){
					out.println("</tr>");
					out.println("<tr>");
				}
			}
		%>
		</tr>
		
	</table>

	 	<div class = "cls2">
			<c:if test="${totalCnt != null}">
				<c:choose>
					<c:when test="${totalCnt > 100}">
						<c:if test="${(section*100) < totalCnt}"><!-- >> -->
							<c:forEach var="page" begin="1" end="10" step="1">
								<c:if test="${section <=1 && page==1}">
									<a href="#"><img alt="pre" src="image/icon/preBut.png"></a>
								</c:if>
								<c:if test="${section >1 && page==1}">
									<a href="LS?command=SelectBoardList&type=convenient&section=${section-1}&pageNum=${10}"><img alt="pre" src="image/icon/preBut.png"></a>
								</c:if>
									<a href="LS?command=SelectBoardList&type=convenient&section=${section}&pageNum=${page}">${(section-1)*10+page}<c:if test="${page<10}"> <img alt="nate" src="image/icon/pagenate_bar.png"></c:if></a>
								<c:if test="${page == 10}">
									<a href="LS?command=SelectBoardList&type=convenient&section=${section+1}&pageNum=${1}"><img alt="next" src="image/icon/nextBut.png"></a>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${(section)*100 > totalCnt}">
							<c:forEach var="page" begin="1" end="${((totalCnt+9)-((section-1)*100))/10}" step="1">
								<c:if test="${section >1 && page==1}">
									<a href="LS?command=SelectBoardList&type=convenient&section=${section-1}&pageNum=${10}"><img alt="pre" src="image/icon/preBut.png"></a>
								</c:if>
									<a href="LS?command=SelectBoardList&type=convenient&section=${section}&pageNum=${page}">${(section-1)*10+page}<c:if test="${page<10}"> <img alt="nate" src="image/icon/pagenate_bar.png"></c:if></a>
							</c:forEach>
							<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
						</c:if>
					</c:when>
					<c:when test="${totalCnt == 90}">
						<a href="#"><img alt="pre" src="image/icon/preBut.png"></a>
						<c:forEach var="page" begin="1" end="10" step="1">
							<a href="LS?command=SelectBoardList&type=convenient&section=${section}&pageNum=${page}">${page}<c:if test="${page>(totalCnt+9)/10}"> <img alt="nate" src="image/icon/pagenate_bar.png"></c:if></a>
						</c:forEach>
						<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
					</c:when>
					<c:when test="${totalCnt < 90}">
						<a href="#"><img alt="pre" src="image/icon/preBut.png"></a>
						<c:forEach var="page" begin="1" end="${(totalCnt+9)/10}" step="1">
							<a href="LS?command=SelectBoardList&type=convenient&section=${section}&pageNum=${page}">${page}<c:if test="${page>(totalCnt+9)/10}"> <img alt="nate" src="image/icon/pagenate_bar.png"></c:if></a>
						</c:forEach>
						<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
					</c:when>
				</c:choose>
			</c:if>
		</div>
		<c:if test="${member.member_type == 'admin'}">
			<input type="button" value="게시물 등록하기" onclick="location.href='LS?command=insertBoard_form_action&type=convenient'">
		</c:if>
	</body>
</html>