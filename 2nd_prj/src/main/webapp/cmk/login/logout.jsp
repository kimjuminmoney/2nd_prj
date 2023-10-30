<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
session.removeAttribute("ssId");
session.removeAttribute("userData");
session.invalidate();
response.sendRedirect("main.html");
%>