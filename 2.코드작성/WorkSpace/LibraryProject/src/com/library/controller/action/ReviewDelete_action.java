package com.library.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.vo.ReviewVO;
import com.libray.dao.LibraryDAO;

public class ReviewDelete_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int review_idx = Integer.parseInt(request.getParameter("review_idx"));
		int board_idx = Integer.parseInt(request.getParameter("board_idx"));
		LibraryDAO dao = LibraryDAO.getInsetance();
		dao.deleteReview(review_idx);
		
		String url ="LS?command=imgBoardList_info&idx="+board_idx+"&type=suggest";
		
		response.sendRedirect(url);

	}

}
