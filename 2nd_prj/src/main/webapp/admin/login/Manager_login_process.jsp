<%@page import="ra.admin.login.ManagerDataVO"%>
<%@page import="ra.admin.login.ManagerLoginDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%
if("GET".equals(request.getMethod().toUpperCase())){
	response.sendRedirect("Manager_login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RestArea</title>
<link rel="icon" href="http://192.168.10.148/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>
<jsp:useBean id="mlVO" class="ra.admin.login.ManagerLoginVO" scope="page"/>
<jsp:setProperty property="*" name="mlVO"/>

<%
//DataEncrypt de=new DataEncrypt("a12345678901234567");

mlVO.setEPW(DataEncrypt.messageDigest("MD5",mlVO.getEPW()));

ManagerLoginDAO mlDAO = ManagerLoginDAO.getInstance();
try{
	ManagerDataVO  mdVO=mlDAO.selectLogin(mlVO);
	if(mdVO != null){
		session.setAttribute("sesNo",mlVO.getEMPNO());
		session.setAttribute("managerData", mdVO.getENAME());
		response.sendRedirect("../dashboard/index.jsp");
	} else {
%>
	아이디나 비밀번호를 확인해 주세요<br/>
	<a href="Manager_login.jsp">로그인</a>
<%
	}
}catch(SQLException se){
	se.printStackTrace();
}

%>


</body>
</html>