<%@page import="java.sql.SQLException"%>
<%@page import="ra.admin.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_include/login_session_confirm.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.151/jsp_prj/common/main/favicon.ico">
<!-- boost -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	
});//ready
</script>
</head>
<body>
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
}
%>
</body>
</html>