package poll;

import java.sql.*;
import java.util.Vector;

import DB.*;
import record.RecordBean;

public class PollMgr {
	private DBConnectionMgr pool;
	
	public PollMgr() {
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
	
	// 투표 폼 작성
	public int insertPoll(PollListBean plBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		int result = 0;
//		int result2 = 0;
				
		try {
			con = pool.getConnection();
			sql = "INSERT INTO polllist VALUES(POLL_SEQ.NEXTVAL,?,?,?,?,?,?,SYSDATE,DEFAULT,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, plBean.getPoll_sub());
			pstmt.setInt(2, plBean.getPoll_party());
			pstmt.setString(3, plBean.getPoll_stime());
			pstmt.setString(4, plBean.getPoll_etime());
			pstmt.setInt(5, plBean.getPoll_phone());
			pstmt.setString(6,plBean.getPoll_name());
			pstmt.setInt(7, plBean.getCount());
			result = pstmt.executeUpdate();
			
			/*
			 * if(result ==1) { sql =
			 * "INSERT INTO pollitem VALUES(POLL_SEQ.CURRVAL,?,?,DEFAULT)"; pstmt =
			 * con.prepareStatement(sql); String item[] = piBean.getItem();
			 * 
			 * for(int i = 0; i<item.length;i++) { if(item[i] == null || item[i].equals(""))
			 * break; pstmt.setInt(1, i); pstmt.setString(2, item[i]); result2 =
			 * pstmt.executeUpdate(); } if(result2==1) flag = true; }
			 */
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}
		return result;
	}
	
	
	// 투표하는 폼 작성
	public PollListBean getList(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		PollListBean plBean = new PollListBean();
		
		try {
			con = pool.getConnection();
			if(num == 0)
				sql = "SELECT * FROM polllist ORDER BY poll_num";
			else
				sql = "SELECT * FROM polllist WHERE poll_num=" + num;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				plBean.setPoll_sub(rs.getString("poll_sub"));
				plBean.setPoll_stime(rs.getString("poll_stime"));
				plBean.setPoll_etime(rs.getString("poll_etime"));
				plBean.setPoll_party(rs.getInt("poll_party"));
				plBean.setPoll_name(rs.getString("poll_name"));
				plBean.setCount(rs.getInt("count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return plBean;
	}
	
	// 투표하면 count+1
	public void updatePoll(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		//ResultSet rs = null;
		//int result =0;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE polllist SET count = count +1 WHERE poll_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			/* result = */pstmt.executeUpdate();
			
			//if(rs.next())
				//rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}
	}
	
	// 투표 취소하면 count -1
	public void downPoll(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		//ResultSet rs = null;
		//int result =0;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE polllist SET count = count -1 WHERE poll_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			/* result = */pstmt.executeUpdate();
			
			//if(rs.next())
				//rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}
	}
	
	// 전체 리스트값 반환
	public Vector<PollListBean> getAllList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<PollListBean> vlist = new Vector<PollListBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT poll_num, poll_sub, poll_name FROM polllist order by poll_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PollListBean plBean = new PollListBean();
				plBean.setPoll_num(rs.getInt("poll_num"));
				plBean.setPoll_sub(rs.getString("poll_sub"));
				plBean.setPoll_name(rs.getString("poll_name"));
				vlist.add(plBean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vlist;
	}
	
	// 기능구현전
	public int sumCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		int count = 0;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			sql = "SELECT SUM(count) FROM pollitem WHERE listnum =?";
			pstmt = con.prepareStatement(sql);
			//if()
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}
		return count;
	}
	
	public Vector<PollItemBean> getView(int num) {
		Connection con = null;
	   	PreparedStatement pstmt = null;
	   	String sql = null;
	   	ResultSet rs = null;
	   	Vector<PollItemBean> vlist = new Vector<PollItemBean>();
	   	
	   	try {
			   con = pool.getConnection();
			   sql = "SELECT item, count FROM pollitem WHERE list_num =?";
			   pstmt = con.prepareStatement(sql);
			   if(num==0)
				   pstmt.setInt(1, getMaxNum());
			   else
				   pstmt.setInt(1, num);
			   
			   rs = pstmt.executeQuery();
			   while(rs.next()) {
				   PollItemBean piBean = new PollItemBean();
				   String[] item = new String[1];			   
				   item[0] = rs.getString("item");
				   //piBean.setItem(item);
				   piBean.setCount(rs.getInt("count"));
				   vlist.add(piBean);
			   }
		   }  catch (Exception e) {
			e.printStackTrace();
		   } finally {
			pool.freeConnection(con,pstmt,rs);
		   }
		   return vlist;
	}
	
	public int getMaxNum() {
	   	  Connection con = null;
	      PreparedStatement pstmt = null;
	      String sql = null;
	      ResultSet rs = null;
	      int maxNum =0;
	      
	      try {
			con=pool.getConnection();
			sql = "SELECT MAX(NUM) FROM POLLLIST";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt,rs);
		}
	      return maxNum;
	}
	
}
