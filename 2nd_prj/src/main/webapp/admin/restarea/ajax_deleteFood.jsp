<%@page import="ra.admin.restarea.ManageFoodDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%
String restareaNum = request.getParameter("restareaNum");
String foodNum = request.getParameter("foodNum");

boolean flag = false;

ManageFoodDAO mfDAO = ManageFoodDAO.getInstance();

try{
mfDAO.deleteFood(foodNum, restareaNum);
flag=true;
}catch(SQLException se){
	se.printStackTrace();
}

out.print(flag);

%>