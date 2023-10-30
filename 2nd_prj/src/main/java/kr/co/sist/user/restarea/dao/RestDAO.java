package kr.co.sist.user.restarea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.user.restarea.vo.BrandVO;
import kr.co.sist.user.restarea.vo.ConvVO;
import kr.co.sist.user.restarea.vo.FoodVO;
import kr.co.sist.user.restarea.vo.GasTypeVO;
import kr.co.sist.user.restarea.vo.GasVO;
import project_second.DbConnection;

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
			.append("	select fno, fname, fimage, fdetail, fprice	")
			.append("	from food									")
			.append("	where rano=?								");
			
			pstmt=con.prepareStatement(selectFood.toString());
			
			pstmt.setString(1, raNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				fVO = new FoodVO(rs.getString("fno"), rs.getString("fname"), rs.getString("fimage"),rs.getString("fdetail"),rs.getInt("fprice"));
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
			.append("	select cname, ctel, cdetail, ino, cno			")
			.append("	from convinient									")
			.append("	where rano=?								");
			
			pstmt=con.prepareStatement(selectConv.toString());
			
			pstmt.setString(1, raNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cVO = new ConvVO(rs.getString("cname"), rs.getString("ctel"), rs.getString("cdetail"),rs.getString("ino"),rs.getInt("cno"));
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
			.append("	select bname, btel, bhome,ino, bno			")
			.append("	from brand									")
			.append("	where rano=?								");
			
			pstmt=con.prepareStatement(selectBrand.toString());
			
			pstmt.setString(1, raNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bVO = new BrandVO(rs.getString("bname"), rs.getString("btel"), rs.getString("bhome"),rs.getString("ino"),rs.getInt("bno"));
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
