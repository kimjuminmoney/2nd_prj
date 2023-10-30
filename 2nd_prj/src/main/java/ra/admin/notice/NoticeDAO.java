package ra.admin.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import prj.DbConnection;

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
			.append("	where n.empno = e.empno														");
			
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
	
	
	
	
	
	
}//class
