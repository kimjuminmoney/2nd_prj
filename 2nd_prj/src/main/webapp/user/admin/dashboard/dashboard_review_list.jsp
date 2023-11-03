<%@page import="ra.admin.dashboard.DashboardDAO"%>
<%@page import="ra.admin.dashboard.DashboardReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
DashboardDAO dbDAO = DashboardDAO.getInstance();
DashboardReviewVO dbrVO = new DashboardReviewVO();

List<DashboardReviewVO> reviewSum = dbDAO.selectReviewSum();

pageContext.setAttribute("reviewSum", reviewSum);
%>

<ul class="list-group list-group-flush">
	<li class="list-group-item">
    1위. 총 리뷰수: <c:out value="${reviewSum.get(0).rvno}" /> | 휴게소 이름 <c:out value="${reviewSum.get(0).raname}" />
	</li>
	
	<li class="list-group-item">
    2위. 총 리뷰수: <c:out value="${reviewSum.get(1).rvno}" /> | 휴게소 이름 <c:out value="${reviewSum.get(1).raname}" />
	</li>
	
	<li class="list-group-item">
    3위. 총 리뷰수: <c:out value="${reviewSum.get(2).rvno}" /> | 휴게소 이름 <c:out value="${reviewSum.get(2).raname}" />
	</li>
	
	
	
</ul>

