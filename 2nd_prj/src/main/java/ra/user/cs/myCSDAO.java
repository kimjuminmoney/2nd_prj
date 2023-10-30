package ra.user.cs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;

public class myCSDAO {

	private static myCSDAO mcDAO;
	private myCSDAO() {
		
	}
	public static myCSDAO getInstance() {
		if(mcDAO ==null) {
			mcDAO=new myCSDAO();
		}
		return mcDAO;
	}
	
	public int selectTotalCount( String id ) throws SQLException {
		int cnt=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		try {
			
			con= db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    select count(csNO) cnt    ")
			.append("    from customerService    ")
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
	
	
	public List<MyCSVO> selectMyCS( String id, int startNum, int endNum ) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		MyCSVO cVO=null;
		List<MyCSVO> csList=new ArrayList<MyCSVO>();
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    SELECT idx,userid,csno,cstype,rano,raname,csdate,cstext,empno,csadate,csanswer     ")
			.append("    from (select  row_number() over(order by cs.csDate desc) idx,    ")
			.append("    cs.userid, cs.csNO, cs.cstype, cs.raNO, ra.raName, cs.csdate, cs.cstext, cs.empno, cs.csadate, cs.csanswer    ")
			.append("    from Customerservice CS    ")
			.append("    left join RestArea ra on   cs.rano=ra.rano    ")
			.append("    left join employee e on    cs.empno= e.empno    ")
			.append("    where cs.userid=? )    ")
			.append("    where idx between ? and ?    ");
			
			
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				cVO=new MyCSVO();
				cVO.setUserId(rs.getString("userid"));
				cVO.setCsNO(rs.getInt("csNo"));
				cVO.setRaNO(rs.getString("rano"));
				cVO.setCsType(rs.getString("csType"));
				cVO.setRaName(rs.getString("raname"));
				cVO.setCsText(rs.getString("cstext"));
				cVO.setEmpno(rs.getString("empno"));
				cVO.setCsAnswer(rs.getString("csanswer"));
				cVO.setCsDate(rs.getDate("csdate"));
				cVO.setCsAdate(rs.getDate("csadate"));
				
				System.out.println(cVO);
				csList.add(cVO);
			}//end while
				return csList;
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
	
	
	}//selectAllCS
	
	public MyCSVO selectOneCS( String id, int csNO ) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		MyCSVO cVO=null;
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    SELECT userid,csno,rano,cstype,raname,csdate,cstext,empno,csadate,csanswer     ")
			.append("    from (select      ")
			.append("    cs.userid,cs.csno, cs.raNO, cs.cstype, ra.raName, cs.csdate, cs.cstext, cs.empno, cs.csadate, cs.csanswer    ")
			.append("    from Customerservice CS    ")
			.append("    left join RestArea ra on   cs.rano=ra.rano    ")
			.append("    left join employee e on    cs.empno= e.empno    ")
			.append("    where cs.userid=? )    ")
			.append("    where csNO=?    ");
			
			
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, csNO);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cVO=new MyCSVO();
				cVO.setUserId(rs.getString("userid"));
				cVO.setCsNO(rs.getInt("csNO"));
				cVO.setRaNO(rs.getString("rano"));
				cVO.setCsType(rs.getString("csType"));
				cVO.setRaName(rs.getString("raname"));
				cVO.setCsText(rs.getString("cstext"));
				cVO.setEmpno(rs.getString("empno"));
				cVO.setCsAnswer(rs.getString("csanswer"));
				cVO.setCsDate(rs.getDate("csdate"));
				cVO.setCsAdate(rs.getDate("csadate"));
				
				System.out.println(cVO);
			}//end while
				return cVO;
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
	
	}//selectAllCS

	public MyCSVO insertCS( String id ) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		MyCSVO cVO=null;
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    SELECT userid,csno,rano,cstype,raname,csdate,cstext,empno,csadate,csanswer     ")
			.append("    from (select      ")
			.append("    cs.userid,cs.csno, cs.raNO, cs.cstype, ra.raName, cs.csdate, cs.cstext, cs.empno, cs.csadate, cs.csanswer    ")
			.append("    from Customerservice CS    ")
			.append("    left join RestArea ra on   cs.rano=ra.rano    ")
			.append("    left join employee e on    cs.empno= e.empno    ")
			.append("    where cs.userid=? )    ")
			.append("    where csNO=?    ");
			
			
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cVO=new MyCSVO();
				cVO.setUserId(rs.getString("userid"));
				cVO.setCsNO(rs.getInt("csNO"));
				cVO.setRaNO(rs.getString("rano"));
				cVO.setCsType(rs.getString("csType"));
				cVO.setRaName(rs.getString("raname"));
				cVO.setCsText(rs.getString("cstext"));
				cVO.setEmpno(rs.getString("empno"));
				cVO.setCsAnswer(rs.getString("csanswer"));
				cVO.setCsDate(rs.getDate("csdate"));
				cVO.setCsAdate(rs.getDate("csadate"));
				
				System.out.println(cVO);
			}//end while
				return cVO;
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
	
	}//insertCS

}
