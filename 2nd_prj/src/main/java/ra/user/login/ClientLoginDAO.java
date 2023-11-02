package ra.user.login;

import java.io.BufferedReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import project_VO.ClientDataVO;
import project_VO.ClientLoginVO;
import project_VO.Client_joinVO;
import ra.util.DbConnection;

public class ClientLoginDAO{
	private static ClientLoginDAO clDAO;
	private ClientLoginDAO() {
	
}
	public static ClientLoginDAO getInstance() {
		if(clDAO == null ) {
			clDAO=new ClientLoginDAO();
		}
		return clDAO;
	}
	
	
	public ClientDataVO selectLogin( ClientLoginVO clVO) throws SQLException{
		ClientDataVO cdVO=null;
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
			String selectClient = "select uname, uemail from USERINFO where USERID=? and UPW=?";
			pstmt=con.prepareStatement(selectClient);
			
			//5.바인드변수 값 설정
			pstmt.setString(1, clVO.getUSERID());
			pstmt.setString(2, clVO.getUPW());
			//6.쿼리문 실행 후 결과 얻기
			rs=pstmt.executeQuery();
			System.out.println( "------" +clVO );
			if(rs.next()) {
				cdVO = new ClientDataVO(rs.getString("uname"),rs.getString("uemail"));				
			}
		}finally {
			//7.연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		return cdVO;
	}
   
}//class








