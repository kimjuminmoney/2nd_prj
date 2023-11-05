<%@page import="ra.admin.restarea.ManageBrandDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%
String restareaNum = request.getParameter("restareaNum");
String brandNum = request.getParameter("brandNum");

boolean flag = false;

ManageBrandDAO mbDAO = ManageBrandDAO.getInstance();

try{
mbDAO.deleteBrand(brandNum, restareaNum);
flag=true;
}catch(SQLException se){
	se.printStackTrace();
}

out.print(flag);

%>