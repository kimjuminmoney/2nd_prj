package ra.data_input.convi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;


public class ConviInputDAO {
	private static ConviInputDAO dDAO;
	
	private ConviInputDAO() {
		
	}//DataInputDAO
	
	public static ConviInputDAO getInstance() {
		if(dDAO == null) {
			dDAO = new ConviInputDAO();
		}//end if
		return dDAO;
	}//getInstance

	public List<ConviInputVO> selectRano () throws SQLException {
		List<ConviInputVO> list = new ArrayList<ConviInputVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = db.getConn("jdbc/dbcp");
			String sb = " select   LPAD(rano, 6, '0') rano, raname from restarea  order by rano ";
			
			pstmt = con.prepareStatement(sb);
			
			rs = pstmt.executeQuery();
			
			ConviInputVO dVO = null;
			while(rs.next()) {
				dVO = new ConviInputVO();
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
	
	
	
	public int insertConvi(ConviInputVO ciVO) throws SQLException {
		int cnt = 0;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder sb = new StringBuilder();
			sb
			.append("	insert into CONVINIENT (RANO, CNO, CNAME, CDETAIL, CDATE, INO)")
			.append("	values(?,?,?,?,?,? )	");
			
			
			
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, ciVO.getRano());
			pstmt.setInt(2, ciVO.getCno());
			pstmt.setString(3, ciVO.getCname());
			pstmt.setString(4, ciVO.getCdetail());
			pstmt.setDate(5, ciVO.getSqlDate());
			pstmt.setInt(6, ciVO.getIno());
			
			
			cnt = pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}//finally
		return cnt;
	}//insertConvi
	
}//class
