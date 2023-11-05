<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="header"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="my_info_main.jsp">HCY Travel</a>
            <!-- Navbar Search-->
		<div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                	<a class="navbar-brand ps-3" href="../notice/userNotice.jsp">공지사항</a>
                	<a class="navbar-brand ps-3" href="../cs/complain.jsp">문의</a>
                	<c:choose>
                	<c:when test="${ empty sesId }">
                		<div class="navbar-brand ps-3" onclick="<% response.sendRedirect("../login/login.html.jsp");%>">로그인</div	>
                	</c:when>
                	<c:otherwise>
                		
                		<div class="navbar-brand ps-3"  onclick="<% session.removeAttribute("sesId"); response.sendRedirect("../index/index.jsp");%>">로그아웃</div>
                	</c:otherwise>
                	</c:choose> 
                </div>
           </div>
        </nav>
        
        
        