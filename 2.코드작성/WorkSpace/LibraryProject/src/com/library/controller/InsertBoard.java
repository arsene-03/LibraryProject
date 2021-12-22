package com.library.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RequestWrapper;

import com.library.vo.BoardVO;
import com.libray.dao.LibraryDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;





@WebServlet("/IB")
public class InsertBoard extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String picture = null;
		String picture2 = null;
		String picture3 = null;
		String picture4 = null;
		String picture5 = null;
		String picture6 = null;
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String upLoadFilePath = request.getSession().getServletContext().getRealPath("image"); // ���ε� ����
		int uploadFileSizeLimit = 100*1024*1024 ;
		String encType = "UTF-8";
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request,
					upLoadFilePath,
					uploadFileSizeLimit,
					encType,
					new DefaultFileRenamePolicy()
					);
				
			if(multi.getFile("textImg") !=null) {
				String textImgName = multi.getFilesystemName("textImg");
				PrintWriter out = response.getWriter();
				out.print(textImgName);
				
			} else {
				String url = "script/alert.jsp";
				String board_title = multi.getParameter("board_title");
				String member_id = multi.getParameter("member_id");
				String member_pwd = multi.getParameter("member_pwd");
				String board_type = multi.getParameter("type");
				/* String board_content = multi.getParameter("board_content"); */
				String board_picture = addPicture(multi);
				String board_picture2 = addPicture(multi,2);
				String board_picture3 = addPicture(multi,3);
				String board_picture4 = addPicture(multi,4);
				String board_picture5 = addPicture(multi,5);
				String board_picture6 = addPicture(multi,6);
				String imgPlusText_hidden = multi.getParameter("imgPlusText_hidden");

				BoardVO bVo = new BoardVO();
				bVo.setBoard_title(board_title);
				bVo.setMember_id(member_id);
				bVo.setMember_pwd(member_pwd);
				bVo.setBoard_type(board_type);
				bVo.setBoard_content(imgPlusText_hidden);
				bVo.setBoard_picture(board_picture);
				bVo.setBoard_picture2(board_picture2);
				bVo.setBoard_picture3(board_picture3);
				bVo.setBoard_picture4(board_picture4);
				bVo.setBoard_picture5(board_picture5);
				bVo.setBoard_picture6(board_picture6);
				
				LibraryDAO dao = LibraryDAO.getInsetance();
				
				if(multi.getParameter("board_idx")!=null) {
					int board_idx = Integer.parseInt(multi.getParameter("board_idx"));
					bVo.setBoard_idx(board_idx);
					System.out.println("게시물 수정");
					boolean result_update = dao.updateBoard(bVo);
					request.setAttribute("result", "insert");
					request.setAttribute("condi", "update");
					request.setAttribute("result_condi", result_update);
					request.setAttribute("type", board_type);
				}else {
					System.out.println("게시물 등록");
					boolean result_insert = dao.insertBoard(bVo);
					request.setAttribute("result", "insert");
					request.setAttribute("condi", "insert");
					request.setAttribute("result_condi", result_insert);
					request.setAttribute("type", board_type);
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String addPicture(MultipartRequest multi) {
		String picture = null;
		if(multi.getFilesystemName("picture")!=null) {
			picture = multi.getFilesystemName("picture");
		}else if(multi.getParameter("picture")!=null){
			picture = multi.getParameter("picture");
		}
		return picture;
	}

	private String addPicture(MultipartRequest multi, int img) {
		String picture = null;
		if(multi.getFilesystemName("picture"+img)!=null) {
			picture = multi.getFilesystemName("picture"+img);
		}else if(multi.getParameter("picture"+img)!=null){
			picture = multi.getParameter("picture"+img);
		}
		return picture;
	}



}
