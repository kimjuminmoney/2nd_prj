package ra.admin.restarea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ra.user.restarea.BrandVO;
import ra.user.restarea.ConvVO;
import ra.user.restarea.FoodVO;
import ra.user.restarea.GasTypeVO;
import ra.user.restarea.GasVO;
import ra.user.restarea.RestAreaVO;
import ra.util.DbConnection;

public class RestDAO {
	
	private static RestDAO rDAO;
	
	private RestDAO() {
		
	}//RestDAO
	
	public static RestDAO getInstance() {
		if(rDAO == null) {
			rDAO = new RestDAO();
		}//end if
		return rDAO;
	}//getInstance
	
	public RestAreaVO selectRestArea(String raNo) throws SQLException {
		RestAreaVO raVO = null;
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
		con = db.getConn("jdbc/dbcp");
		
		String selectRestArea = "select rano, hno, raname, direction, raaddr, ratel, ralo from RESTAREA where rano=?";
		
		pstmt = con.prepareStatement(selectRestArea);
		
		pstmt.setString(1, raNo);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			raVO = new RestAreaVO(rs.getString("rano"), rs.getString("hno"), rs.getString("raname"), rs.getString("direction"), 
					rs.getString("raaddr"), rs.getString("ratel"), rs.getString("ralo"));
		}
		
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return raVO;
	}
	
	public List<String> selectRestAreaName() throws SQLException{
		List<String> raList = new ArrayList<String>();
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = db.getConn("jdbc/dbcp");
			
			String selectFood = "select raname from restarea	";
			
			pstmt=con.prepareStatement(selectFood.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				raList.add(rs.getString("raname"));
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return raList;
	}
	
	public String selectRestAreaNum(String raname) throws SQLException {
		String restareaNum = "";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			String selectRestareaNum = "select rano from restarea where raname=?";
			
			pstmt = con.prepareStatement(selectRestareaNum);
			
			pstmt.setString(1, raname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				restareaNum = rs.getString("rano");
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return restareaNum;
	}//selectrestareaNum
	
	
	public List<FoodVO> selectFood(String raNo) throws SQLException{
		FoodVO fVO;
		
		List<FoodVO> foodlist = new ArrayList<FoodVO>();
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectFood = new StringBuilder();
			selectFood
			.append("	select fno, fname, fimage, fdetail, to_char(fprice,'9,999,999') fpr	")
			.append("	from food									")
			.append("	where rano=?								");
			
			pstmt=con.prepareStatement(selectFood.toString());
			
			pstmt.setString(1, raNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				fVO = new FoodVO(rs.getString("fno"), rs.getString("fname"), rs.getString("fimage"),rs.getString("fdetail"),rs.getString("fpr"));
				foodlist.add(fVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return foodlist;
	}//selectFood
	
	public List<ConvVO> selectConv(String raNo) throws SQLException{
		ConvVO cVO;
		
		List<ConvVO> convlist = new ArrayList<ConvVO>();
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectConv = new StringBuilder();
			selectConv
			.append("	select cname, cdetail, ino, cno			")
			.append("	from convinient									")
			.append("	where rano=?								");
			
			pstmt=con.prepareStatement(selectConv.toString());
			
			pstmt.setString(1, raNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cVO = new ConvVO(rs.getString("cname"), rs.getString("cdetail"),rs.getString("ino"),rs.getInt("cno"));
				convlist.add(cVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return convlist;
	}//selectConv

	public List<BrandVO> selectBrand(String raNo) throws SQLException{
		BrandVO bVO;
		
		List<BrandVO> brandlist = new ArrayList<BrandVO>();
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectBrand = new StringBuilder();
			selectBrand
			.append("	select bname, bdetail, bino, bno			")
			.append("	from brand									")
			.append("	where rano=?								");
			
			pstmt=con.prepareStatement(selectBrand.toString());
			
			pstmt.setString(1, raNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bVO = new BrandVO(rs.getString("bname"), rs.getString("bdetail"),rs.getString("bino"),rs.getInt("bno"));
				brandlist.add(bVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return brandlist;
	}//selectBrand

	public List<GasVO> selectGas(String raNo) throws SQLException{
		GasVO gVO;
		
		List<GasVO> gaslist = new ArrayList<GasVO>();
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectBrand = new StringBuilder();
			selectBrand
			.append("	select gname, gbrand, gdetail				")
			.append("	from gasstation									")
			.append("	where rano=?								");
			
			pstmt=con.prepareStatement(selectBrand.toString());
			
			pstmt.setString(1, raNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				gVO = new GasVO(rs.getString("gname"), rs.getString("gbrand"), rs.getString("gdetail"));
				gaslist.add(gVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return gaslist;
	}//selectBrand
	
	public List<GasTypeVO> selectGasType(String raNo) throws SQLException{
		GasTypeVO gtVO;
		
		List<GasTypeVO> gaslist = new ArrayList<GasTypeVO>();
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectBrand = new StringBuilder();
			selectBrand
			.append("	select gtname, gtprice, gtdate				")
			.append("	from gastype								")
			.append("	where rano=?								");
			
			pstmt=con.prepareStatement(selectBrand.toString());
			
			pstmt.setString(1, raNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				gtVO = new GasTypeVO(rs.getString("gtname"), rs.getInt("gtprice"), rs.getDate("gtdate"));
				gaslist.add(gtVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return gaslist;
	}//selectBrand
	
}//class
