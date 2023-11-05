<%@page import="ra.admin.dashboard.DashboardCountVO"%>
<%@page import="ra.admin.dashboard.DashboardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
DashboardDAO dbDAO = DashboardDAO.getInstance();

Integer count = (Integer)application.getAttribute("count");

if (count == null) {
    count = 1;
} else {
    count++;
}

application.setAttribute("count", count);

List<DashboardCountVO> hitsSum = dbDAO.selectHitsSum();
session.setAttribute("updateHitsSum", hitsSum.get(0).getHits());
%>




<ul class="list-group list-group-flush">
    <li class="list-group-item">
        1위. 총 방문수: <c:out value="${hitsSum[0].hits}" /> | 휴게소 이름: <c:out value="${hitsSum[0].raname}" />
    </li>

    <li class="list-group-item">
        2위. 총 방문수: <c:out value="${hitsSum[1].hits}" /> | 휴게소 이름: <c:out value="${hitsSum[1].raname}" />
    </li>

    <li class="list-group-item">
        3위. 총 방문수: <c:out value="${hitsSum[2].hits}" /> | 휴게소 이름: <c:out value="${hitsSum[2].raname}" />
    </li>
</ul>