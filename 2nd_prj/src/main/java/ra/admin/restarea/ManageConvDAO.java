package ra.admin.restarea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import ra.util.DbConnection;


public class ManageConvDAO {

private static ManageConvDAO mcDAO;
	
	private ManageConvDAO() {
		
	}//ManageConvDAO
	
	public static ManageConvDAO getInstance() {
		if(mcDAO == null) {
			mcDAO = new ManageConvDAO();
		}//end if
		return mcDAO;
	}//getInstance
	
	public boolean insertConv(ManageConvVO mcVO) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
		
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder insertConv = new StringBuilder();
			
			insertConv
			.append("	insert into convinient(rano, cno,  cname, cdetail, cdate)	")
			.append("	values(?,(select max(cno)+1 from convinient),?,?,sysdate)			");
			
			pstmt = con.prepareStatement(insertConv.toString());
			
			pstmt.setString(1, mcVO.getRestAreaNum());
			//pstmt.setInt(2, mcVO.getIconNum()==0?"":mcVO.getIconNum());
			pstmt.setString(2, mcVO.getConvName());
			//pstmt.setString(3, mcVO.getConvTel());
			pstmt.setString(3, mcVO.getConvDetail());
			
			boolean flag = pstmt.execute();
			
			return flag;
		}finally {
			db.dbClose(null, pstmt, con);
		}//finally
		
	}//insertConv
	
	public int updateConv(ManageConvVO mcVO) throws SQLException {
		int rowCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder updateConv = new StringBuilder();
			updateConv
			.append("	update convinient						")
			.append("	set ino=?, cname=?, ctel=?, cdetail=?	")
			.append("	where cno=?								");
			
			pstmt = con.prepareStatement(updateConv.toString());
			
			pstmt.setInt(1, mcVO.getIconNum());
			pstmt.setString(2, mcVO.getConvName());
			pstmt.setString(3, mcVO.getConvTel());
			pstmt.setString(4, mcVO.getConvDetail());
			pstmt.setInt(5, mcVO.getConvNum());
			
			rowCnt = pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
		}//end finally
		return rowCnt;
	}//updateConv
	
	public int deleteConv(ManageConvVO mcVO) throws SQLException {
		int rowCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			String updateConv = "delete from convinient where cno=?";
			
			pstmt = con.prepareStatement(updateConv);
			
			pstmt.setInt(1, mcVO.getConvNum());
			
			rowCnt = pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
		}//end finally
		return rowCnt;
	}//deleteConv
}
