package ra.admin.cs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;

public class AdminCSDAO2 {

	private static AdminCSDAO2 mcDAO;
	private AdminCSDAO2() {
		
	}
	public static AdminCSDAO2 getInstance() {
		if(mcDAO ==null) {
			mcDAO=new AdminCSDAO2();
		}
		return mcDAO;
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
			Query.append("    select count(csNO) cnt    ")
			.append("    from customerService    ");
			
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
	
	
	public List<AdminCSVO> selectAllCS( int startNum, int endNum ) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		AdminCSVO cVO=null;
		List<AdminCSVO> csList=new ArrayList<AdminCSVO>();
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    SELECT idx,userid,csno,cstype,rano,raname,csdate,cstext,empno,csadate,csanswer     ")
			.append("    from (select  row_number() over(order by cs.csDate desc) idx,    ")
			.append("    cs.userid, cs.csNO, cs.cstype, cs.raNO, ra.raName, cs.csdate, cs.cstext, cs.empno, cs.csadate, cs.csanswer    ")
			.append("    from Customerservice CS    ")
			.append("    left join RestArea ra on   cs.rano=ra.rano    ")
			.append("    left join employee e on    cs.empno= e.empno    ")
			.append("    )    ")
			.append("    where idx between ? and ?    ");
			
			
			pstmt=con.prepareStatement(Query.toString());

			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				cVO=new AdminCSVO();
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
				
				csList.add(cVO);
			}//end while
				
		} finally {
			db.dbClose(rs, pstmt, con);
		}
	
		return csList;
	}//selectAllCS
	
	public AdminCSVO selectOneCS( String id, int csNO ) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		AdminCSVO cVO=null;
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
				cVO=new AdminCSVO();
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
				
			}//end while
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return cVO;
		
	}//selectAllCS
	
	public List<raVO> selectRA( String loc) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		List<raVO> list=new ArrayList<raVO>(); 
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    SELECT rano,raname     ")
			.append("    from restarea     ")
			.append("    where ralo=?     ");
			
			pstmt=con.prepareStatement(Query.toString());
			pstmt.setString(1, loc);
			
			rs=pstmt.executeQuery();
			
			raVO raVO=null;
			
			while(rs.next()) {
				raVO=new raVO();
				raVO.setRaNo(rs.getInt("rano"));
				raVO.setRaName(rs.getString("raname"));
				list.add(raVO);
				
			}//end while
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
			return list;
	}//selectAllLocation
	
	public List<String> selectAllLocation() throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DbConnection db= DbConnection.getInstance();
		
		List<String> list=new ArrayList<String>(); 
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    SELECT distinct ralo     ")
			.append("    from restarea     ");
			
			pstmt=con.prepareStatement(Query.toString());
			
			rs=pstmt.executeQuery();
			String ralo=null;
			while(rs.next()) {
				ralo=rs.getString("ralo");
				list.add(ralo);
				
			}//end while
				
		} finally {
			db.dbClose(rs, pstmt, con);
		}
			return list;
	}//selectAllLocation

	public int insertCS( String id, AdminCSVO mcVO ) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		AdminCSVO cVO=mcVO;
		DbConnection db= DbConnection.getInstance();
		int cnt=0;
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    insert into customerservice(userid,csno,cstype,rano,csdate,cstext)     ")
			.append("    values (?,(select max(csno)+1 from customerservice where userid=?),? ,?,sysdate,? )    ");
			 		
			pstmt=con.prepareStatement(Query.toString());
			String cstype=cVO.getCsType();
			String rano=cVO.getRaNO();
			String cstext=cVO.getCsText();
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, cstype);
			pstmt.setString(4, rano);
			pstmt.setString(5, cstext);
			
			cnt=pstmt.executeUpdate();
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
			return cnt;
	}//insertCS

}
