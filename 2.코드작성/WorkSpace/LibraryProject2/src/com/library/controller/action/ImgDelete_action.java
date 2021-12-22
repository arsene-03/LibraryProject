package com.library.controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libray.dao.LibraryDAO;


public class ImgDelete_action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String url = "LS?command=updateBoard_form_action&idx="+idx;
		List<String> keys = new ArrayList<>();
		
		Map<String, String[]> lm = request.getParameterMap();
		
		for(Entry<String, String[]> entry : lm.entrySet()){
			keys.add(entry.getKey());
		}
		String cul = "board_"+keys.get(2);
		System.out.println(cul);
		LibraryDAO dao = LibraryDAO.getInsetance();
		dao.deleteBoardData(idx,cul);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
