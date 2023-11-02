<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ra.user.cs.myCSDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%
myCSDAO mcDAO=myCSDAO.getInstance();

List<String> locList=mcDAO.selectAllLocation();//지역 가져오기
JSONObject jsonObj =null;
JSONArray jsonArr = new JSONArray();
for(String text : locList){
	jsonObj= new JSONObject();
	jsonObj.put("loc",text);
	jsonArr.add(jsonObj);
}

out.print(jsonArr.toJSONString());

%>