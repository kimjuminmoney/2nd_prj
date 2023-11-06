package ra.admin.MembershipManagement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ra.util.DbConnection;


public class MembershipManagementDAO {
	
	private static MembershipManagementDAO mmDAO;
	private MembershipManagementDAO() {
		
	}
	public static MembershipManagementDAO getInstance() {
		if(mmDAO==null) {
			mmDAO=new MembershipManagementDAO();
		}
		return mmDAO;
	}
	
	
	
	public int modifyMember(String USERID, String UNICK,  String UTEL) throws SQLException{
		int cnt=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConnection db = DbConnection.getInstance();
		con= db.getConn("jdbc/dbcp");
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("    update USERINFO     ")
			.append(" set UNICK=?, UTEL=? ")
			.append("   where USERID=?    ");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, UNICK);
			pstmt.setString(2, UTEL);
			pstmt.setString(3, USERID);
			cnt=pstmt.executeUpdate();
			System.out.println(sb+" / "+USERID+" "+UNICK+" cnt "+cnt);
		}finally {
			db.dbClose(null, pstmt, con);
		}
		return cnt;
	}
	
	public MembershipManagementVO selectUserInfo( String USERID) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		MembershipManagementVO mmVO = new MembershipManagementVO();
		
		DbConnection db= DbConnection.getInstance();
		con= db.getConn("jdbc/dbcp");
		try {
			StringBuilder sb = new StringBuilder();
			sb.append(" select UNAME, UNICK, UTEL  ")
			.append(" from USERINFO ")
			.append(" where USERID=? ");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, USERID);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String UNAME =rs.getString("UNAME");
				String UNICK = rs.getString("UNICK");
				String UTEL = rs.getString("UTEL");
				
				mmVO.setUSERID(USERID);
				mmVO.setUNAME(UNAME);
				mmVO.setUTEL(UTEL);
				System.out.println(mmVO);
			}
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return mmVO;
		
	}
	
	
	public int deleteMember(String USERID, String UNICK)throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con= db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append(" delete from USERINFO ")
			.append("  where USERID=? and UNICK=?  ");
			
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, USERID);
			pstmt.setString(2, UNICK);
			
			int cnt=pstmt.executeUpdate();
			System.out.println("4---"+cnt);
			return  cnt;
		}finally {
			db.dbClose(null, pstmt, con);
		}
	}
	
}

