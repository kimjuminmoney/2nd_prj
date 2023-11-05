package ra.user.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;


public class SearchDAO {
	private static SearchDAO raDAO;

	private SearchDAO() {

	}//RestAreaDAO

	public static SearchDAO getInstance() {
		if (raDAO == null) {
			raDAO = new SearchDAO();
		}//end if
		return raDAO;
	}//getInstance

	public List<SearchVO> selectra(String RAName) throws SQLException {

		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SearchVO> list = new ArrayList<SearchVO>();
		SearchVO raVO = null;
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder sb = new StringBuilder();
			sb
			.append("	select RANAME, RAADDR, RAX, RAY	, RANO	")
			.append("	from RESTAREA							")
			.append("	where raname like ?						");
			
			pstmt = con.prepareStatement(sb.toString());
			//System.out.println(RAName);
			
			pstmt.setString(1, RAName+"(%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				raVO = new SearchVO(rs.getString("raname"),rs.getString("raaddr"), rs.getString("ray"), rs.getString("rax"), rs.getString("rano"));
				list.add(raVO);
			}//end while
		} finally {
			db.dbClose(rs, pstmt, con);
		}//finally

		return list;

	}//selectra

}//class
