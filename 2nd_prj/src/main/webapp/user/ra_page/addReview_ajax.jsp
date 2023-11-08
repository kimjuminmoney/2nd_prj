<%@page import="java.sql.SQLException"%>
<%@page import="ra.user.restarea.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%
String reviewDetail = request.getParameter("reviewDetail");
String restareaNum = request.getParameter("restareaNum");
String userId = request.getParameter("userId");
int reviewScore = Integer.parseInt(request.getParameter("reviewScore"));


boolean flag=false;

ReviewDAO rvDAO = ReviewDAO.getInstance();
try{
rvDAO.insertReview(userId,restareaNum,reviewDetail,reviewScore);
flag=true;
}catch(SQLException se){
	se.printStackTrace();
}
out.print(flag);
%>