<%@page import="ra.admin.restarea.ManageConvVO"%>
<%@page import="ra.admin.restarea.ManageConvDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>

<%
ManageConvDAO mcDAO = ManageConvDAO.getInstance();
ManageConvVO mcVO = new ManageConvVO();

String restAreaNum = request.getParameter("restAreaNum");
String convImage = request.getParameter("convImage");
int convNum = Integer.parseInt(request.getParameter("convNum")); 
String convName = request.getParameter("convName");
String convDetail = request.getParameter("convDetail");

String fiPath = convImage;
int startIndex = fiPath.lastIndexOf("\\")+1;
String fiName = fiPath.substring(startIndex);

int fiNameLength = fiName.length();

String iconNum = fiName.substring(0, fiNameLength-4);
System.out.print("아이콘넘버: "+iconNum);

mcVO.setRestAreaNum(restAreaNum);
mcVO.setIconNum(Integer.parseInt(iconNum));
mcVO.setConvName(convName);
mcVO.setConvNum(convNum);
mcVO.setConvDetail(convDetail);

boolean flag = false;

try{
mcDAO.updateConv(mcVO);
flag=true;
}catch(SQLException se){
	se.printStackTrace();
}

out.print(flag);
%>













