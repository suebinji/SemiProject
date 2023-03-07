package member;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;

import DB.*;

public class MemberMgr {
	private DBConnectionMgr pool;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//샘플
	public void Sample() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}
		return ;
	}
	
	/*
	 * public boolean insertMember(MemberBean bean) { Connection con = null;
	 * PreparedStatement pstmt = null; String sql = null; boolean flag = false;
	 * 
	 * 
	 * try { con = pool.getConnection(); sql =
	 * "INSERT INTO member3 VALUES(mem_id,?,?,?,?,?)"; pstmt =
	 * con.prepareStatement(sql); //pstmt.setString(1, bean.getMem_id());
	 * pstmt.setString(1, bean.getMem_pw()); pstmt.setString(2, bean.getMem_name());
	 * pstmt.setString(3, bean.getMem_birthday()); pstmt.setString(4,
	 * bean.getMem_gender()); pstmt.setString(5, bean.getMem_phone());
	 * 
	 * if(pstmt.executeUpdate() ==1) { flag = true; };
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally {
	 * pool.freeConnection(con,pstmt); } return flag; }
	 */
	
	public void insertMember(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			con = pool.getConnection();
			sql = "INSERT INTO member2 VALUES(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("mem_id"));
			pstmt.setString(2, req.getParameter("mem_pw"));
			pstmt.setString(3, req.getParameter("mem_name"));
			pstmt.setString(4, req.getParameter("mem_birthday"));
			pstmt.setString(5, req.getParameter("mem_gender"));
			pstmt.setInt(6, Integer.parseInt(req.getParameter("mem_phone")));
			pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}

	}
	
	public boolean loginMember(String mem_id, String mem_pw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			sql = "SELECT mem_id from member2 WHERE mem_id=? AND mem_pw=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, mem_pw);
			rs = pstmt.executeQuery();
			flag = rs.next();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return flag;
	}
	
	//아이디 중복체크
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			sql = "SELECT mem_id FROM member2 WHERE mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return flag;
	}
	
	
	/*
	 * public boolean checkId(String id) { Connection con = null; PreparedStatement
	 * pstmt = null; String sql = null; boolean flag = false; ResultSet rs = null;
	 * 
	 * try { con = pool.getConnection(); sql =
	 * "SELECT mem_id FROM MEMBER2 WHERE mem_id=?"; // + id; -> 사용자가 넣은 id가 있으면 가지고
	 * 와라. pstmt = con.prepareStatement(sql); pstmt.setString(1, id); rs =
	 * pstmt.executeQuery(); flag = rs.next();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally {
	 * pool.freeConnection(con,pstmt); } return flag; }
	 */
	
}
