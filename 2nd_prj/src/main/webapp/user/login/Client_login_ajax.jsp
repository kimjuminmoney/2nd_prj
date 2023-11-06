<%@page import="ra.user.login.ClientDataVO"%>
<%@page import="ra.user.login.ClientLoginDAO"%>
<%@page import="ra.user.login.ClientLoginVO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%
if("GET".equals(request.getMethod().toUpperCase())){
	response.sendRedirect("Clientr_login.jsp");
	return;
}

String id = request.getParameter("id");
String pw = request.getParameter("pw");

ClientLoginVO clVO = new ClientLoginVO();

clVO.setUSERID(id);
clVO.setUPW(DataEncrypt.messageDigest("MD5",pw));
ClientLoginDAO clDAO = ClientLoginDAO.getInstance();
JSONObject json = new JSONObject();
boolean flag = false;
try{
	ClientDataVO  cdVO = clDAO.selectLogin(clVO);
	if(cdVO != null){
		flag = true;
		session.setAttribute("sesId",clVO.getUSERID());
		session.setAttribute("managerData", cdVO.getUname());
		json.put("flag", flag);
		//return;
	}
} catch (SQLException se){
	se.printStackTrace();
}

json.put("flag", flag);

out.print(json.toJSONString());
%>

