package ra.user.highway;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;

public class HighwayDAO {
	private static HighwayDAO hDAO;
	private HighwayDAO() {
		
	};
	public static HighwayDAO getInstance() {
		if(hDAO==null) {
			hDAO= new HighwayDAO();
		}
		return hDAO;
	}
	
	
	public List<HighwayVO> selectAllHighways() throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		HighwayVO hVO=null;
		List<HighwayVO> list=new ArrayList<HighwayVO>();
		
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    SELECT distinct hno,hname     ")
			.append("    from highway     ");
			
			pstmt=con.prepareStatement(Query.toString());
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				hVO=new HighwayVO();
				hVO.sethName(rs.getString("hName"));
				hVO.sethNo(rs.getString("hNO"));
				
				list.add(hVO);
			}//end while
				
		} finally {
			db.dbClose(rs, pstmt, con);
		}
			return list;
	}//selectAllLocation
		
	public List<RestareaVO> selectRA(String hNO) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs= null;
			DbConnection db= DbConnection.getInstance();
			
			RestareaVO raVO= null;
			List<RestareaVO> list=new ArrayList<RestareaVO>();
			try {
				con=db.getConn("jdbc/dbcp");
				StringBuilder Query = new StringBuilder();
				Query.append("    SELECT rano,raname,rax,ray     ")
				.append("    from restarea     ")
				.append("    where hno=?     ");
				
				pstmt=con.prepareStatement(Query.toString());
				pstmt.setString(1, hNO);
				
				rs=pstmt.executeQuery();
				while(rs.next()) {
					raVO= new RestareaVO();
					
					raVO.setRaNo(rs.getString("rano"));
					raVO.setRaName(rs.getString("raname"));
					raVO.setRaX(rs.getString("rax"));
					raVO.setRaY(rs.getString("ray"));
					
					list.add(raVO);
				}//end while
			} finally {
				db.dbClose(rs, pstmt, con);
			}
			return list;
		}//selectAllLocation

}
