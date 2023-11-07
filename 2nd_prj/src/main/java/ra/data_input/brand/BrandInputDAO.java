package ra.data_input.brand;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;


public class BrandInputDAO {
	private static BrandInputDAO dDAO;
	
	private BrandInputDAO() {
		
	}//DataInputDAO
	
	public static BrandInputDAO getInstance() {
		if(dDAO == null) {
			dDAO = new BrandInputDAO();
		}//end if
		return dDAO;
	}//getInstance

	public List<BrandInputVO> selectRano () throws SQLException {
		List<BrandInputVO> list = new ArrayList<BrandInputVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = db.getConn("jdbc/dbcp");
			String sb = " select   LPAD(rano, 6, '0') rano, raname from restarea  order by rano ";
			
			pstmt = con.prepareStatement(sb);
			
			rs = pstmt.executeQuery();
			
			BrandInputVO dVO = null;
			while(rs.next()) {
				dVO = new BrandInputVO();
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
	
	
	
	public int insertBrand(BrandInputVO biVO) throws SQLException {
		int cnt = 0;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder sb = new StringBuilder();
			sb
			.append("	insert into BRAND(RANO, BNO, BINO, BNAME, BDATE, BDETAIL)	")
			.append("	values( ?, ?, ?, ?, ?, ?  )	");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, biVO.getRano());
			pstmt.setInt(2, biVO.getBno());
			pstmt.setString(3, biVO.getBino());
			pstmt.setString(4, biVO.getBname());
			pstmt.setDate(5, biVO.getSqlDate());
			pstmt.setString(6, biVO.getBdetail());
			
			cnt = pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}//finally
		return cnt;
	}//insertConvi
	
}//class
