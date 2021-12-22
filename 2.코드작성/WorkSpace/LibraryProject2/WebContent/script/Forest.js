/**
 * 
 */

/* 			*/
/* 			*/
/* 소개 페이지*/
/* 			*/
/* 			*/
window.onload = function() {
	const fp_slides = document.getElementsByClassName('fp_slides');
	const fp_slides_letter = document.getElementsByClassName('fp_slides_letter');
	const fp_slides_img = document.getElementsByClassName('fp_slides_img');


	const bottom_btn_lft = document.getElementsByClassName('bottom_btn_lft');
	const bottom_btn_rgt = document.getElementsByClassName('bottom_btn_rgt');

	const bottom_btn_move = document.getElementsByClassName('bottom_btn_move');

	const forst_move = document.getElementsByClassName('forst_move');
	const secondPage = document.getElementById('secondPage');

	var fp_sildes_Wd = fp_slides_img[0].offsetWidth;//그림 좌우 크기
	var fp_slideIndex = 0;
	var secondPageY = secondPage.offsetTop;
	var scrollValue = 0;
	var pageIndex = 0;
	
	
	/* 주소값 확인 벨류설정. */
	if (location.hash === '#firstPage') {
		pageIndex = 0;
	} else if (location.hash === '#secondPage') {
		pageIndex = 1;
	}


	console.log(secondPageY);
	/* 오른쪽 버튼 기능 */
	/* 스크롤 때마다 Y좌표 구하기. */
	document.addEventListener('scroll', function() {
		scrollValue = document.documentElement.scrollTop;
		/* console.log('scroll', scrollValue);*/

		if (scrollValue < secondPageY) {
			pageIndex = 0;
		} else if (scrollValue >= secondPageY) {
			pageIndex = 1;
		}
		clickBtnNow();
		cliked_Check();
	});

	for (var i = 0; i < forst_move.length; i++) {
		forst_move[i].setAttribute("pageIndex", i);
	}

	function clickBtn() {
		for (var i = 0; i < forst_move.length; i++) {
			forst_move[i].addEventListener("click", function(e) {
				forst_move[i] = e.currentTarget.classList.add("clicked");
				pageIndex = e.currentTarget.getAttribute("pageIndex");
				console.log(pageIndex);
				cliked_Check();
				page_move();
			});
		}
	}
	function cliked_Check() {
		for (var i = 0; i < forst_move.length; i++) {
			if (pageIndex != i) {
				forst_move[i].classList.remove("clicked");
			}
		}
	}


	function clickBtnNow() {
		if (pageIndex == 0) {
			forst_move[pageIndex].classList.add("clicked");
			location.hash = "firstPage";
		} else if (pageIndex == 1) {
			forst_move[pageIndex].classList.add("clicked");
			location.hash = "secondPage";
		}
	}
	function page_move() {
		if (pageIndex == 0) {
			window.scrollTo(0, 0);
		}
		else if (pageIndex == 1) {
			window.scrollTo(0, secondPageY);
		}


	}

	/* 밑 슬라이드 기능 */
	// bottom_btn_move 클래스 각각 속성, 값(번호) 저장.
	for (var i = 0; i < bottom_btn_move.length; i++) {
		bottom_btn_move[i].setAttribute("fp_slideIndex", i);
	}

	//슬라이드 이동 메소드
	function fp_sliderMove() {
		/*fp_reSildes_Wd(); 사이즈 다시 구하기. */
		fp_reSildes_Wd();
		console.log('이거다' + fp_slideIndex);
		console.log(fp_sildes_Wd);
		fp_slides[0].style.left = -(parseInt(fp_slideIndex) * parseInt(fp_sildes_Wd)) + "px";
		fp_sliderTextMove();
	}
	//슬라이드 텍스트이동 메소드
	function fp_sliderTextMove() {
		fp_reSildes_Wd();
		console.log(fp_sildes_Wd);
		console.log('이거다' + fp_slideIndex);
		fp_slides_letter[0].style.left = -(parseInt(fp_slideIndex) * parseInt(fp_sildes_Wd)) + "px";

	}

	//밑 버튼 
	function fp_bottom_bt() {
		fp_reSildes_Wd();
		for (var i = 0; i < bottom_btn_move.length; i++) {
			bottom_btn_move[i].addEventListener("click", function(e) {
				bottom_btn_move[i] = e.currentTarget.classList.add("clicked");
				fp_slideIndex = e.currentTarget.getAttribute("fp_slideIndex");


				/* cilked 클래스 제거해주는 코드. index와 i가 같지 않을 경우 */
				fp_cilkedBtn();
				fp_sliderMove();
				console.log(fp_slideIndex);

			});
		}
	}

	/* cilked 클래스 제거해주는 코드. index와 i가 같지 않을 경우 */
	function fp_cilkedBtn() {
		for (var i = 0; i < bottom_btn_move.length; i++) {
			if (fp_slideIndex != i) {
				bottom_btn_move[i].classList.remove("clicked");
				// console.log(fp_slideIndex);
			}
		}
	}


	//왼쪽 버튼
	bottom_btn_lft[0].addEventListener("click", function() {
		fp_showSlideMinus();
		console.log("왼쪽");
	});
	function fp_showSlideMinus() {
		fp_reSildes_Wd();
		fp_slideIndex = parseInt(fp_slideIndex) - 1;

		if (fp_slideIndex < 0) {

			fp_slideIndex = fp_slides_img.length - 1;
		} else if (fp_slideIndex > fp_slides_img.length) {

			fp_slideIndex = 0;
		}

		fp_sliderMove();
		fp_bottom_btn_now();
		fp_cilkedBtn();
		// console.log(slides_img.length-1);
		console.log(fp_slideIndex);
	}

	//오른쪽 버튼
	bottom_btn_rgt[0].addEventListener("click", function() {
		fp_showSlidePlus();
	});
	function fp_showSlidePlus() {
		fp_reSildes_Wd();
		fp_slideIndex = parseInt(fp_slideIndex) + 1;

		if (fp_slideIndex < 0) {

			fp_slideIndex = fp_slides_img.length - 1;
		} else if (fp_slideIndex + 1 > fp_slides_img.length) {

			fp_slideIndex = 0;
		}

		fp_sliderMove();
		fp_bottom_btn_now();
		fp_cilkedBtn();

		// console.log(slides_img.length-1);
		console.log(fp_slideIndex);

	}


	//밑버튼 맨처음 상황
	function fp_bottom_btn_now() {
		if (fp_slideIndex == 0) {
			bottom_btn_move[fp_slideIndex].classList.add("clicked");
		} else if (fp_slideIndex == 1) {
			bottom_btn_move[fp_slideIndex].classList.add("clicked");
		} else if (fp_slideIndex == 2) {
			bottom_btn_move[fp_slideIndex].classList.add("clicked");
		}
	}

	//사이즈 다시 구하기
	function fp_reSildes_Wd() {
		fp_sildes_Wd = fp_slides_img[0].offsetWidth;
	}

	fp_bottom_btn_now();
	fp_bottom_bt();
	clickBtnNow();
	clickBtn();
	
	
	window.addEventListener('resize', function(){
		fp_sliderMove();
				
	});
	
}
