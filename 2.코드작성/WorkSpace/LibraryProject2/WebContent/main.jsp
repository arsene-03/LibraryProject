<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.library.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibraryAll.css?ver=5">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibraryHeader.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection.css?ver=6">
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection_lft.css?ver=19">
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibrarySection_rgt.css">
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
								<h3>지혜의숲 단체 방문안내</h3>
							</div>
							<div class="wrap_box_body">
								<img alt="단체 방문 안내" src="${pageContext.request.contextPath}/img/img_apply.jpg">
							</div>
							
						</div>
						
						<div class="box_con_sponsor">
							<div class="box">
								<h3>Sponsor</h3>
							</div>
							<div class="wrap_box_body">
								<img alt="Sponsor" src="${pageContext.request.contextPath}/img/img_sponsor.jpg">
							</div>
						</div>
						
						<div class="box_conevent">
							<div class="box">
								<h3>Events</h3>
							</div>
							<div class="wrap_box_body">
								<ul>
									<li class="wrap_box_body_evnets">
										<div class="box_img"><img alt="파주북소리" src="${pageContext.request.contextPath}/img/파주북소리.jpg"></div>
										<div class="box_txt">
										<!-- p class tit 제목  // p class disc 본문 -->
											<p class="tit">[안내] 2020 파주북소리</p>
											<p class="disc">
											주 제 : 책 더 책
											기 간 : 2020.11 ~ 12
											장 소 : 온라인 및 출판도시 이곳저곳(출판도시문화재단 유튜브 게시)
											주요내용 : 인문스테이지, 북인플루언서 스테이지, 소셜스테이지, 커넥션스테이지, 북큐레이션 스테이지
											주 최 : 출판도시문화재단
											후 원 : 파주시
											문 의: 031-955-0062
											홈페이지 : http://pajubooksori.kr
											</p>
										</div>
									</li>
									<li class="wrap_box_body_evnets">
										<div class="box_img"><img alt="책이랑놀자" src="${pageContext.request.contextPath}/img/책이랑놀자.jpg"></div>
										<div class="box_txt">
											<!-- p class tit 제목  // p class disc 본문 -->
											<p class="tit">[안내] 어린이책잔치 2020</p>
											<p class="disc">
												주 제 : 책이랑 놀자!
												기 간 : 2020. 10. 13 (화) ~ 11. 7(토)
												장 소 : 아시아출판문화정보센터 다목적홀(출판도시문화재단 유튜브 게시)
												주요내용 : 그림책1인 극장, 작가와의 만남, 손인형극, 에부르동화, 토크콘서트, 신인작가 18인전<br>
												주 최 : 출판도시문화재단
												후 원 : 문화체육관광부, 파주시, 한국출판문화산업진흥원
												문 의: 031-955-0062
												홈페이지 :http://pajubfc.org/
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
									<li>
									 	<a href="">
											<p class="tit">지혜의숲 설 연휴 운영 안내</p>
											<span class="data">2021.02.10</span>
										</a>
									</li>
									<li>
										 <a href="">
											<p class="tit">지혜의숲 설 연휴 운영 안내</p>
											<span class="data">2021.02.10</span>
										</a>
									</li>
	
										 
										<!--
									<li>	  
										 <p class="tit">
											<a href="">지혜의숲 설 연휴 운영 안내</a>
											<span class="data">2021.02.10</span>
										</p>
									</li>
										 -->
										
									
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