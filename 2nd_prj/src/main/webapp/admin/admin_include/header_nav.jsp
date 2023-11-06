<%@page import="ra.admin.login.ManagerDataVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/* String sesNo = session.getAttribute("sesNo").toString();
ManagerDataVO  mdVO = (ManagerDataVO)session.getAttribute("managerData");
System.out.println(sesNo);
System.out.println(mdVO); */
//session.setAttribute("sesNo", 1);
/* if (session.getAttribute("sesNo") == null) {
    response.sendRedirect("../login/Manager_login.html");
    return;
} */
	System.out.println("세션값 : " + session.getAttribute("sesNo"));

%>
<c:if test="${ empty sesNo }">
<c:redirect url="http://localhost/2nd_prj/admin/login/Manager_login.html"/>
<%-- <c:redirect url="../login/Manager_login.html"/> --%>
</c:if>
<%-- <c:choose>
    <c:when test="${empty sesNo}">
        <c:redirect url="../login/Manager_login.html" />
    </c:when>
    <c:otherwise>
        <!-- 다른 처리를 수행하거나 필요에 따라 다른 페이지로 이동 -->
    </c:otherwise>
</c:choose> --%>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<!-- Navbar Brand-->
	<a class="navbar-brand ps-3" href="../dashboard/index.jsp"><img src="../../common/logo_images/logo_white.png"></a>
	<!-- Sidebar Toggle-->
	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
	<div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
	    <a class="btn btn-secondary" id="btnNavbarSearch" onclick="<% session.removeAttribute("sesNo");session.removeAttribute("managerData");%>"href="../login/Manager_login.html">로그아웃</a>
	</div>
</nav>