<%@page import="java.sql.SQLException"%>
<%@page import="ra.admin.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_include/login_session_confirm.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="nVO" class="ra.admin.notice.NoticeVO" scope="page"/>
<jsp:setProperty property="*" name="nVO"/>
<%
NoticeDAO nDAO = NoticeDAO.getInstance();
int flag = 0;
try{
	flag = nDAO.insertNotice(nVO);
	
	if(flag != -1){
		response.sendRedirect("manageNotice.jsp");
	}
	
} catch(SQLException se){
	se.printStackTrace();
	%>
	<script>
    // 브라우저의 뒤로 가기 동작을 트리거
    window.history.back();
    
    // "다시 시도해주세요" 알림을 표시
    alert("다시 시도해주세요");
	</script>
<%
}
%>
