package board;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import DB.*;

public class BoardMgr {
	private DBConnectionMgr pool;
	
	public BoardMgr() {
		pool = DBConnectionMgr.getInstance(); // 연결 pool 객체 생성
	}
	
	public void sampleWithExplain() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
	
		try {
			con = pool.getConnection(); // pool객체를 이용해 Connection 객체 생성 
		// 얻어진 Connection객체를 사용해 DB에 질의를 던지고 질의 결과 처리
		
		} catch (Exception e) {
	
			e.printStackTrace();
		} finally {
			//사용된 Connection객체를 pool에 반환, Statement 객체, ResultSet객체
			pool.freeConnection(con,pstmt,rs); 
		}
	}
	
	public void sample() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
	
		try {
			con = pool.getConnection(); 
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			pool.freeConnection(con,pstmt,rs); 
		}
	}
	
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection(); 
			sql = "INSERT INTO board(bor_num, bor_name, bor_subject, bor_content, bor_pos, bor_ref, bor_depth, bor_regdate, bor_pass, bor_ip, bor_count) VALUES(seq_board.nextval,?,?,?,0,seq_board.currval,0,SYSDATE,?,0,0)";
			pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1, Integer.parseInt(req.getParameter("bor_num")));
			pstmt.setString(1, req.getParameter("bor_name"));
			pstmt.setString(2, req.getParameter("bor_subject"));
			pstmt.setString(3, req.getParameter("bor_content"));
			//pstmt.setInt(4, Integer.parseInt(req.getParameter("bor_ref")));
			pstmt.setString(4, req.getParameter("bor_pass"));
			//pstmt.setString(6, req.getParameter("bor_ip"));
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			pool.freeConnection(con,pstmt); 
		}
	}
	
	
	public ArrayList<BoardBean> getBoardList(String keyField, String keyWord, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ArrayList<BoardBean> alist = new ArrayList<BoardBean>();
		try {
			con = pool.getConnection();
			// 최신보기 설정 : ref의 내림차순, pos의 오름차순
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "SELECT BT2.* FROM (SELECT ROWNUM R1, BT1.* FROM (SELECT * FROM board ORDER BY bor_ref DESC)BT1)BT2 WHERE R1 >=? AND R1 <=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}else {
				sql = "SELECT BT2.* FROM (SELECT ROWNUM R1, BT1.* FROM (SELECT * FROM board ORDER BY bor_ref DESC)BT1 WHERE "+ keyField + " like ?)BT2 WHERE R1 >= ? AND R1 <=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setBor_num(rs.getInt("bor_num"));
				bean.setBor_name(rs.getString("bor_name"));
				bean.setBor_subject(rs.getString("bor_subject"));
				bean.setBor_content(rs.getString("bor_content"));
				bean.setBor_pos(rs.getInt("bor_pos"));
				bean.setBor_ref(rs.getInt("bor_ref"));
				bean.setBor_depth(rs.getInt("bor_depth"));
				bean.setBor_regdate(rs.getString("bor_regdate"));
				bean.setBor_count(rs.getInt("bor_count"));
				alist.add(bean);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			pool.freeConnection(con,pstmt,rs); 
		}
		return alist;
	} 
	
	//조회수 증가 기능
		public void upCount(int num) { 
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "UPDATE board SET bor_count = bor_count+1 WHERE bor_num =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con,pstmt);
			}
		}
		
		public BoardBean getBoard(int num) { 
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			BoardBean bean = new BoardBean();
			
			try {
				con = pool.getConnection();
				sql = "SELECT * FROM board WHERE bor_num =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs= pstmt.executeQuery();
				
				if(rs.next()) {
					bean.setBor_num(rs.getInt(1));
					bean.setBor_name(rs.getString(2));
					bean.setBor_subject(rs.getString(3));
					bean.setBor_content(rs.getString(4));
					bean.setBor_pos(rs.getInt(5));
					bean.setBor_ref(rs.getInt(6));
					bean.setBor_depth(rs.getInt(7));
					bean.setBor_regdate(rs.getString(8).substring(0,11));
					bean.setBor_pass(rs.getString(9));
					bean.setBor_ip(rs.getString(10));
					bean.setBor_count(rs.getInt(11));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con,pstmt,rs);
			}
			return bean;
		} 
}
