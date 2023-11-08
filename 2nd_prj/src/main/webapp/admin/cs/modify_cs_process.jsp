<%@page import="ra.admin.cs.AdminCSVO"%>
<%@page import="ra.admin.cs.AdminCSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String empno=(String)session.getAttribute("empno");
String csAnswer=request.getParameter("csAnswer");
String userId=request.getParameter("userid");
String csNo=request.getParameter("csNO");
int tempNO=Integer.valueOf(csNo);



AdminCSDAO acsDAO = AdminCSDAO.getInstance();
AdminCSVO csVO=acsDAO.selectOneCS(userId, tempNO);
csVO.setUserId(userId);
csVO.setEmpno(empno);
csVO.setCsAnswer(csAnswer);
acsDAO.modifyCS(csVO);




%>
