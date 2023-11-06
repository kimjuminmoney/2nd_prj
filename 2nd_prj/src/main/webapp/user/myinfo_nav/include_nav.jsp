<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="header"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="../index/index.jsp"><img src="../../common/logo_images/logo_white.png"></a>
            <!-- Navbar Search-->
		<div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                	<a class="navbar-brand ps-3" href="../notice/userNotice.jsp">공지사항</a>
                	<a class="navbar-brand ps-3" href="../myinfo/modify_info.jsp">마이페이지</a>
                	<c:choose>
                	<c:when test="${ empty sesId }">
                		<a class="navbar-brand ps-3" href="../login/Client_login.jsp">로그인</a>
                	</c:when>
                	<c:otherwise>
                		<a class="navbar-brand ps-3" href="../logout/logout.jsp">로그아웃</a>
                	</c:otherwise>
                	</c:choose> 
                </div>
           </div>
        </nav>
        
        a class="navbar-brand ps-3" href="../dashboard/index.jsp"><img src="../../common/logo_images/logo_white.png"></a>
        
        