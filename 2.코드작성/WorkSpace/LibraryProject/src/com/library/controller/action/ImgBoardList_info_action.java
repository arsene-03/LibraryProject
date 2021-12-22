package com.library.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.vo.BoardVO;
import com.library.vo.ReviewVO;
import com.libray.dao.LibraryDAO;

public class ImgBoardList_info_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = null;
		int idx = Integer.parseInt(request.getParameter("idx"));
		String type = request.getParameter("type");
		
		switch (type) {
		case "convenient":
			url = "board/imgBoardList_info.jsp";
			break;
		case "notice":
			url = "board/noticeBoardList_info.jsp";
			break;	
		case "event":
			url = "board/eventBoardList_info.jsp";
			break;	
		case "suggest":
			url = "board/suggestBoardList_info.jsp";
			break;	
		}
		BoardVO bVo = new BoardVO();
		LibraryDAO dao = LibraryDAO.getInsetance();
		
		
		bVo = dao.selectBoardList_info_all(idx);
		
		List<ReviewVO> reviewList = null;

		reviewList = dao.selectReviewList(idx);
		
		request.setAttribute("reviewList", reviewList);
		
		int count = bVo.getBoard_count();
		dao.select_countUp(idx,count);
		
		int[] firstAndEnd_idx = dao.firstAndEnd_idx(type);

		int nextBoard_idx = dao.selectBoardList_info_nextBoard_idx(idx, type);
		int beforeBoard_idx = dao.selectBoardList_info_beforeBoard_idx(idx, type);

		request.setAttribute("board", bVo);
		request.setAttribute("firstAndEnd_idx", firstAndEnd_idx);
		request.setAttribute("nextBoard_idx", nextBoard_idx);
		request.setAttribute("beforeBoard_idx", beforeBoard_idx);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
