	package com.libray.dao;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.library.db.DBManager;
import com.library.vo.BoardVO;
import com.library.vo.MemberVO;
import com.library.vo.Member_logVO;

import oracle.jdbc.proxy.annotation.Pre;

public class LibraryDAO {
	private LibraryDAO() {};
	private static LibraryDAO dao = new LibraryDAO();
	public static LibraryDAO getInsetance() {
		return dao;
	}
/////////////////////////////////////////////////////////////////
	public List<MemberVO> selectAllMember() { //회원정보 전체 조회메서드
		
		String sql = "SELECT * FROM member";
		
		List<MemberVO> memberList = new ArrayList<>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MemberVO mVo = new MemberVO();
				mVo.setMember_id(rs.getString("member_id"));
				mVo.setMember_pwd(rs.getString("member_pwd"));
				mVo.setMember_name(rs.getString("member_name"));
				mVo.setMember_jumin(rs.getString("member_jumin"));
				mVo.setMember_address(rs.getString("member_address"));
				mVo.setMember_email(rs.getString("member_email"));
				mVo.setMember_tel(rs.getString("member_tel"));
				mVo.setMember_date(rs.getDate("member_date"));
				mVo.setMember_type(rs.getString("member_type"));
				mVo.setMember_point(rs.getInt("member_point"));
				
				memberList.add(mVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, stmt, rs);
		}
		return memberList;
	}
/////////////////////////////////////////////////////////////////
	public List<Member_logVO> selectAllMemberLog() { //회원정보 로그 전체 조회 메서드
		
		String sql = "SELECT * FROM member_log";
		
		List<Member_logVO> member_logList = new ArrayList<>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Member_logVO mVo = new Member_logVO();
				mVo.setMember_id(rs.getString("member_id"));
				mVo.setMember_pwd(rs.getString("member_pwd"));
				mVo.setMember_name(rs.getString("member_name"));
				mVo.setMember_jumin(rs.getString("member_jumin"));
				mVo.setMember_address(rs.getString("member_address"));
				mVo.setMember_email(rs.getString("member_email"));
				mVo.setMember_tel(rs.getString("member_tel"));
				mVo.setMember_date(rs.getDate("member_date"));
				mVo.setMember_type(rs.getString("member_type"));
				mVo.setMember_point(rs.getInt("member_point"));
				
				member_logList.add(mVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, stmt, rs);
		}
		return member_logList;
	}
/////////////////////////////////////////////////////////////////
	public void insertMember(MemberVO mVo) { //회원 가입 메서드
		
		String sql = "INSERT INTO member (member_id,member_pwd,member_name,member_jumin,member_address,member_email,member_tel,member_type) VALUES(?,?,?,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,mVo.getMember_id());
			psmt.setString(2,mVo.getMember_pwd());
			psmt.setString(3,mVo.getMember_name());
			psmt.setString(4,mVo.getMember_jumin());
			psmt.setString(5,mVo.getMember_address());
			psmt.setString(6,mVo.getMember_email());
			psmt.setString(7,mVo.getMember_tel());
			psmt.setString(8,mVo.getMember_type());
			
			psmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt);
		}
	}
/////////////////////////////////////////////////////////////////
	public List<BoardVO> selectBoardList(String type) { //게시판 조회 메서드
		
		String sql = "SELECT * FROM board WHERE board_type = ? ORDER BY board_idx";
		
		List<BoardVO> boardList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardVO bVo = new BoardVO();
				bVo.setBoard_idx(rs.getInt("board_idx"));
				bVo.setBoard_title(rs.getString("board_title"));
				bVo.setMember_id(rs.getString("member_id"));
				bVo.setMember_pwd(rs.getString("member_pwd"));
				bVo.setBoard_content(rs.getString("board_content"));
				bVo.setBoard_time(rs.getTimestamp("board_time"));
				bVo.setBoard_type(rs.getString("board_type"));
				bVo.setBoard_count(rs.getInt("board_count"));
				bVo.setBoard_picture(rs.getString("board_picture"));
				bVo.setBoard_picture2(rs.getString("board_picture2"));
				bVo.setBoard_picture3(rs.getString("board_picture3"));
				bVo.setBoard_picture4(rs.getString("board_picture4"));
				bVo.setBoard_picture5(rs.getString("board_picture5"));
				bVo.setBoard_picture6(rs.getString("board_picture6"));
				
				boardList.add(bVo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt, rs);
		}
		return boardList;
	}
