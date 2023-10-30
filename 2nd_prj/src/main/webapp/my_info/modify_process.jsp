<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="myPage.MyReviewVO"%>
<%@page import="myPage.MyReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8"); 

MyReviewVO mrVO = new MyReviewVO();
MyReviewDAO mrDAO = MyReviewDAO.getInstance();

String id=request.getParameter("id");
id="HJS";
int rvNo=Integer.valueOf(request.getParameter("rvNo"));
int rvScore=Integer.valueOf(request.getParameter("rvScore"));
String rvText=request.getParameter("rvText");

JSONObject jsonObj=new JSONObject();

int cnt=0;
try{
cnt = mrDAO.modifyReview(id, rvNo, rvScore, rvText);
}catch(SQLException se){
	se.printStackTrace();
}
jsonObj.put("Score",rvScore);
jsonObj.put("Text",rvText);
jsonObj.put("cnt",cnt);

out.print(jsonObj.toJSONString());
%>