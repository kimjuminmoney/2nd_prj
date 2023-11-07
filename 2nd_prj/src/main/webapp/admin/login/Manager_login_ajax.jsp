<%@page import="org.json.simple.JSONObject"%>
<%@page import="ra.admin.login.ManagerLoginVO"%>
<%@page import="ra.admin.login.ManagerDataVO"%>
<%@page import="ra.admin.login.ManagerLoginDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%
if("GET".equals(request.getMethod().toUpperCase())){
	response.sendRedirect("Manager_login.jsp");
	return;
}
%>


<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

ManagerLoginVO mlVO = new ManagerLoginVO();

mlVO.setEMPNO(id);
mlVO.setEPW(DataEncrypt.messageDigest("MD5",pw));
ManagerLoginDAO mlDAO = ManagerLoginDAO.getInstance();
JSONObject json = new JSONObject();
boolean flag = false;
try{
	ManagerDataVO  mdVO = mlDAO.selectLogin(mlVO);
	if(mdVO != null){
		flag = true;
		session.setAttribute("sesNo",mlVO.getEMPNO());
		session.setAttribute("managerData", mdVO.getENAME());
		json.put("flag", flag);
		//return;
	}
} catch (SQLException se){
	se.printStackTrace();
}

json.put("flag", flag);

out.print(json.toJSONString());
%>

