package ra.admin.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;

public class ReviewDAO {
	
	private static ReviewDAO mrDAO;
	private ReviewDAO() {
		
	}
	public static ReviewDAO getInstance() {
		if(mrDAO == null) {
			mrDAO=new ReviewDAO();
		}//end if
		return mrDAO;
	}

	public int selectTotalCount( ) throws SQLException {
		int cnt=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		ReviewVO mrVO=new ReviewVO();
		List<ReviewVO> rvList=new ArrayList<ReviewVO>();

		try {
			
			con= db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    select count(rvNO) cnt    ")
			.append("    from review    ");
			
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
	
public List<ReviewVO> selectAllReview( ) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		ReviewVO rVO=new ReviewVO();
		List<ReviewVO> rvList=new ArrayList<ReviewVO>();
		
		try {
			
			con= db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    SELECT idx, rvNO, raNO, raName, rvDate, rvScore, rvText, userId, uNic, rvReport,rvddate,rvdtype,rvddetail   ")
			.append("    from(select  row_number() over(order by r.rvDate desc) idx,   ")
			.append("    r.rvNO,r.raNO,ra.raName,r.rvDate,r.rvScore,r.rvText,r.userid,u.unic,r.rvReport,r.rvddate,r.rvdtype,r.rvddetail    ")
			.append("    from review r, RestArea ra, userinfo u   ")
			.append("    where r.userid = u.userid and r.rano = ra.rano )     ");
			
			pstmt=con.prepareStatement(Query.toString());
			
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
					rVO=new ReviewVO();
					rVO.setRvNo(rs.getInt("rvNO"));
					rVO.setRaNo(rs.getString("raNO"));
					rVO.setRaName(rs.getString("raName"));
					rVO.setRvDate(rs.getDate("rvDate"));
					rVO.setRvText(rs.getString("rvText"));
					rVO.setRvScore(rs.getInt("rvScore"));
					rVO.setUserId(rs.getString("userId"));
					rVO.setuNic(rs.getString("uNic"));
					rVO.setRvReport(rs.getInt("rvReport"));
					rVO.setRvdType(rs.getString("rvdType"));
					rVO.setRvdDetail(	rs.getString("rvdDetail"));
					rVO.setRvdDate(rs.getDate("rvdDate"));
						
					System.out.println(rVO);
					rvList.add(rVO);
				}
		
			return rvList;
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
	}//selectReview
	
public List<ReviewVO> selectOverReport() throws SQLException {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	DbConnection db= DbConnection.getInstance();
	
	ReviewVO rVO=new ReviewVO();
	List<ReviewVO> rvList=new ArrayList<ReviewVO>();
	
	try {
		
		con= db.getConn("jdbc/dbcp");
		StringBuilder Query = new StringBuilder();
		Query.append("    SELECT idx, rvNO, raNO, raName, rvDate, rvScore, rvText, userId, uNic, rvReport,rvddate,rvdtype,rvddetail   ")
		.append("    from(select  row_number() over(order by r.rvDate desc) idx,   ")
		.append("    r.rvNO,r.raNO,ra.raName,r.rvDate,r.rvScore,r.rvText,r.userid,u.unic,r.rvReport,r.rvddate,r.rvdtype,r.rvddetail    ")
		.append("    from review r, RestArea ra, userinfo u   ")
		.append("    where r.userid = u.userid and r.rano = ra.rano )     ")
		.append("    where rvReport > 9     ");
		
		pstmt=con.prepareStatement(Query.toString());
		
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
				rVO=new ReviewVO();
				rVO.setRvNo(rs.getInt("rvNO"));
				rVO.setRaNo(rs.getString("raNO"));
				rVO.setRaName(rs.getString("raName"));
				rVO.setRvDate(rs.getDate("rvDate"));
				rVO.setRvText(rs.getString("rvText"));
				rVO.setRvScore(rs.getInt("rvScore"));
				rVO.setUserId(rs.getString("userId"));
				rVO.setuNic(rs.getString("uNic"));
				rVO.setRvReport(rs.getInt("rvReport"));
				rVO.setRvdType(rs.getString("rvdType"));
				rVO.setRvdDetail(	rs.getString("rvdDetail"));
				rVO.setRvdDate(rs.getDate("rvdDate"));
					
				System.out.println(rVO);
				rvList.add(rVO);
			}
	
		return rvList;
	} finally {
		db.dbClose(rs, pstmt, con);
	}
	
}//selectReview
	
public ReviewVO selectOneReview( String userId, String rvNo ) throws SQLException {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	DbConnection db= DbConnection.getInstance();
	
	ReviewVO rVO=new ReviewVO();
	
	try {
		
		con= db.getConn("jdbc/dbcp");
		StringBuilder Query = new StringBuilder();
		Query.append("    SELECT idx, rvNO, raNO, raName, rvDate, rvScore, rvText, userId, uNic, rvReport,rvddate,rvdtype,rvddetail   ")
		.append("    from(select  row_number() over(order by r.rvDate desc) idx,   ")
		.append("    r.rvNO,r.raNO,ra.raName,r.rvDate,r.rvScore,r.rvText,r.userid,u.unic,r.rvReport,r.rvddate,r.rvdtype,r.rvddetail    ")
		.append("    from review r, RestArea ra, userinfo u   ")
		.append("    where r.userid = u.userid and r.rano = ra.rano )     ")
		.append("    where userid=? and rvNo=?     ");
		
		pstmt=con.prepareStatement(Query.toString());
		int rvNO=Integer.valueOf(rvNo);
		pstmt.setString(1, userId);
		pstmt.setInt(2, rvNO);
		
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
				rVO=new ReviewVO();
				rVO.setRvNo(rs.getInt("rvNO"));
				rVO.setRaNo(rs.getString("raNO"));
				rVO.setRaName(rs.getString("raName"));
				rVO.setRvDate(rs.getDate("rvDate"));
				rVO.setRvText(rs.getString("rvText"));
				rVO.setRvScore(rs.getInt("rvScore"));
				rVO.setUserId(rs.getString("userId"));
				rVO.setuNic(rs.getString("uNic"));
				rVO.setRvReport(rs.getInt("rvReport"));
				rVO.setRvdType(rs.getString("rvdType"));
				rVO.setRvdDetail(	rs.getString("rvdDetail"));
				rVO.setRvdDate(rs.getDate("rvdDate"));
					
				System.out.println(rVO);
			}
	
		return rVO;
	} finally {
		db.dbClose(rs, pstmt, con);
	}
	
}//selectReview




}//class
