package com.library.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.ha.backend.Sender;

import com.library.vo.ReviewVO;
import com.libray.dao.LibraryDAO;

public class ReviewInsert_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int board_idx = Integer.parseInt(request.getParameter("board_idx"));
		String member_id = request.getParameter("member_id");
		String review_content = request.getParameter("review_content");
		
		ReviewVO rVo = new ReviewVO();
		
		rVo.setBoard_idx(board_idx);
		rVo.setMember_id(member_id);
		rVo.setReview_content(review_content);
		
		LibraryDAO dao = LibraryDAO.getInsetance();
		dao.insertcomment(rVo);
		
		String url ="LS?command=imgBoardList_info&idx="+board_idx+"&type=suggest";
		
		response.sendRedirect(url);
		
	}

}
