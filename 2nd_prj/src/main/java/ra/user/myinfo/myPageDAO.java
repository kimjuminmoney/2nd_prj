package ra.user.myinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ra.util.DbConnection;

public class myPageDAO {

	/**
	 * 개인정보 수정 메소드
	 * @param id
	 * @param nick
	 * @param email
	 * @param tel
	 * @throws SQLException
	 */
	public int modifyInfo( String id,String nick, String email, String tel ) throws SQLException {
		int cnt=0;
		
		Connection con = null;
		PreparedStatement pstmt =null;
		
		DbConnection db= DbConnection.getInstance();
		con= db.getConn("jdbc/dbcp");

		try {
			StringBuilder sb = new StringBuilder();
			sb.append("   update userinfo   ")
			.append("   set unic=?,   uemail=?,   utel=? ")
			.append("   where userid=?    ");
			
			pstmt=con.prepareStatement(sb.toString());
			
			pstmt.setString(1, nick);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);
			pstmt.setString(4, id);
			cnt=pstmt.executeUpdate();
			System.out.println( sb +" / "+id + " "+nick+" "+email + " cnt "+ cnt);
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		return cnt;
	}
	
	public userInfoVO selectUserInfo( String id ) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		userInfoVO uiVO=new userInfoVO();

		DbConnection db= DbConnection.getInstance();
		con= db.getConn("jdbc/dbcp");
		try {
			
			StringBuilder sb = new StringBuilder();
			sb.append("  select unic,uname,uemail,utel   ")
			.append("   from userinfo ")
			.append("   where userid=?    ");
			
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				String unick=rs.getString("unic");
				String uname= rs.getString("uname");
				String uemail=rs.getString("uemail");
				String utel=rs.getString("utel");

				uiVO.setId(id);
				uiVO.setNick(unick);
				uiVO.setName(uname);
				uiVO.setEmail(uemail);
				uiVO.setTel(utel);
				System.out.println(uiVO);
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}

		return uiVO;
	}
	

	
	
}
