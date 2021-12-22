package com.library.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.vo.BoardVO;
import com.libray.dao.LibraryDAO;

public class SelectBoardList_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {// ���ǽü��������� �̵�
		String url = null;
		String type = request.getParameter("type");
		String searchText = request.getParameter("searchText");
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int section = Integer.parseInt((_section==null)?"1":_section);
		int pageNum = Integer.parseInt((_pageNum==null)?"1":_pageNum);
		
		LibraryDAO dao = LibraryDAO.getInsetance();
		List<BoardVO> boardList = null;
		
		int totalCnt = dao.getSelectNumBoard(type);
		switch (type) {
		case "convenient":
			url = "board/imgBoardList.jsp";
			boardList = dao.selectTargetBoard_img(section, pageNum, type);
			break;
		case "notice":
			url = "board/noticeBoardList.jsp";
			if(searchText == null) {
				boardList = dao.selectTargetBoard(section, pageNum, type);
				
			}else {
				searchText = "%"+searchText+"%";
				boardList = dao.selectSearchBoard(section, pageNum, type, searchText);
				totalCnt = dao.getSelectNumBoard_search(type,searchText);
			}
			break;
		case "event":
			url = "board/eventBoardList.jsp";
			if(searchText == null) {
				boardList = dao.selectTargetBoard(section, pageNum, type);
				
			}else {
				searchText = "%"+searchText+"%";
				boardList = dao.selectSearchBoard(section, pageNum, type, searchText);
				totalCnt = dao.getSelectNumBoard_search(type,searchText);
			}
			break;
		case "suggest":
			url = "board/suggestBoardList.jsp";
			if(searchText == null) {
				boardList = dao.selectTargetBoard(section, pageNum, type);
				
			}else {
				searchText = "%"+searchText+"%";
				boardList = dao.selectSearchBoard(section, pageNum, type, searchText);
				totalCnt = dao.getSelectNumBoard_search(type,searchText);
			}
			break;
		}
		
	
		request.setAttribute("section", section);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("boardList", boardList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
