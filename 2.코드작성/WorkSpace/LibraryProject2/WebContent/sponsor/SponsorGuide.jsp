<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	href="${pageContext.request.contextPath}/css/SponsorGuide.css?ver=46">
<!-- 
<script src="${pageContext.request.contextPath}/script/jquery-3.6.0.js"></script>
 -->

</head>
<body id="firstPage">
	<jsp:include page="/include/header.jsp" />
	<section>

		<jsp:include page="/include/topMenu.jsp" />
		<div class="container">
			<article class="sponsorGuide">
				<div class="sponsorGuide_con">
					<div class="con_frame">
						<div class="con_frame_body">
							<h3>후원안내</h3>
							<div class="con_sponsor">
								<h4>"지혜의숲 친구들"이 되어주세요</h4>
								<p>
									지혜의숲은 누구에게나 무료로 개방되는 열린 독서문화공간입니다. <br> 지혜의숲은 출판도시문화재단이
									2014년도에 문화체육관광부의 후원을 받아 조성한 이래 재단의 <br> 자체 재원으로 운영하고 있는
									복합문화공간입니다. <br> 출판도시문화재단은 출판단지조합이 출자하고 문화체육관광부가 설립을 허가한
									비영리 재단법인입니다.
								</p>
								<br>
								<div class="cnt_txt">
									<div class="txt">
										<span>“지혜의숲 친구들”</span>
										<ul class="fir">
											<li>- 지혜의숲 후원회의 이름입니다.</li>
										</ul>
										<span>기부금은 어떻게 쓰이나요?</span>
										<ul class="fir">
											<li>- 기부금은 장서 확보 및 관리를 위해 쓰입니다.
											<li>
											<li>- 또한 지혜의숲 자원봉사자 운영 및 교육 프로그램을 위해서도 쓰일 수 있습니다.</li>
											<li>- 향후 지혜의숲에서 펼치는 다양한 문화행사가 가능하게 합니다.</li>
										</ul>

										<span>후원자가 되면?</span>
										<ul class="fir">
											<li>- 연초에 출판도시문화재단 사이트에 게재하는 “기부금 활용 실적 공개”을 통하여 연간 기부금
												모금액과 기부금이 어떻게 사용되었는지 확인할 수 있습니다.</li>
											<li>- 지혜의숲을 운영하는 출판도시문화재단이 주최하는 소식 정보를 담은 뉴스레터를 받을 수
												있습니다.</li>
										</ul>

									</div>
								</div>
							</div>
							<div class="btn_btm_center">
								<input type="button" value="후원정보" class="btn_apply"
									onclick="location.href='../sponsor/SponsorInput.jsp';">
							</div>

						</div>
					</div>
				</div>
			</article>
		</div>
	</section>


</body>

</html>