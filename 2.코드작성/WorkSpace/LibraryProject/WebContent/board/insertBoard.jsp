<%@page import="oracle.security.o3logon.a"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.vo.BoardVO"%>
<%@ page import="com.library.vo.MemberVO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 페이지</title>
<script src="./script/jquery-3.6.0.js"></script>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibraryAll.css?ver=9">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibraryHeader.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection.css?ver=10">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection_lft.css?ver=1">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection_rgt.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Libraryfooter.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/frame.css?ver=80">
</head>
<body id="firstPage">
	<jsp:include page="/include/header.jsp" />
	<section>
		<jsp:include page="/include/topMenu.jsp" />
		<div class="container">
			<article class="frame">
				<div class="frame_con" >
					<div class="insertPageImg"></div>
					<div class="frame_inner ">
					
					<%
						String type = (String) request.getAttribute("type");
						BoardVO board = (BoardVO) request.getAttribute("board");
						HttpSession session2 = request.getSession();
						if((MemberVO)session2.getAttribute("member")==null){
							response.sendRedirect("./script/alert_login.jsp");
						}
					%>
						
						<input type="hidden" id="type" value="<%=type%>">
							<form action="IB" method="POST" enctype="multipart/form-data">
								<table class="insertTable">
									<tr>
										<th>제목</th>
										<td><input type="text" name="board_title" class="boardStyle" required="required" value="${board.getBoard_title()}"></td>
									</tr>
									<tr>
										<th>게시판 유형</th>
										<td>
											<select name="type" class="boardStyle"> 
												<option id="convenient" value="convenient">1.편의시설 게시판</option>
												<option id="notice" value="notice">2.공지사항 게시판</option>
												<option id="event" value="event">3.문화행사 게시판</option>
												<option id="suggest" value="suggest">4.도서관에 바라다</option>
											</select>
										</td>
									</tr>
									<tr>
										<th rowspan="6">사진</th>
										<%
											if (board == null) {
												out.println("<td><input type='file' name='picture'></td>");
											} else {
												if (board.getBoard_picture() != null) {
													out.println("<td>"+board.getBoard_picture()+
															"<a href='LS?command=imgDelete_action&idx="+ board.getBoard_idx()+
															"&picture="+board.getBoard_picture()+"'>&nbsp;&nbsp;&nbsp;삭제</a></td>");
													out.println("<input type='hidden' name='picture' value='" + board.getBoard_picture() + "'>");
												} else {
													out.println("<td><input type='file' name='picture'></td>");
												}
											}
										%>
									</tr>
									<tr>
										<%
											if (board == null) {
												out.println("<td><input type='file' name='picture2'></td>");
											} else {
												if (board.getBoard_picture2() != null) {
													out.println("<td>" + board.getBoard_picture2() + "<a href='LS?command=imgDelete_action&idx="
													+ board.getBoard_idx() + "&picture2=" + board.getBoard_picture2() + "'>&nbsp;&nbsp;&nbsp;삭제</a></td>");
													out.println("<input type='hidden' name='picture2' value='" + board.getBoard_picture2() + "'>");
												} else {
													out.println("<td><input type='file' name='picture2'></td>");
												}
											}
										%>
									</tr>
									<tr>
										<%
											if (board == null) {
												out.println("<td><input type='file' name='picture3'></td>");
											} else {
												if (board.getBoard_picture3() != null) {
													out.println("<td>" + board.getBoard_picture3() + "<a href='LS?command=imgDelete_action&idx="
													+ board.getBoard_idx() + "&picture3=" + board.getBoard_picture3() + "'>&nbsp;&nbsp;&nbsp;삭제</a></td>");
													out.println("<input type='hidden' name='picture3' value='" + board.getBoard_picture3() + "'>");
												} else {
													out.println("<td><input type='file' name='picture3'></td>");
												}
											}
										%>
									</tr>
									<tr>
										<%
											if (board == null) {
												out.println("<td><input type='file' name='picture4'></td>");
											} else {
												if (board.getBoard_picture4() != null) {
													out.println("<td>" + board.getBoard_picture4() + "<a href='LS?command=imgDelete_action&idx="
													+ board.getBoard_idx() + "&picture4=" + board.getBoard_picture4() + "'>&nbsp;&nbsp;&nbsp;삭제</a></td>");
													out.println("<input type='hidden' name='picture4' value='" + board.getBoard_picture4() + "'>");
												} else {
													out.println("<td><input type='file' name='picture4'></td>");
												}
											}
										%>
									</tr>
									<tr>
										<%
											if (board == null) {
												out.println("<td><input type='file' name='picture5'></td>");
											} else {
												if (board.getBoard_picture5() != null) {
													out.println("<td>" + board.getBoard_picture5() + "<a href='LS?command=imgDelete_action&idx="
													+ board.getBoard_idx() + "&picture5=" + board.getBoard_picture5() + "'>&nbsp;&nbsp;&nbsp;삭제</a></td>");
													out.println("<input type='hidden' name='picture5' value='" + board.getBoard_picture5() + "'>");
												} else {
													out.println("<td><input type='file' name='picture5'></td>");
												}
											}
										%>
									</tr>
									<tr>
										<%
											if (board == null) {
												out.println("<td><input type='file' name='picture6'></td>");
											} else {
												if (board.getBoard_picture6() != null) {
													out.println("<td>" + board.getBoard_picture6() + "<a href='LS?command=imgDelete_action&idx="
													+ board.getBoard_idx() + "&picture6=" + board.getBoard_picture6() + "'>&nbsp;&nbsp;&nbsp;삭제</a></td>");
													out.println("<input type='hidden' name='picture6' value='" + board.getBoard_picture6() + "'></tr>");
												} else {
													out.println("<td><input type='file' name='picture6'></td></tr>");
												}
											}
										%>
									</tr>
									<tr>
										<th>내용</th>