/////////////////////////////////////////////////////////////////
	public BoardVO selectBoardList_info_all(int idx) { //게시물 상세조회 메서드
		
		String sql = "SELECT * FROM board WHERE board_idx="+idx;
		
		BoardVO bVo = new BoardVO();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				bVo.setBoard_idx(idx);
				bVo.setBoard_title(rs.getString("board_title"));
				bVo.setMember_id(rs.getString("member_id"));
				bVo.setMember_pwd(rs.getString("member_pwd"));
				if(rs.getString("board_content")!=null) {			
					bVo.setBoard_content(rs.getString("board_content")
//							.replace("\n", "<br>")
//							.replace("<textarea id=", "")
//							.replace("\"textbox\" rows=\"10\" cols=\"30\">", "")
//							.replace("</textarea>", "")
							);
					
				}
				bVo.setBoard_time(rs.getTimestamp("board_time"));
				bVo.setBoard_type(rs.getString("board_type"));
				bVo.setBoard_count(rs.getInt("board_count"));
				bVo.setBoard_picture(rs.getString("board_picture"));
				bVo.setBoard_picture2(rs.getString("board_picture2"));
				bVo.setBoard_picture3(rs.getString("board_picture3"));
				bVo.setBoard_picture4(rs.getString("board_picture4"));
				bVo.setBoard_picture5(rs.getString("board_picture5"));
				bVo.setBoard_picture6(rs.getString("board_picture6"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, stmt, rs);
		}
		return bVo;
	}
/////////////////////////////////////////////////////////////////
	public int selectBoardList_info_nextBoard_idx(int idx, String type) { //특정 게시물의 다음 게시물 조회 메서드
	
		String sql = "SELECT min(board_idx) from board WHERE board_idx > ? AND board_type = ?";
		int nextIdx = 0;
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			psmt.setString(2, type);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				nextIdx = rs.getInt("min(board_Idx)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt, rs);
		}
		return nextIdx;
	}
/////////////////////////////////////////////////////////////////
	public int selectBoardList_info_beforeBoard_idx(int idx, String type) { //특정 게시물의 이전 게시물 조회 메서드
		
		String sql = "SELECT max(board_idx) from board WHERE board_idx < ? AND board_type = ?";
		int beforeIdx = 0;
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			psmt.setString(2, type);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				beforeIdx = rs.getInt("max(board_Idx)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt, rs);
		}
		return beforeIdx;
	}
/////////////////////////////////////////////////////////////////
	public int[] firstAndEnd_idx(String type) { //해당 게시판의 처음게시물과 마지막 게시물 조회 메서드
		
		String sql = "SELECT max(board_idx), min(board_idx) FROM board WHERE board_type=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int[] maxAndmin_idx = null;
		int max_idx = 0;
		int min_idx = 0;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				max_idx = rs.getInt("max(board_Idx)");
				min_idx = rs.getInt("min(board_Idx)");
			}
			maxAndmin_idx = new int[]{max_idx, min_idx};
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt, rs);
		}
		return maxAndmin_idx;
	}
/////////////////////////////////////////////////////////////////
	public boolean insertBoard(BoardVO bVo) { //게시물 등록 메서드
		String strtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(System.currentTimeMillis());
		Timestamp time = Timestamp.valueOf(strtime);
		
		String sql = "INSERT INTO board VALUES (board_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,bVo.getBoard_title());
			psmt.setString(2,bVo.getMember_id());
			psmt.setString(3,bVo.getMember_pwd());
			psmt.setString(4,bVo.getBoard_content());
			psmt.setTimestamp(5,time);
			psmt.setString(6,bVo.getBoard_type());
			psmt.setInt(7,0);
			psmt.setString(8,bVo.getBoard_picture());
			psmt.setString(9,bVo.getBoard_picture2());
			psmt.setString(10,bVo.getBoard_picture3());
			psmt.setString(11,bVo.getBoard_picture4());
			psmt.setString(12,bVo.getBoard_picture5());
			psmt.setString(13,bVo.getBoard_picture6());
			
			psmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DBManager.Close(conn, psmt);
		}
		return true;
	}
/////////////////////////////////////////////////////////////////
	public boolean deleteBoard(String idx) { //게시물 삭제 메서드
		String sql = "DELETE FROM board WHERE board_idx="+idx;
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DBManager.Close(conn, stmt);
		}
		return true;
	}
/////////////////////////////////////////////////////////////////
	public boolean updateBoard(BoardVO bVo) { //게시물 수정 메서드
		
		String sql = "UPDATE board SET board_title=?, board_content=?, board_type=?, board_picture=?, board_picture2=?, board_picture3=?, board_picture4=?, board_picture5=?, board_picture6=? WHERE board_idx="+bVo.getBoard_idx();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,bVo.getBoard_title());
			psmt.setString(2,bVo.getBoard_content());
			psmt.setString(3,bVo.getBoard_type());
			psmt.setString(4,bVo.getBoard_picture());
			psmt.setString(5,bVo.getBoard_picture2());
			psmt.setString(6,bVo.getBoard_picture3());
			psmt.setString(7,bVo.getBoard_picture4());
			psmt.setString(8,bVo.getBoard_picture5());
			psmt.setString(9,bVo.getBoard_picture6());
			
			psmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DBManager.Close(conn, psmt);
		}
		return true;
	}
