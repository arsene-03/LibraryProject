<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LibraryAll.css?ver=1">
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
	href="${pageContext.request.contextPath}/css/SponsorInput.css?ver=41">
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
				<div class="sponsorGuide_SponsorInput">
					<div class="top_tit">
						<h3>후원정보</h3>
					</div>
					<div class="join_form sponsor_form">
						<form>
							<h4 class="sec_tit">후원 정보</h4>
							<ul class="row">
								<li class="half">
									<ul class="row_sub">
										<li class="filed"><span>계좌명</span></li>
										<li class="inp_form"><span>재단법인출판도시문화재단</span></li>
									</ul>
								</li>
								<li class="half">
									<ul class="row_sub">
										<li class="filed"><span>입금은행</span></li>
										<li class="inp_form"><span>기업은행</span></li>
									</ul>
								</li>
								<li>
									<ul class="row_sub">
										<li class="filed"><span>후원 계좌번호</span></li>
										<li class="inp_form"><span>496-000001-04-847</span></li>
									</ul>
								</li>

							</ul>
						</form>
					</div>
				</div>
			</article>
		</div>
	</section>


</body>

</html>