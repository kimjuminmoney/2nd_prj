package ra.admin.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.proxy.annotation.Pre;
import project_VO.reviewAdminVO;

public class reviewAdminDAO {
	
	private static reviewAdminDAO raDAO;
	private reviewAdminDAO() {
		
	}
	public static reviewAdminDAO getInstance() {
		if(raDAO==null) {
			raDAO=new reviewAdminDAO();
		}
		return raDAO;
	}
	public int selectTotalCount(String id)throws SQLException{
		int cnt=0;
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection db = DbConnection.getInstance();
		
		reviewAdminVO raVO = new reviewAdminVO();
		List<reviewAdminVO>rvList=new ArrayList<reviewAdminVO>();
		
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append(" select count(rvNO) cnt ")
			.append(" from review ")
			.append(" where userid=? " );
			
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}
			
			}finally {
				db.dbClose(null, pstmt, con);
			}
			return cnt;
	}
	
	public List<reviewAdminVO>selectReivew(String id, int startIndex, int endIndex)throws SQLException{
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		DbConnection db= DbConnection.getInstance();
		
		reviewAdminVO raVO = new reviewAdminVO();
		List<reviewAdminVO> raList = new ArrayList<reviewAdminVO>();
		
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    SELECT idx, rvNO, raNO, raName, rvDate, rvScore, rvText, rvReport,rvddate,rvdtype,rvddetail   ")
			.append("    from(select  row_number() over(order by r.rvDate desc) idx,   ")
			.append("    r.rvNO,r.raNO,ra.raName,r.rvDate,r.rvScore,r.rvText,r.rvReport,r.rvddate,r.rvdtype,r.rvddetail    ")
			.append("    from review r, RestArea ra   ")
			.append("    where userid=? and r.rano=ra.rano   )    ")
			.append("    where idx between ? and ?    ");
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2,startIndex);
			pstmt.setInt(3, endIndex);
			
rs=pstmt.executeQuery();
			
			while(rs.next()) {
					raVO=new reviewAdminVO();
					raVO.setRvNO(rs.getInt("rvNO"));
					raVO.setRaNo(rs.getString("raNO"));
					raVO.setRaName(rs.getString("raName"));
					raVO.setRvDate(rs.getDate("rvDate"));
					raVO.setRvText(rs.getString("rvText"));
					raVO.setRvScore(rs.getInt("rvScore"));
					raVO.setRvReport(rs.getInt("rvReport"));
					raVO.setRvdType(rs.getString("rvdType"));
					raVO.setRvdDetail(	rs.getString("rvdDetail"));
					raVO.setRvdDate(rs.getDate("rvdDate"));
					
					System.out.println(raVO);
					raList.add(raVO);
		}
			return raList;
		
}finally {
	db.dbClose(rs, pstmt, con);
}

}
	public int modifyReview(String id, int rvNO, int rvScore, String rvText)throws SQLException{
		Connection con = null;
		PreparedStatement pstmt=null;
		DbConnection db=DbConnection.getInstance();
		
		try {
			con= db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    update review     ")
			.append("    set rvText=?, rvScore=?    ")
			.append("    where userid=? and rvNo=?    ");
			
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, rvText);
			pstmt.setInt(2, rvScore);
			pstmt.setString(3, id);
			pstmt.setInt(4, rvNO);
			
			int cnt= pstmt.executeUpdate();
			System.out.println("2--"+cnt);
			return cnt;
		}finally {
			db.dbClose(null, pstmt, con);
		}
			
		}

		public int deleteReview(String id, int rvNO)throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			DbConnection db = DbConnection.getInstance();
			
			try {
				con=db.getConn("jdbc/dbcp");
				StringBuilder Query = new StringBuilder();
				Query.append(" delete from review ")
				.append("  where userid=? and rvNo=?  ");
				
				
				pstmt=con.prepareStatement(Query.toString());
				pstmt.setString(1, id);
				pstmt.setInt(2, rvNO);
				
				int cnt=pstmt.executeUpdate();
				System.out.println("4---"+cnt);
				return cnt;
			}finally {
				db.dbClose(rs, pstmt, con);
			}
		}

}