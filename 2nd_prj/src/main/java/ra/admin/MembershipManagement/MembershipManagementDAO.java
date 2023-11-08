package ra.admin.MembershipManagement;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.util.cipher.DataDecrypt;
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
	
	public int selectTotalCount( ) throws SQLException {
		int cnt=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		try {
			
			con= db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    select count(userid) cnt    ")
			.append("    from userinfo    ");
			
			pstmt=con.prepareStatement(Query.toString());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}
		
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
		return cnt;
	}//selectTotalCount
	
	
	public List<MembershipManagementVO> selectAllMember() throws SQLException, NoSuchAlgorithmException, GeneralSecurityException{
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		MembershipManagementVO mmVO = null;
		
		List<MembershipManagementVO> list= new ArrayList<MembershipManagementVO>();
		DbConnection db= DbConnection.getInstance();
		con= db.getConn("jdbc/dbcp");
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("     select *       ")
			.append("     from USERINFO     ");
			
			pstmt=con.prepareStatement(sb.toString());

			rs=pstmt.executeQuery();
			DataDecrypt dd= new DataDecrypt("a12345678901234567");
			
			while(rs.next()) {
				
				mmVO = new MembershipManagementVO();
				
				mmVO.setUserId(rs.getString("userId"));
				mmVO.setuPw(rs.getString("uPw"));
				mmVO.setuName(dd.decryption(rs.getString("UNAME")));
				mmVO.setuNic(rs.getString("UNIC"));
				mmVO.setuEmail(dd.decryption(rs.getString("uEmail")));
				mmVO.setuTel(dd.decryption(rs.getString("UTEL")));
				mmVO.setuJoin(rs.getDate("ujoin"));
				mmVO.setuQuit(rs.getDate("uQuit"));
				
				list.add(mmVO);
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return list;
	}//selectAllMember
	
	public MembershipManagementVO selectMember( String userId ) throws SQLException, UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException{
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		MembershipManagementVO mmVO = null;
		
		DbConnection db= DbConnection.getInstance();
		con= db.getConn("jdbc/dbcp");
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("     select *       ")
			.append("     from USERINFO where userId=?     ");
			
			pstmt=con.prepareStatement(sb.toString());
			
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			DataDecrypt dd= new DataDecrypt("a12345678901234567");
			
			if(rs.next()) {

				mmVO = new MembershipManagementVO();
				
				mmVO.setUserId(rs.getString("userId"));
				mmVO.setuPw(rs.getString("uPw"));
				mmVO.setuName(dd.decryption(rs.getString("UNAME")));
				mmVO.setuNic(rs.getString("UNIC"));
				mmVO.setuEmail(dd.decryption(rs.getString("uEmail")));
				mmVO.setuTel(dd.decryption(rs.getString("UTEL")));
				mmVO.setuJoin(rs.getDate("ujoin"));
				mmVO.setuQuit(rs.getDate("uQuit"));
				
			}
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return mmVO;
	}//selectMember
	
	public int modifyInfo( MembershipManagementVO mmVO )throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con= db.getConn("jdbc/dbcp");
			StringBuilder query = new StringBuilder();
			query.append(" update userinfo     ")
			.append("    set UPW=?, UNAME=?, UNIC=?, UTEL=?, UEMAIL=?     ")
			.append("  where USERID=?     ");
			
			pstmt=con.prepareStatement(query.toString());
			
			pstmt.setString(1, mmVO.getuPw());
			pstmt.setString(2, mmVO.getuName());
			pstmt.setString(3, mmVO.getuNic());
			pstmt.setString(4, mmVO.getuTel());
			pstmt.setString(5, mmVO.getuTel());
			pstmt.setString(6, mmVO.getUserId());
			
			int cnt=pstmt.executeUpdate();
			
			return  cnt;
		}finally {
			db.dbClose(null, pstmt, con);
		}
	}//modifyInfo
	
	public int deleteMember( String userId )throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		int cnt=0;
		try {
			con= db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("     update USERINFO     ")
			.append("    set uquit=sysdate       ")
			.append("    where USERID=?     ");
			
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, userId);
			
			cnt=pstmt.executeUpdate();

		}finally {
			db.dbClose(null, pstmt, con);
		}
		return cnt;
	}//deleteMember
	
}

