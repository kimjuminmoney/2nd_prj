<%@page import="ra.user.cs.myCSDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ra.user.cs.MyCSVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); 
MyCSVO cVO=new MyCSVO();
JSONObject jsonObj = new JSONObject();


String id=(String)session.getAttribute("id");
System.out.println(id);
id="HJS";

String raNo=request.getParameter("ra_name");


String csType=request.getParameter("csType");

String csText= request.getParameter("cs_text");


cVO.setRaNO((raNo));
cVO.setCsType(csType);
cVO.setCsText(csText);


myCSDAO mcDAO = myCSDAO.getInstance();
int cnt = mcDAO.insertCS(id, cVO);


%>

