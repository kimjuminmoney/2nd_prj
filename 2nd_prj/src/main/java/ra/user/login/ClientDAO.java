package ra.user.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import project_VO.Client_joinVO;


public class ClientDAO {
	private static ClientDAO cDAO;
	private  ClientDAO() {
		
	}
	
	public static ClientDAO getInstance() {
		if(cDAO==null) {
			cDAO = new ClientDAO();
		}
		return cDAO;
	}
	public boolean selectId(String USERID)throws SQLException{
		boolean resultId =false;
		
		DbConnection db = DbConnection.getInstance();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		try {
			//1. JNDI사용객체 생성
			//2. DataSource얻기
			//3. Connection 얻기
				con=db.getConn("jdbc/dbcp");
			//4.퀄이문 생성 객체 얻기
				String selectId = "select userid from USERINFO where USERID = ? ";
				pstmt = con.prepareStatement(selectId);
			//5.바인드 변수에 값 설정
				pstmt.setString(1, USERID);
			//6. 쿼리문 수행 후 결과 얻기
				rs=pstmt.executeQuery();
				
				resultId=rs.next(); //조회 결과가 있으면 true/없으면 false
			}finally {
				//7.연결 끊기
				db.dbClose(rs, pstmt, con);
		}
		return resultId;
	}
	
	public void insertMember(Client_joinVO cjVO)throws SQLException{
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt=null;
		
		try {
			//1.JNDI 사용객체 생성
			//2.DataSource 얻기
			//3.Connection 얻기
				con=db.getConn("jdbc/dbcp");
			//4.쿼리문 생성객체 얻기
				
				StringBuilder insertUSERINFO = new StringBuilder();
				insertUSERINFO
				.append("insert into USERINFO")
				.append("(USERID, UPW,  UNAME, unic, UTEL, UEMAIL,ujoin)")
				.append("values(?,?,?,?,?,?,sysdate)");
				pstmt = con.prepareStatement( insertUSERINFO.toString() );
				
				//5.바인드 변수 값 설정
				System.out.print(cjVO.getUTEL());
				pstmt.setString(1, cjVO.getUSERID());
				pstmt.setString(2, cjVO.getUPW());
				pstmt.setString(3, cjVO.getUNAME());
				pstmt.setString(4, cjVO.getUNICK());
				pstmt.setString(5, cjVO.getUTEL());
				pstmt.setString(6, cjVO.getEmail());
				//6.쿼리 수행 후 결과 얻기
				pstmt.executeUpdate();
			}finally {
			//7.연결 끊기
				db.dbClose(null, pstmt, con);
			}
	}
	

}
