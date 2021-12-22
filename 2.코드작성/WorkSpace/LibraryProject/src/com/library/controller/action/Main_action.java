package com.library.controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.vo.BoardVO;
import com.libray.dao.LibraryDAO;

public class Main_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "main.jsp";
		
		
		//이벤트게시물 2개
		
		LibraryDAO dao = LibraryDAO.getInsetance();
		int idxEvent_1 = dao.firstAndEnd_idx("event")[0];
		int idxEvent_2 = dao.selectBoardList_info_beforeBoard_idx(idxEvent_1, "event");
		
		BoardVO bVo = new BoardVO();
		
		bVo = dao.selectBoardList_info_all(idxEvent_1);
		String content_1 = bVo.getBoard_content();
		content_1 = correction(content_1);
		
		request.setAttribute("event_1", bVo);
		request.setAttribute("event_1_con", content_1);
		
		bVo = dao.selectBoardList_info_all(idxEvent_2);
		String content_2 = bVo.getBoard_content();
		content_2 = correction(content_2);
		
		request.setAttribute("event_2", bVo);
		request.setAttribute("event_2_con", content_2);
		
		//공지사항 2개
		
		int idxNotice_1 = dao.firstAndEnd_idx("notice")[0];
		int idxNotice_2 = dao.selectBoardList_info_beforeBoard_idx(idxNotice_1, "notice");
		
		bVo = dao.selectBoardList_info_all(idxNotice_1); 
		request.setAttribute("notice_1", bVo);
		
		bVo = dao.selectBoardList_info_all(idxNotice_2);
		request.setAttribute("notice_2", bVo);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}
	public String correction(String content) {
		if (content != null) {
			content = content.replace("\n", "<br>")
								.replace("<textarea id=", "")
								.replace("\"textbox\" rows=\"10\" cols=\"30\">", "")
								.replace("</textarea>", "");
		} else {
			content = "";
		}
		return content;
	}

	

}
