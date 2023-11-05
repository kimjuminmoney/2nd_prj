<%@page import="ra.admin.review.reviewAdminDAO"%>
<%@page import="ra.admin.review.reviewAdminVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); 
reviewAdminVO raVO =new reviewAdminVO();
reviewAdminDAO raDAO = reviewAdminDAO.getInstance();

String id= request.getParameter("id");
id="test";
int rvNo = Integer.parseInt(request.getParameter("rvNo"));
JSONObject jsonObj = new JSONObject();


int cnt=0;
try{
	cnt=raDAO.deleteReview(id,rvNo);
}catch(SQLException se){
	se.printStackTrace();
}
jsonObj.put("rvNo",rvNo);
jsonObj.put("cnt",cnt);

out.print(jsonObj.toJSONString());
%>
