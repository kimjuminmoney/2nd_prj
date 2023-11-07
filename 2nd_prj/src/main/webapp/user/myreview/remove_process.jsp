<%@page import="ra.user.myreview.MyReviewDAO"%>
<%@page import="ra.user.myreview.MyReviewVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); 

MyReviewVO mrVO = new MyReviewVO();
MyReviewDAO mrDAO = MyReviewDAO.getInstance();

String userId=request.getParameter("userId");

int rvNo=Integer.parseInt(request.getParameter("rvNo"));

JSONObject jsonObj=new JSONObject();

int cnt=0;
try{
cnt = mrDAO.deleteReview(userId, rvNo);
}catch(SQLException se){
	se.printStackTrace();
}
jsonObj.put("rvNo",rvNo);
jsonObj.put("cnt",cnt);

out.print(jsonObj.toJSONString());

%>
