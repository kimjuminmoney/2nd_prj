<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (session.getAttribute("sesNo") == null) {
//System.out.println(session.getAttribute("sesNo").toString());
    response.sendRedirect("../login/Manager_login.jsp");
    return;
} 
%>