/////////////////////////////////////////////////////////////////
	public void deleteBoardData(String idx, String cul) { //게시물 첨부파일 삭제 메서드
		String sql = "UPDATE board SET "+cul+"= null WHERE board_idx="+idx;
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, stmt);
		}
	}
/////////////////////////////////////////////////////////////////
	public int getSelectNumBoard(String type) {	//특정 게시판에 전체 게시물의 개수 구하는 메서드
		int cntAll = 0;
		String sql = "SELECT COUNT(*) FROM board WHERE board_type =?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cntAll = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt, rs);
		}
		return cntAll;
	}
/////////////////////////////////////////////////////////////////
	public int getSelectNumBoard_search(String type, String searchText) { //특정 게시판에 검색된 게시물의 개수 구하는 메서드
		int cntAll = 0;
		String sql = "SELECT COUNT(*) FROM board WHERE board_type =? AND board_title LIKE ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			psmt.setString(2, searchText);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cntAll = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt, rs);
		}
		return cntAll;
	}
/////////////////////////////////////////////////////////////////
	public List<BoardVO> selectTargetBoard_img(int section, int pageNum, String type) { //9개씩 페이징 하는 메서드
		List<BoardVO> boardList = new ArrayList<>();
		
		String sql = "SELECT * FROM (SELECT ROWNUM as nic, board_idx, board_title, member_id, member_pwd, board_content, board_time, board_type, board_count, board_picture, board_picture2, board_picture3, board_picture4, board_picture5, board_picture6 FROM"
				+"(SELECT * FROM board WHERE board_type = ? ORDER BY board_idx))" + 
				"WHERE nic BETWEEN (?-1)*90+(?-1)*9+1 AND (?-1)*90+?*9";
		//0+1~0+9 / 0+9+1~18/ 0~18+1 ~ 27 // .......0+82 
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			psmt.setInt(2, section);
			psmt.setInt(3, pageNum);
			psmt.setInt(4, section);
			psmt.setInt(5, pageNum);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardVO bVo = new BoardVO();
				bVo.setBoard_idx(rs.getInt("board_idx"));
				bVo.setBoard_title(rs.getString("board_title"));
				bVo.setMember_id(rs.getString("member_id"));
				bVo.setMember_pwd(rs.getString("member_pwd"));
				bVo.setBoard_content(rs.getString("board_content"));
				bVo.setBoard_time(rs.getTimestamp("board_time"));
				bVo.setBoard_type(rs.getString("board_type"));
				bVo.setBoard_count(rs.getInt("board_count"));
				bVo.setBoard_picture(rs.getString("board_picture"));
				bVo.setBoard_picture2(rs.getString("board_picture2"));
				bVo.setBoard_picture3(rs.getString("board_picture3"));
				bVo.setBoard_picture4(rs.getString("board_picture4"));
				bVo.setBoard_picture5(rs.getString("board_picture5"));
				bVo.setBoard_picture6(rs.getString("board_picture6"));
				
				boardList.add(bVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt, rs);
		}
		return boardList;
	}
/////////////////////////////////////////////////////////////////
	public List<BoardVO> selectTargetBoard(int section, int pageNum, String type) { //10개씩 페이징 하는 메서드
		List<BoardVO> boardList = new ArrayList<>();
		
		String sql = "SELECT * FROM (SELECT ROWNUM as nic, board_idx, board_title, member_id, member_pwd, board_content, board_time, board_type, board_count, board_picture, board_picture2, board_picture3, board_picture4, board_picture5, board_picture6 FROM"
				+"(SELECT * FROM board WHERE board_type = ? ORDER BY board_idx DESC))" + 
				"WHERE nic BETWEEN (?-1)*100+(?-1)*10+1 AND (?-1)*100+?*10";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			psmt.setInt(2, section);
			psmt.setInt(3, pageNum);
			psmt.setInt(4, section);
			psmt.setInt(5, pageNum);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardVO bVo = new BoardVO();
				bVo.setBoard_idx(rs.getInt("board_idx"));
				bVo.setBoard_title(rs.getString("board_title"));
				bVo.setMember_id(rs.getString("member_id"));
				bVo.setMember_pwd(rs.getString("member_pwd"));
				bVo.setBoard_content(rs.getString("board_content"));
				bVo.setBoard_time(rs.getTimestamp("board_time"));
				bVo.setBoard_type(rs.getString("board_type"));
				bVo.setBoard_count(rs.getInt("board_count"));
				bVo.setBoard_picture(rs.getString("board_picture"));
				bVo.setBoard_picture2(rs.getString("board_picture2"));
				bVo.setBoard_picture3(rs.getString("board_picture3"));
				bVo.setBoard_picture4(rs.getString("board_picture4"));
				bVo.setBoard_picture5(rs.getString("board_picture5"));
				bVo.setBoard_picture6(rs.getString("board_picture6"));
				
				boardList.add(bVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt, rs);
		}
		return boardList;
	}
