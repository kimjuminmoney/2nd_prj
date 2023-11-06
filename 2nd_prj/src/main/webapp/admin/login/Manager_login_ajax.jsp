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
//DataEncrypt de=new DataEncrypt("a12345678901234567");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id);
System.out.println(pw);

ManagerLoginVO mlVO = new ManagerLoginVO();

mlVO.setEMPNO(id);
mlVO.setEPW(DataEncrypt.messageDigest("MD5",pw));
ManagerLoginDAO mlDAO = ManagerLoginDAO.getInstance();
try{
	ManagerDataVO  mdVO = mlDAO.selectLogin(mlVO);
	if(mdVO != null){
		session.setAttribute("sesNo",mlVO.getEMPNO());
		session.setAttribute("managerData", mdVO.getENAME());
		response.sendRedirect("../dashboard/index.jsp");
	}
} catch (SQLException se){
	se.printStackTrace();
}
JSONObject json = new JSONObject();
json.put("flag", false);

out.print(json.toJSONString());
%>

