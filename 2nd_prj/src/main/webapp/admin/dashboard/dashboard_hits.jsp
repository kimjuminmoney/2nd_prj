<%@page import="ra.admin.dashboard.DashboardCountVO"%>
<%@page import="ra.admin.dashboard.DashboardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../admin_include/login_session_confirm.jsp" %>

<%
DashboardDAO dbDAO = DashboardDAO.getInstance();
DashboardCountVO dbcVO = new DashboardCountVO();

List<DashboardCountVO> hitsSum = dbDAO.selectHitsSum();


pageContext.setAttribute("hitsSum", hitsSum);
%>

<ul class="list-group list-group-flush">
<c:forEach var="dcVO" items="${ hitsSum }" varStatus="i">
	<li class="list-group-item">
		<c:out value="${ i.count }"/>위. 총 방문수: <c:out value="${dcVO.hits}" /> | 휴게소 이름: <c:out value="${ dcVO.raname}" />
	</li>
	
</c:forEach>
</ul>