package ra.admin.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import ra.util.DbConnection;

public class ManagerLoginDAO{
	private static ManagerLoginDAO mlDAO;
	private ManagerLoginDAO() {
	
}
	public static ManagerLoginDAO getInstance() {
		if(mlDAO == null) {
			mlDAO= new ManagerLoginDAO();
		}
		return mlDAO;
	}
	
	public ManagerDataVO selectLogin( ManagerLoginVO mlVO) throws SQLException{
		ManagerDataVO mdVO=null;
		
		DbConnection db= DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			//1.JNDI사용객체 생성
			//2.DataSource얻기
			//3.Connection얻기
			con=db.getConn("jdbc/dbcp");
			//4.쿼리문 생성객체 얻기
			String selectManager="select empno, epw, ename from EMPLOYEE where EMPNO=? and EPW=?";
			pstmt=con.prepareStatement(selectManager);
			//5.바인드변수 값 설정
			pstmt.setString(1, mlVO.getEMPNO());
			pstmt.setString(2, mlVO.getEPW());
			//6.쿼리문 실행 후 결과 얻기
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mdVO= new ManagerDataVO(rs.getString("EMPNO"),rs.getString("ENAME"));
			}
		}finally {
			//7.연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		return mdVO;
	}
   
}//class








