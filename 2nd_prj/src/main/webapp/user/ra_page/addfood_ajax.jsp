<%@page import="ra.admin.restarea.ManageBrandVO"%>
<%@page import="ra.admin.restarea.ManageBrandDAO"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>

<%
ManageBrandDAO mfDAO = ManageBrandDAO.getInstance();
ManageBrandVO mfVO = new ManageBrandVO();

String foodData = request.getParameter("foodData");
String[] fdArray = foodData.split("/");

String rastr = fdArray[1].replace("0", "");

mfVO.setRestAreaNum(rastr);
mfVO.setBrandName(fdArray[0]);

String fDetail=fdArray[2];
if(fDetail.equals("null")){
	fDetail = null;
}
mfVO.setBrandHome(fDetail);

mfDAO.insertBrand(mfVO);
%>