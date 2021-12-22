package com.library.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.vo.BoardVO;
import com.libray.dao.LibraryDAO;

public class UpdateBoard_form_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "board/insertBoard.jsp";
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		LibraryDAO dao = LibraryDAO.getInsetance();
		BoardVO bVo = new BoardVO();
		bVo = dao.selectBoardList_info_all(idx);
		request.setAttribute("board", bVo);
		request.setAttribute("type", bVo.getBoard_type());
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
