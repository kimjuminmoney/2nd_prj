package ra.data_input.food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;


public class FoodInputDAO {
	private static FoodInputDAO dDAO;
	
	private FoodInputDAO() {
		
	}//DataInputDAO
	
	public static FoodInputDAO getInstance() {
		if(dDAO == null) {
			dDAO = new FoodInputDAO();
		}//end if
		return dDAO;
	}//getInstance

	public List<FoodInputVO> selectRano () throws SQLException {
		List<FoodInputVO> list = new ArrayList<FoodInputVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = db.getConn("jdbc/dbcp");
			String sb = " select  LPAD(rano, 6, '0') rano, raname from restarea  order by rano ";
			
			pstmt = con.prepareStatement(sb);
			
			
			rs = pstmt.executeQuery();
			
			FoodInputVO dVO = null;
			while(rs.next()) {
				dVO = new FoodInputVO();
				dVO.setRano(rs.getString("rano"));
				dVO.setRaname(rs.getString("raname"));
				list.add(dVO);
				
			}//end while
		} finally {
			db.dbClose(rs, pstmt, con);
		}//finally
		
		return list;
	}
	
	public int selectFno () throws SQLException {
		int max = 0;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = db.getConn("jdbc/dbcp");
			String sb = " select  max(fno) fno from food  ";
			
			pstmt = con.prepareStatement(sb);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				max = rs.getInt("fno");
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}//finally
		
		return max;
	}
	
	
	
	public int insertFood(FoodInputVO dVO) throws SQLException {
		int cnt = 0;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder sb = new StringBuilder();
			sb
			.append("	insert into food2(FNO, RANO, FNAME,  FPRICE, FDETAIL, FDATE)	")
			.append("	values( ?,?,?,?,?,?)	");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(1, dVO.getFno());
			pstmt.setString(2, dVO.getRano());
			pstmt.setString(3, dVO.getFname());
			pstmt.setInt(4, dVO.getFprice());
			pstmt.setString(5, dVO.getFdetail());
			pstmt.setDate(6, dVO.getSqlDate());
			
			cnt = pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}//finally
		return cnt;
	}//insertFood
	
}//class
