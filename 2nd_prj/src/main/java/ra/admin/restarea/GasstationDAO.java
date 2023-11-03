package ra.admin.restarea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;

public class GasstationDAO {
	private static GasstationDAO gDAO;
	
	private GasstationDAO() {
		
	}//GasstationDAO
	
	public static GasstationDAO getInstance() {
		if (gDAO == null) {
			gDAO = new GasstationDAO();
		}//end if
		return gDAO;
	}//getInstance
	
	public String selectGassNo(String rano) throws SQLException{
		String gsno = "";
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = db.getConn("jdbc/dbcp");
			String sb = " select LPAD(gsno, 6, '0') gsno from gasstation where rano = ? ";
			
			pstmt = con.prepareStatement(sb);
			
			pstmt.setString(1, rano);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				gsno = rs.getString("gsno");
			}//end while
		} finally {
			db.dbClose(rs, pstmt, con);
		}//finally
		
		return gsno;
	}//selectGassNo
	
	

}
