package poll;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DB.*;
import record.RecordBean;

public class PollItemMgr {
	private DBConnectionMgr pool;
	
	public PollItemMgr() {
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
		// 참여자 조회
		public PollItemBean getParti(String name) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			PollItemBean bean = new PollItemBean();
			//RecordBean bean = new RecordBean();
				
			try {
				con = pool.getConnection();
				sql = "SELECT * FROM pollitem where partici=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					bean.setList_num(rs.getInt("list_num"));
					bean.setItem_num(rs.getInt("item_num"));
					bean.setItem(rs.getString("item"));
					bean.setCount(rs.getInt("count"));
					bean.setPartici(rs.getString("list_num"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
}