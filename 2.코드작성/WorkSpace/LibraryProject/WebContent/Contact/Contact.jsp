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
	href="${pageContext.request.contextPath}/css/Contact.css?ver=19">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/frame.css?ver=61">
<!-- 
<script src="${pageContext.request.contextPath}/script/jquery-3.6.0.js"></script>
 -->

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->

</head>
<body id="firstPage">
	<jsp:include page="/include/header.jsp" />
	<section>

		<jsp:include page="/include/topMenu.jsp" />
		<div class="container">
			<article class="contact">
				<!-- * 카카오맵 - 지도퍼가기 -->
				<!-- 1. 지도 노드 -->
				<div class="view_Hidden">
					<div id="daumRoughmapContainer1629379121985"
						class="root_daum_roughmap root_daum_roughmap_landing"></div>
				</div>
				<div class="contact_con">
					<div class="contact_txt">
						<h3>오시는 길</h3>
						<dl>
							<dt>주소</dt>
							<dd>경기도 파주시 회동길 145<br>
							<span>*네비게이션 검색어 : 출판도시문화재단, 지혜의숲</span></dd>
							
							<dt>승용차</dt>
							<dd><span>자유로 > 통일동산 방향</span><br>
							<p>일산대교 기점 7km 지점에 위치한<br>
							장월 IC에서 파주출판도시 진입로 표지판을 보고 들어오시면 됩니다.</p></dd>
						</dl>
						<dl>
							<dt>대중교통</dt>
							<dd>서울 > 파주출판도시<br>
							<p>2200번 합정역 > 파주출판도시(은석교 사거리)<br>
							200번 합정역 > 일산신도시 > 교하신도시 > 파주출판도시(은석교 사거리 정류장 하차)
							</p>
							
							<span>일산 > 파주출판도시</span>
							<p>
							20번 원당역 > 식사동 > 덕이동 > 파주출판도시 (은석교 사거리 정류장 하차)<br>
							200번 일산신도시 > 교하신도시 > 파주출판도시 (은석교 사거리 정류장 하차)
							</p>
							</dd>
						</dl>
						<dl>
							<dt>문의전화</dt>
							<dd>0507-1335-0144 (10:00~17:00)</dd>
						</dl>
					</div>
				</div>



			</article>
		</div>
	</section>

<script charset="UTF-8" class="daum_roughmap_loader_script"
	src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/script/mapScript.js?ver=1"></script>

</body>

</html>