<%@page import="ra.admin.dashboard.DashboardDAO"%>
<%@page import="ra.admin.dashboard.DashboardReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../admin_include/login_session_confirm.jsp" %>
<%
DashboardDAO dbDAO = DashboardDAO.getInstance();
DashboardReviewVO dbrVO = new DashboardReviewVO();

List<DashboardReviewVO> reviewSum = dbDAO.selectReviewSum();
/* System.out.println( reviewSum ); */
pageContext.setAttribute("reviewSum", reviewSum);
%>

<ul class="list-group list-group-flush">
<c:forEach var="reviewSum" items="${ reviewSum  }" varStatus="i">
	<li class="list-group-item">
    <c:out value="${ i.count }"/>위. 총 리뷰수: <c:out value="${reviewSum.count}" /> | 휴게소 이름 <c:out value="${reviewSum.raname}" />
	</li>
	
</c:forEach>
	
	
	
</ul>

