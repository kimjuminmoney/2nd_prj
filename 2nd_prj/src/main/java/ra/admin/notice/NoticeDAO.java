package ra.admin.notice;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.util.DbConnection;


public class NoticeDAO {
	private static NoticeDAO nDAO;
	
	private NoticeDAO() {
		
	}//NoticeDAO
	
	public static NoticeDAO getInstance() {
		if(nDAO == null) {
			nDAO = new NoticeDAO();
		}//end if
		return nDAO;
	}//getInstance

	public List<NoticeVO> selectNotice() throws SQLException{
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder sb = new StringBuilder();
			sb
			.append(" 	select NNO, to_char(NDATE,'yyyy-mm-dd') NDATE , NTITLE, NCONTENT, ename ")
			.append("	from NOTICE n , employee e 												 ")
			.append("	where n.empno = e.empno													")
			.append("	order by nno desc															");
			
			
			pstmt = con.prepareStatement(sb.toString());
			
			
			
			rs = pstmt.executeQuery();
			
			NoticeVO nVO = null;

			while(rs.next()) {
				nVO = new NoticeVO();
				nVO.setNno(rs.getInt("NNO"));
				nVO.setInput_date(rs.getString("NDATE"));
				nVO.setNtitle(rs.getString("NTITLE"));
				nVO.setNcontent(rs.getString("NCONTENT"));
				nVO.setWriter(rs.getString("ename"));
				list.add(nVO);
			}//end while
		} finally {
			db.dbClose(rs, pstmt, con);
		}//finally
		
		return list;
	}//selectNotice
	
	
	
	
	public NoticeVO selectNoticeDetail(String nno) throws SQLException{
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeVO nVO = null;
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder sb = new StringBuilder();
			sb
			.append(" 	select NNO, to_char(NDATE,'yyyy-mm-dd') NDATE , NTITLE, NCONTENT, ename ")
			.append("	from NOTICE n , employee e 												 ")
			.append("	where n.empno = e.empno	and nno = ?											");
			
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, nno);
			
			
			rs = pstmt.executeQuery();
			
			
			
			if(rs.next()) {
				nVO = new NoticeVO();
				nVO.setNno(rs.getInt("NNO"));
				nVO.setInput_date(rs.getString("NDATE"));
				nVO.setNtitle(rs.getString("NTITLE"));
				nVO.setNcontent(rs.getString("NCONTENT"));
				nVO.setWriter(rs.getString("ename"));
			}//end while
		} finally {
			db.dbClose(rs, pstmt, con);
		}//finally
		
		return nVO;
	}//selectNotice
	
	
	
	public int insertNotice(NoticeVO nVO) throws SQLException{
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			con = db.getConn("jdbc/dbcp");
			String insertNotice = " 	insert into notice(nno, empno, ndate, ntitle, ncontent) values(?,?,sysdate,?,?)	";
			
			pstmt = con.prepareStatement(insertNotice);
			
			pstmt.setInt(1, nVO.getNno());
			pstmt.setString(2, nVO.getEmpno());
			pstmt.setString(3, nVO.getNtitle());
			pstmt.setString(4, nVO.getNcontent());
			
			flag = pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}//finally
		return flag;
	}//insertNotice
	
	public int selectNnoMax() throws SQLException {
		int max = 0;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeVO nVO = null;
		try {
			con = db.getConn("jdbc/dbcp");
			String selectMax = "select  max(nno) max from notice ";
			
			
			pstmt = con.prepareStatement(selectMax);
			
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				max = rs.getInt("max");
			}//end if
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}//finally
		
		return max;
		
	}
	
	
	
	
	
	
}//class