/////////////////////////////////////////////////////////////////	
	public List<BoardVO> selectSearchBoard(int section, int pageNum, String type, String searchText) { //검색된 게시물 10개씩 페이징 하는 메서드
		List<BoardVO> boardList = new ArrayList<>();
		
		String sql = "SELECT * FROM (SELECT ROWNUM as nic, board_idx, board_title, member_id, member_pwd, board_content, board_time, board_type, board_count, board_picture, board_picture2, board_picture3, board_picture4, board_picture5, board_picture6 FROM"
				+"(SELECT * FROM board WHERE board_type = ? ORDER BY board_idx DESC))" + 
				"WHERE nic BETWEEN (?-1)*100+(?-1)*10+1 AND (?-1)*100+?*10 AND board_title LIKE ?";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			psmt.setInt(2, section);
			psmt.setInt(3, pageNum);
			psmt.setInt(4, section);
			psmt.setInt(5, pageNum);
			psmt.setString(6, searchText);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardVO bVo = new BoardVO();
				bVo.setBoard_idx(rs.getInt("board_idx"));
				bVo.setBoard_title(rs.getString("board_title"));
				bVo.setMember_id(rs.getString("member_id"));
				bVo.setMember_pwd(rs.getString("member_pwd"));
				bVo.setBoard_content(rs.getString("board_content"));
				bVo.setBoard_time(rs.getTimestamp("board_time"));
				bVo.setBoard_type(rs.getString("board_type"));
				bVo.setBoard_count(rs.getInt("board_count"));
				bVo.setBoard_picture(rs.getString("board_picture"));
				bVo.setBoard_picture2(rs.getString("board_picture2"));
				bVo.setBoard_picture3(rs.getString("board_picture3"));
				bVo.setBoard_picture4(rs.getString("board_picture4"));
				bVo.setBoard_picture5(rs.getString("board_picture5"));
				bVo.setBoard_picture6(rs.getString("board_picture6"));
				
				boardList.add(bVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt, rs);
		}
		return boardList;
	}
/////////////////////////////////////////////////////////////////
	public MemberVO selectMember(String userId) { //특정 회원 정보를 구하는 메서드
		String sql = "SELECT * FROM member WHERE member_id =?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberVO mVo = new MemberVO();
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				mVo.setMember_id(rs.getString("member_id"));
				mVo.setMember_pwd(rs.getString("member_pwd"));
				mVo.setMember_name(rs.getString("member_name"));
				mVo.setMember_jumin(rs.getString("member_jumin"));
				mVo.setMember_address(rs.getString("member_address"));
				mVo.setMember_email(rs.getString("member_email"));
				mVo.setMember_tel(rs.getString("member_tel"));
				mVo.setMember_date(rs.getDate("member_date"));
				mVo.setMember_type(rs.getString("member_type"));
				mVo.setMember_point(rs.getInt("member_point"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt, rs);
		}
		return mVo;
	}
/////////////////////////////////////////////////////////////////
	public int confirmID(String member_id) { //ID 중복여부 체크 메서드
		int result = -1;
		String sql = "SELECT member_id FROM member WHERE member_id=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member_id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, psmt, rs);
		}
		return result;
	}
/////////////////////////////////////////////////////////////////	
	public String transeCode(String member_pwd) { //비밀번호 'SHA-1' 방식으로 암호화 하는 메서드
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			md.update(member_pwd.getBytes());
			
			byte byteDate[] = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(int i=0; i<byteDate.length; i++) {
				sb.append(Integer.toString((byteDate[i]&0xff) + 0x100, 16).substring(1));
			}
			
			member_pwd = sb.toString();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member_pwd;
	}
/////////////////////////////////////////////////////////////////
	public void select_countUp(int idx, int count) { //게시물 조회수 증가 메서드
		count = count+1;
		
		String sql = "UPDATE board SET board_count = "+count+" WHERE board_idx="+idx;
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.Close(conn, stmt);
		}
		
	}
	
}
