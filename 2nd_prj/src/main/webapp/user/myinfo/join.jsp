<%@page import="ra.util.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 

DataEncrypt de = new DataEncrypt("a12345678901234567");


Connection con = null;
PreparedStatement pstmt = null;
DbConnection db= DbConnection.getInstance();
	con= db.getConn("jdbc/dbcp");
try {
	
		String id= "test3";
		String pw=DataEncrypt.messageDigest("MD5", "test");
		String name=de.encryption("test");
		String nic="test";
		String tel=de.encryption("010-1234-5678");
		String mail=de.encryption("test@gmail.com");
		
		StringBuilder sb= new StringBuilder();
		sb.append("    insert into userinfo(USERID, UPW, UNAME, UNIC, UTEL, UEMAIL, UJOIN) values ( ?,?,?,?,?,?,sysdate)     "); 
		
		pstmt = con.prepareStatement( sb.toString() );
		
		//5.바인드 변수 값 설정
		pstmt.setString(1, id );
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, nic);
		pstmt.setString(5, tel);
		pstmt.setString(6, mail);
		
		//6.쿼리 수행 후 결과 얻기

		pstmt.execute();
}finally {
	//7.연결 끊기
		db.dbClose(null, pstmt, con);
	}





%>