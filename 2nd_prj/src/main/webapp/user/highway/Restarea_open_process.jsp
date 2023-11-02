<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ra.user.highway.RestareaVO"%>
<%@page import="java.util.List"%>
<%@page import="ra.user.highway.HighwayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

String hNo=request.getParameter("hNo");

HighwayDAO hDAO=HighwayDAO.getInstance();

List<RestareaVO> raVOList=hDAO.selectRA(hNo);

JSONObject jsonObj=null;
JSONArray jsonArr=new JSONArray();

for(RestareaVO raVO : raVOList ){
	jsonObj=new JSONObject();
	
	jsonObj.put("raNo",raVO.getRaNo());
	jsonObj.put("raName",raVO.getRaName());
	jsonObj.put("raX",raVO.getRaX());
	jsonObj.put("raY",raVO.getRaY());
	System.out.println(jsonObj.toString());
	jsonArr.add(jsonObj);
}
out.print(jsonArr.toJSONString());

%>