<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.library.vo.MemberVO"%>
<%@ page import="com.library.vo.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibraryAll.css?ver=6">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibraryHeader.css?ver=120">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection.css?ver=7">
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection_lft.css?ver=21">
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection_rgt.css?ver=11">
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/frame.css?ver=61">



</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<section>
		<jsp:include page="/include/topMenu.jsp" />
		<div class="mainBody">
			<div class="mainBody_1">
				<article class="lft_con_section">
				<!-- thumnail -->
				<%
						String event_1_con = (String)request.getAttribute("event_1_con");
						String event_2_con = (String)request.getAttribute("event_2_con");
						
						BoardVO notice_1 = (BoardVO)request.getAttribute("notice_1");
						BoardVO notice_2 = (BoardVO)request.getAttribute("notice_2");
						
						SimpleDateFormat asdf = new SimpleDateFormat("yyyy.MM.dd");
						String notice_1_date = asdf.format(notice_1.getBoard_time());
						String notice_2_date = asdf.format(notice_2.getBoard_time());
				
				%>
					<div class="ltf_con_slides">
						<div class="ltf_con_slides_img"></div>
						<div class="ltf_con_slides_img"></div>
						<div class="ltf_con_slides_img"></div>
					</div>
					 
					<div class="ltf_con_slides_letter">
						<div class="ltf_con_slides_text">
							<p>나무가 책이되고, 책이 지혜가 되는</p>
							<span>지혜의숲</span>
						</div>
						<div class="ltf_con_slides_text">
							<p>나무가 책이되고, 책이 지혜가 되는</p>
							<span>지혜의숲</span>
						</div>
						<div class="ltf_con_slides_text">
							<p>나무가 책이되고, 책이 지혜가 되는</p>
							<span>지혜의숲</span>
						</div>
					</div>
					 
					<div class="ltf_con_btn_width">
						<div class="ltf_btnlft"></div>
						<div class="ltf_btnrgt"></div>
					</div>
					
					<div class="ltf_con_btn_bottom">
						<ul>
							<li class="ltf_btn_move"></li>
							<li class="ltf_btn_move"></li>
							<li class="ltf_btn_move"></li>
						</ul>
					</div>
					
				</article>
			</div>
			<div class="mainBody_2">
				<article class="rgt_con_section">
					<div class="rgt_con_section_wrap">

						<div class="box_con_apply">
							<div class="box">
								<h3>지혜의숲 소개</h3>
							</div>
							<div class="wrap_box_body">
								<a href="LS?command=forest"><img alt="단체 방문 안내" src="${pageContext.request.contextPath}/img/img_apply.jpg"></a>
							</div>
							
						</div>
						
						<div class="box_con_sponsor">
							<div class="box">
								<h3>Sponsor</h3>
							</div>
							<div class="wrap_box_body">
								<a href="LS?command=sponsor_action"><img alt="Sponsor" src="${pageContext.request.contextPath}/img/img_sponsor.jpg"></a>
							</div>
						</div>
						
						<div class="box_conevent">
							<div class="box">
								<h3>Events</h3>
							</div>
							<div class="wrap_box_body">
							
							
								<ul>
									<li class="wrap_box_body_evnets linkbox" onclick="location.href='LS?command=imgBoardList_info&idx=${event_1.getBoard_idx()}&type=event'">
										<div class="box_img"><img alt="파주북소리" src="${pageContext.request.contextPath}/image/${event_1.getBoard_picture()}" onerror="this.src='image/icon/noImg.png'"></div>
										<div class="box_txt">
										<!-- p class tit 제목  // p class disc 본문 -->
											<p class="tit">${event_1.getBoard_title()}</p>
											<p class="disc">
												<!-- %=event_1_con %> -->
											</p>
										</div>
									</li>
									<li class="wrap_box_body_evnets linkbox" onclick="location.href='LS?command=imgBoardList_info&idx=${event_2.getBoard_idx()}&type=event'">
										<div class="box_img"><img alt="책이랑놀자" src="${pageContext.request.contextPath}/image/${event_2.getBoard_picture()}"></div>
										<div class="box_txt">
											<!-- p class tit 제목  // p class disc 본문 -->
											<p class="tit">${event_2.getBoard_title()}</p>
											<p class="disc">
												<!--%=event_2_con %>-->
											</p>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="box_con_notice">
							<div class="box">
								<h3>Notice</h3>
							</div>
							<div class="wrap_box_body">
								<ul class ="wrap_box_body_notice">
								<!--데이터 받아올때  li > a (p class tit 제목 // span class data 날짜 ) 날짜까지 클릭하기 위해 a태그로.  -->
									<li class="linkbox" onclick="location.href='LS?command=imgBoardList_info&idx=${notice_1.getBoard_idx()}&type=notice'">
									 	<div>
											<span class="tit">${notice_1.getBoard_title()}</span>
											<span class="data"><!--%=notice_1_date%>--></span>
										</div>
									</li>
									<li class="linkbox" onclick="location.href='LS?command=imgBoardList_info&idx=${notice_2.getBoard_idx()}&type=notice'">
										<div>
											<span class="tit">${notice_2.getBoard_title()}</span>
											<span class="data"><!--%=notice_2_date%>--></span>
										</div>
									</li>
	
										 
										
									<li>	  
										 <p class="tit">
											<a href="">지혜의숲 설 연휴 운영 안내</a>
											<span class="data">2021.02.10</span>
										</p>
									</li>
									
										
									
								</ul>
							</div>
						</div>
						
					</div>
				</article>

			</div>
		</div>
	</section>

	
</body>

<script>
	window.onload = function() {
		if (!location.hash) { 
			location.hash = '#reload';
			location.href = location.href;
		}
	}
</script>
 
 <script type="text/javascript" src="${pageContext.request.contextPath}/script/Libaryltf.js?ver=27"></script>
</body>
</html>