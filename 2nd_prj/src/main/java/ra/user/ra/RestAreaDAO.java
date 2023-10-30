package ra.user.ra;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kjm.prj.DbConnection;

public class RestAreaDAO {
	private static RestAreaDAO raDAO;

	private RestAreaDAO() {

	}//RestAreaDAO

	public static RestAreaDAO getInstance() {
		if (raDAO == null) {
			raDAO = new RestAreaDAO();
		}//end if
		return raDAO;
	}//getInstance

	public List<RestAreaVO> selectra(String RAName) throws SQLException {

		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<RestAreaVO> list = new ArrayList<RestAreaVO>();
		RestAreaVO raVO = null;
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select RANAME, RAADDR, RAX, RAY	, RANO	")
			.append("	from RESTAREA							")
			.append("	where raname like ?						");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, RAName+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				raVO = new RestAreaVO(rs.getString("raname"),rs.getString("raaddr"), rs.getString("ray"), rs.getString("rax"), rs.getString("rano"));
				list.add(raVO);
			}//end while
		} finally {
			db.dbClose(rs, pstmt, con);
		}//finally

		return list;

	}//selectra

}//class
