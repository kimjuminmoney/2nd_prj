<%@page import="ra.admin.restarea.AddRestDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    AddRestDAO arDAO = AddRestDAO.getInstance();
String hname = request.getParameter("highwayname");
int hNum = arDAO.selectHighwayNum(hname);

System.out.println("-------"+hname);
JSONObject jo=new JSONObject();
jo.put("hNum", hNum);
out.println(jo.toJSONString());
System.out.println(jo.toJSONString());

    %>