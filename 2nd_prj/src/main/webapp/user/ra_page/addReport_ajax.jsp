<%@page import="java.sql.SQLException"%>
<%@page import="ra.user.restarea.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%
String reviewNum = request.getParameter("rvNum");

boolean flag=false;

ReviewDAO rvDAO = ReviewDAO.getInstance();
try{
rvDAO.updateReport(reviewNum);
flag=true;
}catch(SQLException se){
	se.printStackTrace();
}
out.print(flag);
%>