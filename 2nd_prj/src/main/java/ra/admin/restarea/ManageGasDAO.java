package ra.admin.restarea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import ra.util.DbConnection;

public class ManageGasDAO {

	private static ManageGasDAO mgDAO;

	private ManageGasDAO() {

	}// ManageGasDAO

	public static ManageGasDAO getInstance() {
		if (mgDAO == null) {
			mgDAO = new ManageGasDAO();
		} // end if
		return mgDAO;
	}// getInstance

	public boolean insertGasStation(ManageGasVO mgVO) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection db = DbConnection.getInstance();

		try {

			con = db.getConn("jdbc/dbcp");

			StringBuilder insertGas = new StringBuilder();

			insertGas.append("	insert into gasstation(rano, gname, gbrand, gdatail)	")
					 .append("	values(?,?,?,?)											");

			pstmt = con.prepareStatement(insertGas.toString());

			pstmt.setString(1, mgVO.getRestAreaNum());
			pstmt.setString(2, mgVO.getGasName());
			pstmt.setString(3, mgVO.getGasBrand());
			pstmt.setString(4, mgVO.getGasDetail());

			boolean flag = pstmt.execute();

			return flag;
		} finally {
			db.dbClose(null, pstmt, con);
		} // finally

	}// insertGasStation
	
	public boolean insertGasType(ManageGasVO mgVO) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder insertGas = new StringBuilder();
			
			insertGas.append("	insert into gasstation(gtname, rano, grprice, gtdate)	")
			.append("	values(?,?,?,sysdate)											");
			
			pstmt = con.prepareStatement(insertGas.toString());
			
			pstmt.setString(1, mgVO.getGasType());
			pstmt.setString(2, mgVO.getRestAreaNum());
			pstmt.setInt(3, mgVO.getGasPrice());
			
			boolean flag = pstmt.execute();
			
			return flag;
		} finally {
			db.dbClose(null, pstmt, con);
		} // finally
		
	}// insertGasType

	public int updateGasStation(ManageGasVO mgVO) throws SQLException {
		int rowCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder updateGas = new StringBuilder();
			updateGas
			.append("	update gasstation					")
			.append("	set gname=?, gbrand=?, gdetail=?	")
			.append("	where rano=?						");
			
			pstmt = con.prepareStatement(updateGas.toString());
			
			pstmt.setString(1, mgVO.getGasName());
			pstmt.setString(2, mgVO.getGasBrand());
			pstmt.setString(3, mgVO.getGasDetail());
			pstmt.setString(4, mgVO.getRestAreaNum());
			
			rowCnt = pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
		}//end finally
		return rowCnt;
	}//updateGasStation
	
	public int updateGasType(ManageGasVO mgVO) throws SQLException {
		int rowCnt = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder updateGas = new StringBuilder();
			updateGas
			.append("	update gastype							")
			.append("	set gtprice=?, gtdate=sysdate			")
			.append("	where rano=? and gtname=?				");
			
			pstmt = con.prepareStatement(updateGas.toString());
			
			pstmt.setInt(1, mgVO.getGasPrice());
			pstmt.setString(2, mgVO.getRestAreaNum());
			pstmt.setString(3, mgVO.getGasType());
			
			rowCnt = pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
		}//end finally
		return rowCnt;
	}//updateGasType
	
}//class
