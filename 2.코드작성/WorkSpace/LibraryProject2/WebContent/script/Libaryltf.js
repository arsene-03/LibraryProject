/**
 * 
 */


	/* 
	 메인 슬라이드 
	*/
	const ltf_con_slides = document.getElementsByClassName('ltf_con_slides');
	const ltf_con_slides_img = document.getElementsByClassName('ltf_con_slides_img');

	const ltf_btnlft = document.getElementsByClassName('ltf_btnlft');
	const ltf_btnrgt = document.getElementsByClassName('ltf_btnrgt');

	const ltf_btn_move = document.getElementsByClassName('ltf_btn_move');

	const ltf_con_slides_letter = document.getElementsByClassName('ltf_con_slides_letter');
	const ltf_con_slides_text = document.getElementsByClassName('ltf_con_slides_text');

	var sildes_Wd = ltf_con_slides_img[0].offsetWidth;//그림 좌우 크기
	var slideIndex = 0; // 이걸로 이동


	// ltf_btn_move 클래스 각각 속성, 값(번호) 저장.
	for (var i = 0; i < ltf_btn_move.length; i++) {
		ltf_btn_move[i].setAttribute("slideIndex", i);
	}

	// 텍스트 번호
	for (var i = 0; i < ltf_con_slides_text.length; i++) {
		ltf_con_slides_text[i].setAttribute("slideIndex", i);
	}


	console.log(sildes_Wd);
	//슬라이드 이동 메소드
	function sliderMove() {
		
		reSildes_Wd();
		console.log('이거다' + slideIndex);
		console.log(sildes_Wd);
		ltf_con_slides[0].style.left = -(parseInt(slideIndex) * parseInt(sildes_Wd)) + "px";
		sliderTextMove();
		
	}

	function sliderTextMove() {
		reSildes_Wd();
		console.log(sildes_Wd);
		console.log('이거다' + slideIndex);
		ltf_con_slides_letter[0].style.left = -(parseInt(slideIndex) * parseInt(sildes_Wd)) + "px";
		
	}

	//왼쪽 버튼
	ltf_btnlft[0].addEventListener("click", function() {
		showSlideMinus();
		console.log("왼쪽");
	});
	function showSlideMinus() {
		reSildes_Wd();
		slideIndex = parseInt(slideIndex) - 1;
		// 0부터 4까지
		if (slideIndex < 0) {
			// -1 < 0 = 4 
			slideIndex = ltf_con_slides_img.length - 1;
		} else if (slideIndex > ltf_con_slides_img.length) {
			// 4 > 3 = 0
			slideIndex = 0;
		}

		sliderMove();
		bottom_btn_now();
		cilkedBtn();
		
		
		// console.log(slides_img.length-1);
		console.log(slideIndex);
	}

	//오른쪽 버튼
	ltf_btnrgt[0].addEventListener("click", function() {
		showSlidePlus();
	});
	function showSlidePlus() {
		reSildes_Wd();
		slideIndex = parseInt(slideIndex) + 1;
		// 0부터 4까지
		if (slideIndex < 0) {
			// -1 < 0 = 4 
			slideIndex = ltf_con_slides_img.length - 1;
		} else if (slideIndex + 1 > ltf_con_slides_img.length) {
			// 4 > 3 = 0
			slideIndex = 0;
		}

		sliderMove();
		bottom_btn_now();
		cilkedBtn();
		
		
	
		// console.log(slides_img.length-1);
		console.log(slideIndex);


	}


	//밑 버튼 
	function bottom_bt() {
		reSildes_Wd();
		for (var i = 0; i < ltf_btn_move.length; i++) {
			ltf_btn_move[i].addEventListener("click", function(e) {
				ltf_btn_move[i] = e.currentTarget.classList.add("clicked");
				slideIndex = e.currentTarget.getAttribute("slideIndex");


				/* cilked 클래스 제거해주는 코드. index와 i가 같지 않을 경우 */
				cilkedBtn();
				sliderMove();
				console.log(slideIndex);

			});
		}
		
		// console.log(slideIndex);

	}

	/* cilked 클래스 제거해주는 코드. index와 i가 같지 않을 경우 */
	function cilkedBtn() {
		for (var i = 0; i < ltf_btn_move.length; i++) {
			if (slideIndex != i) {
				ltf_btn_move[i].classList.remove("clicked");
				// console.log(slideIndex);
			}
		}
		
		//슬라이드 시간삭제 및 재시작
		clearInterval(time);
		time = setInterval(showSlidePlus, 5000);
	}



	//밑버튼 맨처음 상황
	function bottom_btn_now() {
		if (slideIndex == 0) {
			ltf_btn_move[slideIndex].classList.add("clicked");
		} else if (slideIndex == 1) {
			ltf_btn_move[slideIndex].classList.add("clicked");
		} else if (slideIndex == 2) {
			ltf_btn_move[slideIndex].classList.add("clicked");
		}
	}

	//사이즈 다시 구하기
	function reSildes_Wd() {
		sildes_Wd = ltf_con_slides_img[0].offsetWidth;
	}
	
	//슬라이드 시간마다 돌리기.
	var time = setInterval(showSlidePlus,5000);
	/*
	
	var time = setInterval(function() {
		showSlidePlus();
	}, 5000);
	*/
	//창크기 변경시 
	window.addEventListener('resize', function(e){
		sliderMove();
				
	});
	
	bottom_btn_now();
	bottom_bt();
	
		



