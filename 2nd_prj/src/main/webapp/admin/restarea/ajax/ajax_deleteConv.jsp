<%@page import="ra.admin.restarea.ManageConvDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%
String restareaNum = request.getParameter("restareaNum");
String convNum = request.getParameter("convNum");

boolean flag = false;

ManageConvDAO mcDAO = ManageConvDAO.getInstance();

try{
mcDAO.deleteConv(convNum, restareaNum);
flag=true;
}catch(SQLException se){
	se.printStackTrace();
}

out.print(flag);

%>