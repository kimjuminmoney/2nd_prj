<%@page import="ra.admin.restarea.ManageBrandVO"%>
<%@page import="ra.admin.restarea.ManageBrandDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>

<%
ManageBrandDAO mcDAO = ManageBrandDAO.getInstance();
ManageBrandVO mbVO = new ManageBrandVO();

String restAreaNum = request.getParameter("restAreaNum");
String brandImage = request.getParameter("brandImage");
int brandNum = Integer.parseInt(request.getParameter("brandNum")); 
String brandName = request.getParameter("brandName");
String brandDetail = request.getParameter("brandDetail");

String fiPath = brandImage;
int startIndex = fiPath.lastIndexOf("\\")+1;
String fiName = fiPath.substring(startIndex);

int fiNameLength = fiName.length();

String iconNum = fiName.substring(0, fiNameLength-4);

mbVO.setRestAreaNum(restAreaNum);
mbVO.setIconNum(iconNum);
mbVO.setBrandNum(brandNum);
mbVO.setBrandName(brandName);
mbVO.setBrandHome(brandDetail);

boolean flag = false;

try{
mcDAO.updateBrand(mbVO);
flag=true;
}catch(SQLException se){
	se.printStackTrace();
}

out.print(flag);
%>







