<%@page import="ra.admin.restarea.ManageFoodDAO"%>
<%@page import="ra.admin.restarea.ManageFoodVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>

<%
ManageFoodDAO mfDAO = ManageFoodDAO.getInstance();
ManageFoodVO mfVO = new ManageFoodVO();

String restAreaNum = request.getParameter("restAreaNum");
int foodNum = Integer.parseInt(request.getParameter("foodNum"));
String foodImage = request.getParameter("foodImage");
String foodName = request.getParameter("foodName");
int foodPrice = Integer.parseInt(request.getParameter("foodPrice")); 
String foodDetail = request.getParameter("foodDetail");

String fiPath = foodImage;
int startIndex = fiPath.lastIndexOf("\\")+1;
String fiName = fiPath.substring(startIndex);

mfVO.setRestAreaNum(restAreaNum);
mfVO.setFoodNum(foodNum);
mfVO.setFoodImage(fiName);
mfVO.setFoodName(foodName);
mfVO.setFoodPrice(foodPrice);
mfVO.setFoodDetail(foodDetail);

boolean flag = false;

try{
mfDAO.updateFood(mfVO);
flag=true;
}catch(SQLException se){
	se.printStackTrace();
}

out.print(flag);
%>







