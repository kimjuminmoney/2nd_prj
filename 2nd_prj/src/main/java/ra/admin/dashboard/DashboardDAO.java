package ra.admin.dashboard;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import restArea.DbConnection;



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
	public int selectReviewSum() throws SQLException{
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");
			StringBuilder sb=new StringBuilder();
			sb.append("SELECT RVNO, COUNT(*) cnt	")
			.append("FROM REVIEW 					")
			.append("GROUP BY  RVNO					");


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
