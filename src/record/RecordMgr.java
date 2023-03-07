package record;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

//import com.kh.MemberBean;

/*import com.kh.MemberBean;*/

import DB.*;
import board.BoardBean;

public class RecordMgr {
	private DBConnectionMgr pool;
	
	public RecordMgr() {
		pool = DBConnectionMgr.getInstance();
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
	
	public void insertRecord(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
	
		try {
			con = pool.getConnection(); 
			sql = "INSERT INTO record VALUES(rec_seq.nextval,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("rec_name"));
			pstmt.setString(2, req.getParameter("rec_date"));
			pstmt.setString(3, (req.getParameter("rec_dis")));
			//pstmt.setInt(3, req.getParameter(sql));
			pstmt.setString(4, req.getParameter("rec_time"));
			pstmt.setString(5, req.getParameter("rec_diary"));
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			pool.freeConnection(con,pstmt); 
		}
	}
	
	public RecordBean getRecord(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		RecordBean bean = new RecordBean();
		
		try {
			con = pool.getConnection(); 
			sql = "SELECT * FROM record WHERE rec_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				bean.setRec_num(rs.getInt(1));
				bean.setRec_name(rs.getString(2));
				bean.setRec_date(rs.getString(3));
				bean.setRec_dis(rs.getString(4));
				bean.setRec_time(rs.getString(5));
				bean.setRec_diary(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs); 
		}
		return bean;
	}
	
	public ArrayList<RecordBean> getAllRecord(/* int num */) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<RecordBean> alist = new ArrayList<RecordBean>();
		
			
		try {
			con = pool.getConnection();
			sql = "SELECT rec_num, rec_name, substr(to_char(rec_date,'yyyy-mm-dd'),9,10), rec_dis, rec_time, rec_diary FROM record";
			pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1,num); WHERE rec_num=?
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RecordBean bean = new RecordBean();
				bean.setRec_num(rs.getInt("rec_num"));
				bean.setRec_name(rs.getString("rec_name"));
				bean.setRec_date(rs.getString("substr(to_char(rec_date,'yyyy-mm-dd'),9,10)"));
				bean.setRec_dis(rs.getString("rec_dis"));
				bean.setRec_time(rs.getString("rec_time"));
				bean.setRec_diary(rs.getString("rec_diary"));
				alist.add(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return alist;
	}
	
	//하나의 객체만 조회
	public RecordBean getRecord(String name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		RecordBean bean = new RecordBean();
			
		try {
			con = pool.getConnection();
			sql = "SELECT rec_num, rec_name, to_char(rec_date,'yyyy-mm-dd'), rec_dis, rec_time, rec_diary FROM record where rec_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean.setRec_num(rs.getInt("rec_num"));
				bean.setRec_name(rs.getString("rec_name"));
				bean.setRec_date(rs.getString("to_char(rec_date,'yyyy-mm-dd')"));
				bean.setRec_dis(rs.getString("rec_dis"));
				bean.setRec_time(rs.getString("rec_time"));
				bean.setRec_diary(rs.getString("rec_diary"));
				//alist.add(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	
}
