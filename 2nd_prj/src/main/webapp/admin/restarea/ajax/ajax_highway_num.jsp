<%@page import="ra.admin.restarea.AddRestDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String hname = request.getParameter("highwayname");
    AddRestDAO arDAO = AddRestDAO.getInstance();
int hNum = arDAO.selectHighwayNum(hname);

JSONObject jo=new JSONObject();
jo.put("hNum", hNum);
out.println(jo.toJSONString());

    %>