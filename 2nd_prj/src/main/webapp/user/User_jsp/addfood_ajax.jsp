<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.manager.restarea.vo.ManageFoodVO"%>
<%@page import="kr.co.sist.manager.restarea.dao.ManageFoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>

<%
JSONArray json = new JSONArray();
json.add(request.getParameter("jsonArrayString"));
//System.out.println(json.get(0));
for (int i = 0; i < json.length(); i++) {
    JSONObject jsonObject = json.getJSONObject(i);
    String foodName = jsonObject.getString("foodNm");

ManageFoodDAO mfDAO = ManageFoodDAO.getInstance();
ManageFoodVO mfVO = new ManageFoodVO();
/* mfVO.setRestAreaNum(restAreaNum);
mfVO.setFoodName(foodName);
mfVO.setFoodImage(foodImage);
mfVO.setFoodPrice(foodPrice);
mfVO.setFoodDetail(foodDetail); */
%>