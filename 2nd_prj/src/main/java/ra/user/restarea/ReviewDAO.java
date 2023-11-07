package ra.user.restarea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;

public class ReviewDAO {
	
	private static ReviewDAO rvDAO;
	
	private ReviewDAO() {
		
	}//ReviewDAO
	
	public static ReviewDAO getInstance() {
		if(rvDAO == null) {
			rvDAO = new ReviewDAO();
		}//end if
		return rvDAO;
	}//getInstance
	
	public List<ReviewVO> selectReview(String raNo) throws SQLException{
		ReviewVO rvVO;
		
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectReview = new StringBuilder();
			selectReview
			.append("	select u.unic, r.rvno, r.rvtext, r.rvscore, r.rvreport, r.rvdate	")
			.append("	from review r, userinfo u									")
			.append("	where r.userid=u.userid and rano=? and rvreport<5								")
			.append("	order by r.rvdate desc								");
			
			pstmt=con.prepareStatement(selectReview.toString());
			
			pstmt.setString(1, raNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rvVO = new ReviewVO(rs.getInt("rvno"),rs.getString("unic"),rs.getString("rvtext"),rs.getInt("rvscore"),rs.getInt("rvreport"),rs.getDate("rvdate"));
				reviewList.add(rvVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return reviewList;
	}//selectReview

	public boolean insertReview(String userId, String raNum, String rvText, int rvScore) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder insertReview = new StringBuilder();
			
			insertReview
			.append("	insert into review(rvno, userid, rano, rvdate, rvtext, rvscore, rvreport)	")
			.append("	values((select max(rvno)+1 from review),?,?,sysdate,?,?,0)		");
			
			pstmt = con.prepareStatement(insertReview.toString());
			
			pstmt.setString(1, userId);
			pstmt.setString(2, raNum);
			pstmt.setString(3, rvText);
			pstmt.setInt(4, rvScore);
			
			boolean flag = pstmt.execute();
			
			return flag;
			
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
	}//insertReview
	
	public int updateUser(ReviewVO rvVO) throws SQLException {
		int rowCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder updateReview = new StringBuilder();
			updateReview
			.append("	update review								")
			.append("	set	rvtext = ?, rvdate=sysdate, rvscore=?	")
			.append("	where rvno=?								");
			
			pstmt = con.prepareStatement(updateReview.toString());
			
			pstmt.setString(1, rvVO.getReviewText());
			pstmt.setInt(2, rvVO.getReviewScore());
			pstmt.setInt(3, rvVO.getReviewNum());
			
			rowCnt=pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
		}//finally
		return rowCnt;
	}//updateUser
	
	public int updateReport(String rvNo) throws SQLException {
		int rowCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder updateReview = new StringBuilder();
			updateReview
			.append("	update review								")
			.append("	set rvreport=rvreport+1	")
			.append("	where rvno=?								");
			
			pstmt = con.prepareStatement(updateReview.toString());
			
			pstmt.setString(1, rvNo);
			
			rowCnt=pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
		}//finally
		return rowCnt;
	}//updateUser
	
}//class





