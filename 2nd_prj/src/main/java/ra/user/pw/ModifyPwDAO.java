package ra.user.pw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ra.user.myinfo.userInfoVO;
import ra.util.DbConnection;

public class ModifyPwDAO {
	private static ModifyPwDAO mpDAO;
	
	private ModifyPwDAO() {
		
	}
	
	public static ModifyPwDAO getInstance() {
		if( mpDAO == null) {
			mpDAO = new ModifyPwDAO();
		}
		return mpDAO;
	}//getinstance
	
	public String selectPW(String id) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		

		DbConnection db= DbConnection.getInstance();
		con= db.getConn("jdbc/dbcp");
		
		String uPw="";
		
		try {
			
			StringBuilder sb = new StringBuilder();
			sb.append("  select upw   ")
			.append("   from userinfo ")
			.append("   where userid=?    ");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				uPw=rs.getString("uPw");
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}

		return uPw;
		
	}//selectPW
	
	
public int ModifyPW(String id,String pw) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt =null;
		

		DbConnection db= DbConnection.getInstance();
		con= db.getConn("jdbc/dbcp");
		
		int cnt=0;
		
		try {
			
			StringBuilder sb = new StringBuilder();
			sb.append("  update userinfo   ")
			.append("   set uPw=? ")
			.append("   where userid=?    ");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			
			cnt=pstmt.executeUpdate();
			
			
		} finally {
			db.dbClose(null, pstmt, con);
		}

		return cnt;
		
		
	}//modifyPW
	
	
}
