package ra.user.loc;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;



public class LocalRestDAO {
	private static LocalRestDAO lrDAO;
	
	private LocalRestDAO() {
		
		
	} //LocalRestDAO
	
	
	public static LocalRestDAO getInstance() {
		if(lrDAO == null) {
			lrDAO = new LocalRestDAO();
		} //end if
		
		return lrDAO;
		
	} //getInstance
	
	
	public List<LocalSearchVO> selectLoc(String LocalName) throws SQLException{
		LocalSearchVO lsVO = null;

		List<LocalSearchVO> list = new ArrayList<LocalSearchVO>();
		
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");
			
			StringBuilder sb = new StringBuilder();

			sb
			.append("	select RANAME, RALO, RAX, RAY	")
			.append("	from RESTAREA					")
			.append("	where RALO = ?					");
			pstmt=con.prepareStatement(sb.toString());
			
			pstmt.setString(1, LocalName);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			lsVO = new LocalSearchVO(rs.getString("raNAme"),rs.getString("raX"),rs.getString("raY"));
			
			list.add(lsVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		
		return list;
		
	}
	
	public List<LocalSearchVO> selectLocaionRest(String localName) throws SQLException{
		List<LocalSearchVO> list = new ArrayList<LocalSearchVO>();
		LocalSearchVO lsVO = null;
		
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");
			
			StringBuilder sb = new StringBuilder();

			sb
			.append("	select RANAME, RAX, RAY	")
			.append("	from RESTAREA					")
			.append("	where RALO = ?					");
			pstmt=con.prepareStatement(sb.toString());
			
			pstmt.setString(1, localName);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			lsVO = new LocalSearchVO(rs.getString("raNAme"),rs.getString("raX"),rs.getString("raY"));
			
			list.add(lsVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		
		return list;
		
	}
	
} //class
