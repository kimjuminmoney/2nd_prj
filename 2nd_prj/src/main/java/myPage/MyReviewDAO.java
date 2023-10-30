package myPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyReviewDAO {
	
	private static MyReviewDAO mrDAO;
	private MyReviewDAO() {
		
	}
	public static MyReviewDAO getInstance() {
		if(mrDAO == null) {
			mrDAO=new MyReviewDAO();
		}//end if
		return mrDAO;
	}

	public int selectTotalCount( String id ) throws SQLException {
		int cnt=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		MyReviewVO mrVO=new MyReviewVO();
		List<MyReviewVO> rvList=new ArrayList<MyReviewVO>();

		try {
			
			con= db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    select count(rvNO) cnt    ")
			.append("    from review    ")
			.append("    where userid=?    ");
			
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}
		
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
		return cnt;
	}//selectTotalCount
	
	public List<MyReviewVO> selectReview( String id,int startIndex, int endIndex ) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		MyReviewVO mrVO=new MyReviewVO();
		List<MyReviewVO> rvList=new ArrayList<MyReviewVO>();
		
		try {
			
			con= db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    SELECT idx, rvNO, raNO, raName, rvDate, rvScore, rvText, rvReport,rvddate,rvdtype,rvddetail   ")
			.append("    from(select  row_number() over(order by r.rvDate desc) idx,   ")
			.append("    r.rvNO,r.raNO,ra.raName,r.rvDate,r.rvScore,r.rvText,r.rvReport,r.rvddate,r.rvdtype,r.rvddetail    ")
			.append("    from review r, RestArea ra   ")
			.append("    where userid=? and r.rano=ra.rano   )    ")
			.append("    where idx between ? and ?    ");
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, startIndex); 
			pstmt.setInt(3, endIndex);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
					mrVO=new MyReviewVO();
					mrVO.setRvNo(rs.getInt("rvNO"));
					mrVO.setRaNo(rs.getString("raNO"));
					mrVO.setRaName(rs.getString("raName"));
					mrVO.setRvDate(rs.getDate("rvDate"));
					mrVO.setRvText(rs.getString("rvText"));
					mrVO.setRvScore(rs.getInt("rvScore"));
					mrVO.setRvReport(rs.getInt("rvReport"));
					mrVO.setRvdType(rs.getString("rvdType"));
					mrVO.setRvdDetail(	rs.getString("rvdDetail"));
					mrVO.setRvdDate(rs.getDate("rvdDate"));
							
					System.out.println(mrVO);
					rvList.add(mrVO);
				}
				
		
			return rvList;
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
	}//selectReview
	
	/**
	 * @param id
	 * @param rvNO
	 * @param rvScore
	 * @param rvText
	 * @throws SQLException
	 */
	public int modifyReview(String id, int rvNO, int rvScore, String rvText) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db= DbConnection.getInstance();
		System.out.println("1");
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
			
			int cnt=pstmt.executeUpdate();
			System.out.println("2--"+cnt);
			return cnt;
		} finally {
			db.dbClose(null, pstmt, con);
		}
	}//ModifyInfo
	
	public int deleteReview(String id, int rvNO) throws SQLException {
		System.out.println("3");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		DbConnection db= DbConnection.getInstance();
		
		try {
			
			con= db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    delete from review     ")
			.append(" where userid=? and rvNo=?    ");
			
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, rvNO);
			
			int cnt=pstmt.executeUpdate();
			System.out.println("4---"+cnt);
			return cnt;
		} finally {
			db.dbClose(null, pstmt, con);
		}
	}//ModifyInfo
}//class
