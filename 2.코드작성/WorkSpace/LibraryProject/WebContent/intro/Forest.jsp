<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibraryAll.css">
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
	href="${pageContext.request.contextPath}/css/Forest.css?ver=17">
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/frame.css?ver=61">
<!-- 
<script src="${pageContext.request.contextPath}/script/jquery-3.6.0.js"></script>
 -->

	
</head>
<body id="firstPage">

	<jsp:include page="/include/header.jsp" />
	<section>

		<jsp:include page="/include/topMenu.jsp" />
		<div class="container">
			<article class="forst_section page01" >
				<div class="lft_con">
					<div class="lft_con_img"></div>
				</div>
				<div class="rgt_con">
					<h2>
						나무가 책이되고, 책이 지혜가 되는<br> <span>지혜의 숲</span>
					</h2>
					<p>
						아시아출판문화정보센터 1층에 위치하고 있는 지혜의 숲은<br> 가치 있는 책을 한데 모아 보존 보호하고
						관리하며 함께 보는 공동의 서재입니다.<br> 지혜의숲은 출판도시문화재단이 2014년도에 문화체육관광부의
						후원을 받아 조성한 이래 재단의 자체 재원으로 운영하고 있는 복합문화공간입니다.<br> 출판도시문화재단은
						출판단지조합이 출자하고 문화체육관광부가 설립을 허가한 비영리 재단법인입니다.
					</p>


				</div>
			</article>
			<article class="forst_section page02" id="secondPage">
				<div class="fp_slides">
					<div class="fp_slides_img"></div>
					<div class="fp_slides_img"></div>
					<div class="fp_slides_img"></div>
				</div>
				<div class="fp_slides_letter">
					<div class="fp_slides_frame">
						<div class="fp_slides_text">
							<span>지혜의숲 1</span>
							<p>
							학자, 지식인, 연구소에서 기증한 도서를 소장한 공간입니다.
							<br>
							<br>
							기증자가 평생 읽고 연찬한 책을 한눈에 살펴볼 수 있는 공유서재로서 학자와 지식인의 삶을 책을 통해 보여주는 공간이기도 합니다.
							<br>
							<br>
							<br>
							기증자의 연구 분야에 따라 문학, 역사, 철학, 사회과학, 자연과학, 예술에 이르는 다양한 분야, 시대의 인문학 도서를 만날 수 있습니다.
	                        <br>
	                        <br>
	                        <br>
	                        * 지혜의숲 1 운영시간 : 오전 10시 ~ 오후 8시
							</p>
						</div>
					</div>
					<div class="fp_slides_frame">
						<div class="fp_slides_text">
							<span>지혜의숲 2</span>
							<p>
							출판사가 기증한 도서를 읽을 수 있는 공간입니다.
							<br>
							<br>
							우리나라를 대표하는 출판사들이 출판한 책들을 소장하고 있습니다.
							<br>
							<br>
							분야별 분류가 아닌 출판사별 분류를 통하여 우리나라 출판과 출판사의 역사를 살펴볼 수 있는 공간이기도 합니다.
	                        <br>
	                        <br>
							어린이책 코너가 별도로 마련되어 있습니다.
							<br>
							<br>
							<br>
							* 지혜의숲 2 운영시간 : 오전 10시 ~ 오후 8시
							<br>
							(지혜의숲 2에 위치한 카페 파스쿠찌는 8시 30분부터 운영합니다.)
							</p>
						</div>
					</div>
					<div class="fp_slides_frame">
						<div class="fp_slides_text">
							<span>지혜의숲 3</span>
							<p>
							지혜의숲 3은 라이브러리스테이 지지향 로비입니다.
							<br>
							<br>
							출판사는 물론 유통사와 박물관, 미술관에서 기증한 도서를 볼 수 있습니다.
							<br>
							<br>
	                        <br>
	                        * 지혜의숲 3 운영시간 : 오전 10시 ~ 오후 8시
							</p>
						</div>
					</div>
				</div>
				<div class="bottom_btn">
					<div class="bottom_btn_lft"></div>
					 
					<ul>
						<li class="bottom_btn_move"></li>
						<li class="bottom_btn_move"></li>
						<li class="bottom_btn_move"></li>
					</ul>
					 
					<div class="bottom_btn_rgt"></div>
				</div>
			</article>
		</div>
		<div class="forst_section_btn">
			<ul>
				<li class="forst_move"></li>
				<li class="forst_move"></li>
			</ul>
		</div>
	</section>

	<script type="text/javascript"
	src="${pageContext.request.contextPath}/script/Forest.js?ver=18"></script>
</body>

</html>