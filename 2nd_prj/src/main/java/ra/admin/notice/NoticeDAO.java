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

	/**
	 * 전체 공지사항 메소드
	 * @return 전체 공지사항 List
	 * @throws SQLException
	 */
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
	
	/**
	 * 선택한 공지사항 조회
	 * @param nno
	 * @return 선택한 공지사항 VO
	 * @throws SQLException
	 */
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
			}//end if
		} finally {
			db.dbClose(rs, pstmt, con);
		}//finally
		return nVO;
	}//selectNotice
	
	/**
	 * 공지사항 글쓰기 insert
	 * @param nVO
	 * @return insert 성공여부 반환 (-1은 실패)
	 * @throws SQLException
	 */
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
	
	/**
	 * 글쓰기 했을때 자동으로 공지사항 번호 조회후 번호 반환
	 * @return
	 * @throws SQLException
	 */
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
	}//selectNnoMax
	
	/**
	 * 수정한 공지사항 업데이트 메소드
	 * @param nVO
	 * @return
	 */
	public int updateNotice(NoticeVO nVO) throws SQLException {
		int flag = 0;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder updateNotice = new StringBuilder();
			updateNotice
			.append("	update notice	")
			.append("	set    EMPNO = ?, NDATE = sysdate, NTITLE = ?, NCONTENT = ?	")
			.append("	where  nno = ?	");
			
			pstmt = con.prepareStatement(updateNotice.toString());
			
			pstmt.setString(1, nVO.getEmpno());
			pstmt.setString(2, nVO.getNtitle());
			pstmt.setString(3, nVO.getNcontent());
			pstmt.setInt(4, nVO.getNno());
			
			flag = pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}//finally
		return flag;
	}//updateNotice
	
	public int deleteNotice(int nno) throws SQLException {
		int flag = 0;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String deleteNotice = "delete from notice where nno = ? ";
			
			pstmt = con.prepareStatement(deleteNotice);
			
			pstmt.setInt(1, nno);
			
			flag = pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}//finally
		return flag;
	}//updateNotice
	
	
	
	
	
	
}//class
