<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (session.getAttribute("sesNo") == null) {
    response.sendRedirect("../login/Manager_login.jsp");
    return;
} 
%>