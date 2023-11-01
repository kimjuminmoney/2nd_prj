<%@page import="ra.admin.dashboard.DashboardReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="ra.admin.dashboard.DashboardVO"%>
<%@page import="ra.admin.dashboard.DashboardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>

</script>

<%
DashboardDAO dbDAO = DashboardDAO.getInstance();
DashboardVO dbVO = new DashboardVO();

List<DashboardReviewVO> reviewSum = dbDAO.selectReviewSum();

pageContext.setAttribute("reviewSum", reviewSum);
%>

<tr>

	<td><c:out value="${ reviewSum.get(0).rvno }"/></td>
	<td><c:out value="${ reviewSum.get(0).count }"/></td>
	</tr>
	<tr>
	<td><c:out value="${ reviewSum.get(1).rvno }"/></td>
	<td><c:out value="${ reviewSum.get(1).count }"/></td>
	</tr>
	<tr>
	<td><c:out value="${ reviewSum.get(2).rvno }"/></td>
	<td><c:out value="${ reviewSum.get(2).count }"/></td>
</tr>

