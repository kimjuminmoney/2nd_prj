package ra.admin.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project_VO.ManagerReviewVO;

public class ManagerReviewDAO {
	private static ManagerReviewDAO mrDAO;
	private ManagerReviewDAO() {
		
	}
	public static ManagerReviewDAO getInstance() {
		if(mrDAO == null) {
			mrDAO= new ManagerReviewDAO();
		}
		return mrDAO;
	}
	
	public int selectTotalCount(String id) throws SQLException{
		int cnt=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection db =DbConnection.getInstance();
		
		ManagerReviewVO mrVO = new ManagerReviewVO();
		List<ManagerReviewVO> mrList = new ArrayList<ManagerReviewVO>();
		
		try {
			
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("   select count(rvNO) cnt ")
			.append("  from review  " )
			.append(" where userid=?  ");
	
			pstmt = con.prepareStatement(Query.toString());
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
	
	public List<ManagerReviewVO>selectReview( String id, int startIndex, int endIndex )throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null ;
		DbConnection db = DbConnection.getInstance();
		
		ManagerReviewVO mrVO = new ManagerReviewVO();
		List<ManagerReviewVO> mrList = new ArrayList<ManagerReviewVO>();
		
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("  SELECT idx, rbNO, raNO, raName, rvDate, rvScore, rvText, rvRepot, rvddate. rvdtype, rvddetail  ")
			.append(" from(select row_number() over(order by r.rvDate desc) idx, ")
			.append(" r.rvNO, r.raNO ,ra.raName,r.rvDate, r.rvScore,r.rvText, r.rvReport,r.rvddate, r.rvdtype, r.rvddetail  ")
			.append("  from review r, RestArea ra  ")
			.append(" where userid=? and r.rano=ra.rano  ) " )
			.append(" where idx between ? and ?  " );
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, startIndex);
			pstmt.setInt(3,endIndex);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				mrVO = new ManagerReviewVO();
				mrVO.set
			}
		}
	}

}
