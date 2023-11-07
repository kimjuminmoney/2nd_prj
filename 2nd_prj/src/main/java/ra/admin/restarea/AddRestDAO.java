package ra.admin.restarea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;

public class AddRestDAO {

	private static AddRestDAO arDAO;

	private AddRestDAO() {

	}// AddRestDAO

	public static AddRestDAO getInstance() {
		if (arDAO == null) {
			arDAO = new AddRestDAO();
		} // end if
		return arDAO;
	}// getInstance

	public boolean insertRestArea(AddRestVO arVO) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");

			StringBuilder insertRA = new StringBuilder();

			insertRA.append("	insert into restarea(rano, hno, raname, direction, raaddr, ratel, ralo, rax, ray)	")
					 .append("	values((select max(to_number(rano))+1 from restarea),?,?,?,?,?,?,?,?)							");

			pstmt = con.prepareStatement(insertRA.toString());

			pstmt.setString(1, arVO.getHighWayNum());
			pstmt.setString(2, arVO.getRestAreaName());
			pstmt.setString(3, arVO.getDirection());
			pstmt.setString(4, arVO.getAddress());
			pstmt.setString(5, arVO.getTel());
			pstmt.setString(6, arVO.getLocation());
			pstmt.setString(7, arVO.getRax());
			pstmt.setString(8, arVO.getRay());

			boolean flag = pstmt.execute();
			
			return flag;
		} finally {
			db.dbClose(null, pstmt, con);
		} // finally

	}// insertRestAreaStation
	
	public String selectLastRano() throws SQLException {
		String lastRano = "";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			String selectLastRano = "select LPAD(max(to_number(rano))+1, 6, '0') rano from restarea";
			
			pstmt = con.prepareStatement(selectLastRano);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				lastRano = rs.getString("rano");
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		return lastRano;
	}//selectLastRano
	
	public List<String> selectHighwayName() throws SQLException {
		List<String> highwayName = new ArrayList<String>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			String selectHighwayName = "select hname from highway";
			
			pstmt = con.prepareStatement(selectHighwayName);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				highwayName.add(rs.getString("hname"));
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		return highwayName;
	}//selectHighwayName
	
	public int selectHighwayNum(String hname) throws SQLException {
		int highwayNum = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			String selectHighwayNum = "select hno from highway where hname=?";
			
			pstmt = con.prepareStatement(selectHighwayNum);
			
			pstmt.setString(1, hname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				highwayNum = rs.getInt("hno");
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return highwayNum;
	}//selectHighwayNum
	
}//class
