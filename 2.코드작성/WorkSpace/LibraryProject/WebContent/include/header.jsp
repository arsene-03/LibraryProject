<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
    <h1 class="logo">
        <div class="main_logo">
            <a href="${pageContext.request.contextPath}/LS?command=main"><img src="${pageContext.request.contextPath}/img/logo_3.png" alt="로고"></a>
        </div>
    </h1>
    <nav class="menu">
	        <ul>
                <li id="btn">
                	<a href="#" >지혜의숲</a>
                	<ul class="div_sub_mnu">
                		<li><a href="${pageContext.request.contextPath}/LS?command=forest#firstPage">지혜의숲 소개</a></li>
                		<li><a href="${pageContext.request.contextPath}/LS?command=forest#secondPage">공간별 이용 안내</a></li>
                		<li><a href="${pageContext.request.contextPath}/LS?command=SelectBoardList&type=convenient">편의시설</a></li>
                	</ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/LS?command=customBoard_action">자원봉사</a></li>
                <li id="btn2">
                	<a href="#">후원안내</a>
                	<ul class="div_sub_mnu">
                		<li><a href="${pageContext.request.contextPath}/LS?command=sponsor_action">후원안내</a></li>
                		<li><a href="${pageContext.request.contextPath}/LS?command=sponsorInput_action">후원정보</a></li>
                	</ul>
                </li>
                <li id="btn3">
                	<a href="#">공지사항/이벤트</a>
                	<ul class="div_sub_mnu">
                		<li><a href="${pageContext.request.contextPath}/LS?command=SelectBoardList&type=notice">공지사항</a></li>
                		<li><a href="${pageContext.request.contextPath}/LS?command=SelectBoardList&type=event">이벤트</a></li>
                	</ul>
                </li>
                <!-- 
                <li><a href="">대출서비스</a>
                	<ul class="div_sub_mnu">
                		<li><a href="">대출현황</a></li>
                		<li><a href="">방문신청</a></li>
                		<li><a href="">방문결과확인</a></li>
                	</ul>
                </li>
                 -->
                <li><a href="${pageContext.request.contextPath}/LS?command=SelectBoardList&type=suggest">도서관에 바라다</a></li>
                <li><a href="${pageContext.request.contextPath}/LS?command=contact_action">오시는길</a></li>
            </ul>
    </nav>
    <div class="banner_link">
    	<ul>
    		<li><a href="" class="Newsletter">뉴스레터구독신청</a></li>
    		<li><a href="">출판도시문화재단</a></li>
    		<li class="banner_footer"><a href="">
			우)10881<br>
			경기도 파주시<br>
			회동길 145<br>
			상호명:<br>
			(재)출판도시문화재단<br>
			사업자등록번호:<br>
			128-82-08500<br>
			전화번호:<br>
			0507-1335-0144<br>
			대표자: 김언호<br>
			</a>
    		</li>
    		<li><a href="">
    		<img src="${pageContext.request.contextPath}/img/footer_logo.png" alt="로고">
    		</a></li>

    	</ul>
    </div>
    <script>
    	var a = document.getElementById("btn");
    	var b= document.getElementById("btn2");
    	var c = document.getElementById("btn3");
    	a.addEventListener('click', openSubMenu);
    	b.addEventListener('click', openSubMenu);
    	c.addEventListener('click', openSubMenu);
    	
    	function openSubMenu(event) {
    		console.log('aaa');
    		var event_subMenu_open = event.target.parentNode.getElementsByClassName('div_sub_mnu')[0];
    		var event_subMenu_close = event.target.parentNode.getElementsByClassName('div_sub_mnu_open')[0];
    		
    		if(event_subMenu_open !== undefined){
    			event_subMenu_open.classList.replace('div_sub_mnu','div_sub_mnu_open');
    		} else {
    			event_subMenu_close.classList.replace('div_sub_mnu_open','div_sub_mnu');
    		}
    	}
    </script>
</header>