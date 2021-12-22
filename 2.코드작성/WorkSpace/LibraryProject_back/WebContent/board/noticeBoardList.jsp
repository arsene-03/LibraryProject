<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.vo.BoardVO"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판 페이지</title>
</head>
<body>
	<div>공지사항</div>
	<div>total_${totalCnt}</div>
	<div>
		<form action="LS" method="POST">
			<input type="hidden" name="command" value="SelectBoardList">
			<input type="hidden" name="type" value="notice"> 
			<input type="hidden" name="_section" value="">
			<input type="hidden" name="_pageNum" value="">
			<input type="text" name="searchText">
			<input type="image" src="./image/icon/btn_search.png" name="Submit" value="Submit">
		</form>
	</div>
	<table>
		<%	
			List<BoardVO> boardList_notice = (List)request.getAttribute("boardList");
			for(BoardVO board:boardList_notice) {
				SimpleDateFormat asdf = new SimpleDateFormat("yyyy.MM.dd");
				String date = asdf.format(board.getBoard_time());
		%>
		<tr>
			<td><a href="LS?command=imgBoardList_info&idx=<%=board.getBoard_idx()%>&type=notice"><%=board.getBoard_title()%><span><%=date%></span></a></td>
		</tr>
		<%
			}
		%>
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
									<a href="LS?command=SelectBoardList&type=notice&section=${section-1}&pageNum=${10}"><img alt="pre" src="image/icon/preBut.png"></a>
								</c:if>
									<a href="LS?command=SelectBoardList&type=notice&section=${section}&pageNum=${page}">${(section-1)*10+page}<c:if test="${page<10}"> <img alt="nate" src="image/icon/pagenate_bar.png"></c:if></a>
								<c:if test="${page == 10}">
									<a href="LS?command=SelectBoardList&type=notice&section=${section+1}&pageNum=${1}"><img alt="next" src="image/icon/nextBut.png"></a>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${(section)*100 > totalCnt}">
							<c:forEach var="page" begin="1" end="${((totalCnt+9)-((section-1)*100))/10}" step="1">
								<c:if test="${section >1 && page==1}">
									<a href="LS?command=SelectBoardList&type=notice&section=${section-1}&pageNum=${10}"><img alt="pre" src="image/icon/preBut.png"></a>
								</c:if>
									<a href="LS?command=SelectBoardList&type=notice&section=${section}&pageNum=${page}">${(section-1)*10+page}<c:if test="${page<10}"> <img alt="nate" src="image/icon/pagenate_bar.png"></c:if></a>
							</c:forEach>
							<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
						</c:if>
					</c:when>
					<c:when test="${totalCnt == 100}">
						<a href="#"><img alt="pre" src="image/icon/preBut.png"></a>
						<c:forEach var="page" begin="1" end="10" step="1">
							<a href="LS?command=SelectBoardList&type=notice&section=${section}&pageNum=${page}">${page}<c:if test="${page>(totalCnt+9)/10}"> <img alt="nate" src="image/icon/pagenate_bar.png"></c:if></a>
						</c:forEach>
						<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
					</c:when>
					<c:when test="${totalCnt < 100}">
						<a href="#"><img alt="pre" src="image/icon/preBut.png"></a>
						<c:forEach var="page" begin="1" end="${(totalCnt+9)/10}" step="1">
							<a href="LS?command=SelectBoardList&type=notice&section=${section}&pageNum=${page}">${page}<c:if test="${page>(totalCnt+9)/10}"> <img alt="nate" src="image/icon/pagenate_bar.png"></c:if></a>
						</c:forEach>
						<a href="#"><img alt="next" src="image/icon/nextBut.png"></a>
					</c:when>
				</c:choose>
			</c:if>
		</div>
		<c:if test="${member.member_type == 'admin'}">
			<input type="button" value="게시물 등록하기" onclick="location.href='LS?command=insertBoard_form_action&type=notice'">
		</c:if>
		
</body>
</html>