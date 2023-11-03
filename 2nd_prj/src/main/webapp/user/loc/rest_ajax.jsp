<%@page import="ra.user.loc.LatLngVO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="ra.user.loc.LocalRestDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ra.user.loc.RestSearchVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 페이지 지시자 설정 --%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%

String rest=request.getParameter("rest");

LocalRestDAO lrDAO=LocalRestDAO.getInstance();

List<RestSearchVO> rsVOList=lrDAO.selectRest(rest);

JSONObject jsonObj=null;
JSONArray jsonArr=new JSONArray();

for(RestSearchVO rsVO : rsVOList ){
	jsonObj=new JSONObject();
	
	jsonObj.put("restName",rsVO.getRestName());
	jsonObj.put("addr",rsVO.getAddr());
	jsonObj.put("local",rsVO.getLocal());
	jsonObj.put("x",rsVO.getX());
	jsonObj.put("y",rsVO.getY());
	System.out.println(jsonObj.toString());
	jsonArr.add(jsonObj);
}
out.print(jsonArr.toJSONString());

%>