<%@page import="ra.admin.review.ReviewDAO"%>
<%@page import="ra.admin.review.ReviewVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); 

ReviewVO VO = new ReviewVO();
ReviewDAO rDAO = ReviewDAO.getInstance();

String userId=request.getParameter("userId");
int rvNo=Integer.parseInt(request.getParameter("rvNo"));
String rvdType=request.getParameter("rvdType");
String rvdDetail=request.getParameter("rvdDetail");

JSONObject jsonObj=new JSONObject();

int cnt=0;
try{
cnt = rDAO.deleteOneReview(userId, rvNo, rvdType, rvdDetail);
}catch(SQLException se){
	se.printStackTrace();
}

jsonObj.put("cnt",cnt);

out.print(jsonObj.toJSONString());

%>
