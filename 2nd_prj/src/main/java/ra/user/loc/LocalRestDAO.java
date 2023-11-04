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
	
	
	//지역별 지도 선택 시 중심(시청/도청으로 이동)
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
			.append("	select RANAME, RAADDR, RALO, RAX, RAY	")
			.append("	from RESTAREA					")
			.append("	where RALO = ?					");
			pstmt=con.prepareStatement(sb.toString());
			
			pstmt.setString(1, LocalName);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			lsVO = new LocalSearchVO();
			lsVO.setRaname(rs.getString("raname"));
			lsVO.setRaaddr(rs.getString("raaddr"));
			lsVO.setRalo(rs.getString("ralo"));
			lsVO.setX(rs.getString("rax"));
			lsVO.setY(rs.getString("ray"));
			
			
			
			list.add(lsVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		
		return list;
		
	}
	
	//각 지역별 휴게소 마크업
	public List<RestSearchVO> selectRest(String local) throws SQLException{
		List<RestSearchVO> list = new ArrayList<RestSearchVO>();
		RestSearchVO rsVO = null;
		
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");
			
			StringBuilder sb = new StringBuilder();
			
			sb
			.append("	SELECT RALO, RANAME, RAADDR, RAX, RAY		")
			.append("	FROM RESTAREA								")
			.append("	where ralo = ?		");
			pstmt=con.prepareStatement(sb.toString());
			
			pstmt.setString(1, local);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			rsVO = new RestSearchVO(rs.getString("RALO"),rs.getString("RANAME"),rs.getString("RAADDR"),
									rs.getInt("RAX"), rs.getInt("RAY"));
			
			list.add(rsVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		
		return list;
		
	}
	
} //class
