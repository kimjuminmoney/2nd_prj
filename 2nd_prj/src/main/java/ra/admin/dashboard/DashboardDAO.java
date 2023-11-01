package ra.admin.dashboard;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;




//매니저 마이페이지의 첫 번쨰 화면
//대쉬보드(접속자, 리뷰, 탈퇴자 등)의 정보를 가져옴

public class DashboardDAO { 

	private static DashboardDAO dbDAO;
	
	public DashboardDAO() {
		
	} //DashboardDAO
	
	
	public static DashboardDAO getInstance() {
		
		if(dbDAO == null) {
			dbDAO = new DashboardDAO();
		} //end if
		
		return dbDAO;
		
	} //getInstance
	
	  
	//top-left
	
	//휴게소별 누적 방문자수
	//session으로 연결해서 서버가 언 꺼지게 하기!
	//이건 별도의 추가하는게 아님!!!
	
	
	//휴게소별 누적 리뷰수
	public List<DashboardReviewVO> selectReviewSum() throws SQLException{
		List<DashboardReviewVO> list = new ArrayList<DashboardReviewVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");
			StringBuilder sb=new StringBuilder();
			sb.append("SELECT COUNT(*) AS count, ra.raname")
			.append("FROM review r")
			.append("INNER JOIN restarea ra ON r.rano = ra.rano")
			.append("GROUP BY ra.raname")
			.append("ORDER BY count DESC")
			.append("FETCH FIRST 3 ROWS ONLY;");

			
			pstmt = con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			
			DashboardReviewVO dbrVO = null;
			
			while(rs.next()) {
				dbrVO = new DashboardReviewVO();
				dbrVO.setCount(rs.getInt("count"));
				dbrVO.setCount(rs.getInt("raname"));
				list.add(dbrVO); //list가 더 큰 개념. 값을 넣는다
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		} // finally

		return list;
	}
	
	
	//middle
	//오늘가입자수, 전체가입자수, 오늘리뷰수, 전체리뷰수, 오늘탈퇴자수, 전체탈퇴자수
	//필요한 정보DB에서 가져오기
	
	public int selectDailyJoin() throws SQLException{ //오늘 가입자수
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT COUNT(*) 	cnt	")
			.append("FROM USERINFO  		")
			.append("WHERE UJOIN=sysdate	");
			
			//가입한 날짜가 오늘인 사람의 수를 세기
			//UJOIN이 DATE형식이기 때문에 where절에 date붙이지 않아도 됨~
			pstmt = con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
				}
 
			
		} finally {
			db.dbClose(rs, pstmt, con);
		} // finally
			return cnt;
	}
	
	
	public int selectJoinSum() throws SQLException{ //전체 가입자수
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");
			StringBuilder sb = new StringBuilder();
			sb.append("	SELECT COUNT(*) as cnt	")
			.append("	FROM USERINFO  			");
			
			
			pstmt = con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cnt=rs.getInt("cnt");
				}
	         
		} finally {
			db.dbClose(rs, pstmt, con);
		} // finally
			return cnt;
	}
	
	
	public int selectDailyReview() throws SQLException{ //오늘 리뷰수
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");
			StringBuilder sb=new StringBuilder();
			sb.append("SELECT COUNT(*)	cnt	")
			.append("FROM REVIEW 			")
			.append("WHERE RVDDATE=sysdate	");
			
			pstmt = con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
				}
	         
		} finally {
			db.dbClose(rs, pstmt, con);
		} // finally
			return cnt;
	}
	
	
	public int selectReviewSum1() throws SQLException{ //리뷰수 합계
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");
			StringBuilder sb = new StringBuilder();
			sb.append("	SELECT RVNO, COUNT(*)	cnt	")
			.append("	FROM   REVIEW				")
			.append("	GROUP BY  RVNO				");
			
			pstmt = con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
				}
	         
		} finally {
			db.dbClose(rs, pstmt, con);
		} // finally
			return cnt;
	}
	
	
	public int  selectDailyWithdrwal() throws SQLException{ //오늘 탈퇴자수
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");
			StringBuilder sb = new StringBuilder();
			sb.append("	SELECT COUNT(*) 	cnt						")
			.append("	FROM USERINFO  								")
			.append("	WHERE UQUIT=to_char(sysdate, 'yyyy-mm-dd')	");
			
			pstmt = con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
				}
	         
		} finally {
			db.dbClose(rs, pstmt, con);
		} // finally
			return cnt;
	}
	
	
	public int selectWithdrawalSum() throws SQLException{ // 전체 탈퇴자수
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");
			StringBuilder sb=new StringBuilder();
			sb.append("	SELECT COUNT(*) cnt		")
			.append("	FROM USERINFO  			")
			.append("	WHERE UQUIT is not null	");
			
			pstmt = con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
				}
	         
		} finally {
			db.dbClose(rs, pstmt, con);
		} // finally
			return cnt;
	}
	
	


	
} //class
