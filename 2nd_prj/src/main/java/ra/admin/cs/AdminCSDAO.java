package ra.admin.cs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;

public class AdminCSDAO {

	private static AdminCSDAO mcDAO;
	private AdminCSDAO() {
		
	}
	public static AdminCSDAO getInstance() {
		if(mcDAO ==null) {
			mcDAO=new AdminCSDAO();
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
	
	
	public List<AdminCSVO> selectAllCS() throws SQLException {
		
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
			.append("    )    ");
			
			
			pstmt=con.prepareStatement(Query.toString());
			
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
	
	public AdminCSVO selectOneCS( String userid, int csNO ) throws SQLException {
		
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
			pstmt.setString(1, userid);
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
	
	public int modifyCS(AdminCSVO acsVO) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db= DbConnection.getInstance();
		AdminCSVO aVO = acsVO;
		
		int cnt=0;
		try {
			
			con= db.getConn("jdbc/dbcp");
			StringBuilder Query = new StringBuilder();
			Query.append("    update customerservice     ")
			.append("    set empno=?, csAnswer=?, csadate=sysdate     ")
			.append("    where userid=? and csNo=?    ");
			
			pstmt=con.prepareStatement(Query.toString());
			
			pstmt.setString(1, aVO.getEmpno());
			pstmt.setString(2, aVO.getCsAnswer());
			pstmt.setString(3, aVO.getUserId());
			pstmt.setInt(4, aVO.getCsNO());
			
			cnt=pstmt.executeUpdate();
		} finally {
			db.dbClose(null, pstmt, con);
		}
		return cnt;
	}//ModifyInfo


}//class
