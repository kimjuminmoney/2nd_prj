<%@page import="java.sql.SQLException"%>
<%@page import="restArea.DashboardUtil"%>
<%@page import="restAreaVO.DashboardUtilVO"%>
<%@page import="restAreaVO.DashboardVO"%>
<%@page import="restAreaDAO.DashboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>

</script>
<!-- 우측 div -->

<!-- 하단 테이블  -->
<%
DashboardDAO dbDAO = DashboardDAO.getInstance();
DashboardVO dbVO = new DashboardVO();

try{
int joinDay = dbDAO.selectDailyJoin();
int joinCnt = dbDAO.selectJoinSum();
int reviewDay = dbDAO.selectDailyReview();
int reviewCnt = dbDAO.selectReviewSum1();
int withdrwalDay = dbDAO.selectDailyWithdrwal();
int withdrwalCnt = dbDAO.selectWithdrawalSum();

pageContext.setAttribute("joinDay", joinDay);
pageContext.setAttribute("joinCnt", joinCnt);
pageContext.setAttribute("reviewDay", reviewDay);
pageContext.setAttribute("reviewCnt", reviewCnt);
pageContext.setAttribute("withdrwalDay", withdrwalDay);
pageContext.setAttribute("withdrwalCnt", withdrwalCnt);

}catch(SQLException se){
	se.printStackTrace();
}

%>
<tbody>
	<tr>
		<td><c:out value="${ joinDay }"/></td>
		<td><c:out value="${ joinCnt }"/></td>
		<td><c:out value="${ reviewDay }"/></td>
		<td><c:out value="${ reviewCnt }"/></td>
		<td><c:out value="${ withdrwalDay }"/></td>
		<td><c:out value="${ withdrwalCnt }"/></td>
	</tr>
</tbody>

