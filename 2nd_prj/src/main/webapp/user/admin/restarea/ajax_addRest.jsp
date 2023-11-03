<%@page import="ra.admin.restarea.AddRestVO"%>
<%@page import="ra.admin.restarea.AddRestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>

<%
AddRestDAO arDAO = AddRestDAO.getInstance();
AddRestVO arVO = new AddRestVO();

String addr = request.getParameter("addr");
String dirTemp = request.getParameter("direction");
String direction="";
if(dirTemp.equals("상행")){
	direction="u";
}else if(dirTemp.equals("하행")){
	direction="d";
}else{
	direction="t";
}
String hno = request.getParameter("highwaynum");
String loc = request.getParameter("locate");
String rax = request.getParameter("rax");
String ray = request.getParameter("ray");
String raName = request.getParameter("restname");
String tel = request.getParameter("tel");

arVO.setAddress(addr);
arVO.setDirection(direction);
arVO.setHighWayNum(hno);
arVO.setLocation(loc);
arVO.setRax(rax);
arVO.setRay(ray);
arVO.setRestAreaName(raName);
arVO.setTel(tel);
arDAO.insertRestArea(arVO);
%>