<%
											if (board == null) {
%>
												<td>
													<div id="imgPlusText">
														<textarea id="textbox" rows="10" cols="30"></textarea>
													</div>
												</td>
<%
											} else {
												if (board.getBoard_content() != null) {
%>
													<td>
														<div id="imgPlusText">${board.getBoard_content()}</div>
													</td>
<%
												} else {
%>
													<td>
														<div id="imgPlusText">
															<textarea id="textbox" rows="10" cols="30"></textarea>
														</div>
													</td>
<%
												}
											}
%>
										
									</tr>
									<tr>
										<td colspan="2">*드래그해서 이미지를 글에 넣을 수 있습니다.<br> &nbsp;이미지를
											더블클릭하면 삭제할 수 있습니다.<br> &nbsp;이미지가 불러와 질때가지 기다려주세요.*<br>
										</td>
									</tr>
								</table>
								
								<div style="display: none">
									<textarea name='imgPlusText_hidden' id='imgPlusText_hidden'></textarea>
								</div>
	
								<input type="hidden" name="member_id" value="${member.member_id}">
								<input type="hidden" name="member_pwd" value="${member.member_pwd}">
								
								<div class="insert_bottom_btn">
								<%
									if (board != null) {
										out.println("<input type='hidden' name='board_idx' value='" + board.getBoard_idx() + "'>");
										out.println("<input type='submit' class='btnAll' value='수정' onclick='return writeImgPlusText_hidden()'>");
									} else {
										out.println("<input type='submit' class='btnAll' value='등록' onclick='return writeImgPlusText_hidden()'>");
									}
								%>
								<%
									if (board != null) {
								%>
										<input type="button" value="돌아가기" class="btnAll" onclick="location.href='LS?command=imgBoardList_info&type=<%=type%>&idx=${board.getBoard_idx()}'">
										
								<% 
									} else {
								%>
										<input type="button" value="돌아가기" class="btnAll" onclick="location.href='LS?command=SelectBoardList&type=<%=type%>'">	
								<%
									}
								%>
									
								</div>
							</form>
						</div> <!-- frame_inner -->
					</div> <!-- frame_con insertPage -->
				</article>
			</div>
		</section>
<!------스크립트------------------------------------------------------------------------------------------------------>
	<script>
		var title = document.getElementsByName('board_title')[0].value
		var body = document.getElementsByTagName('body');
		if (title == null) {
			document.createElement('input');
		}
		var type = document.getElementById('type').value;
		switch (type) {
		case 'convenient':
			document.getElementById("convenient").setAttribute("selected",
					"selected");
			break;
		case 'notice':
			document.getElementById("notice").setAttribute("selected",
					"selected");
			break;
		case 'event':
			document.getElementById("event").setAttribute("selected",
					"selected");
		case 'suggest':
			document.getElementById("suggest").setAttribute("selected",
					"selected");
		}
		/////////////////////////////////////////////////////////////////////////////////////
		var imgPlusText = document.getElementById("imgPlusText");
		var imgPlusText_hidden = document.getElementById("imgPlusText_hidden");

		imgPlusText.addEventListener("dragenter", function(e) { // 드래그로 공간에 진입했을 때
			console.log('dragenter');
		})
		imgPlusText.addEventListener("dragover", function(e) { // 드래그로 해당공간 위에 있을 때
			e.preventDefault();
			console.log('dragover');
		})
		imgPlusText.addEventListener("dragleave", function(e) { // 드래그로 해당공간을 벗어났을 때
			console.log('dragleave');
		})
		imgPlusText.addEventListener("drop", function(e) { // 해당공간에 드롭했을 때
			e.preventDefault();
			console.log('drop');

			var data = e.dataTransfer.files[0];  // => 드래그로 가져온 데이터 객체
			console.dir(data);

			var formData = new FormData(); 
			formData.append('textImg', data); //formdata에 파일 담기
			
		/////////////////////////////////////////////////////////////////////////////////////
		
			var imgTagDiv = document.createElement('div'); // => img 태그를 감쌀  div 태그 생성
			var imgTag = document.createElement('img'); // => img 태그 생성

		///////////////////////////////////////////////////////////////////////////////////// ajax 파일업로딩
			var req = new XMLHttpRequest();
			req.open('POST', 'IB');
			req.send(formData);
			
			req.onreadystatechange = function() {
				if ((req.readyState == 4) && (req.status == 200)) {
					alert("파일이름: " + req.responseText);
					imgTag.setAttribute('src', 'image/'+ req.responseText); // => img태그에 src속성 생성
				}
			};
			
			
		/////////////////////////////////////////////////////////////////////////////////////
			imgTag.setAttribute('alt', '이미지삽입');
			imgTag.setAttribute('class', 'textBoxImg');
			imgTagDiv.setAttribute('ondblclick', 'imgDelete(event)'); //=> 더블클릭으로 해당 이미지를 삭제할 수있는 속성 추가

			imgTagDiv.appendChild(imgTag);
			this.insertBefore(imgTagDiv, document.getElementById('textbox'));

		})
		
		///////////////////////////////////////////////////////////////////////////////////// 
		function writeImgPlusText_hidden() {
			document.getElementById("textbox").innerHTML = document
					.getElementById("textbox").value
			console.log(document.getElementById("textbox").value)
			console.log(imgPlusText.innerHTML);

			imgPlusText_hidden.innerHTML = imgPlusText.innerHTML;  // => 숨겨진textarea에 태그내용까지 복사
			return true;
		}

	///////////////////////////////////////////////////////////////////////////////////// =>이미지 삭제 기능 
		function imgDelete(event) {
			var img = event.currentTarget;
			img.remove();
		}
	</script>
</body>
</html>