<%@page import="ra.admin.MembershipManagement.MembershipManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%
request.setCharacterEncoding("UTF-8"); 
//GET방식의 요청이라면 memberjoin_frm.jsp로 이동
String method=request.getMethod();
if("GET".equals(method)){
	response.sendRedirect("MembershipManagement.jsp");
	return;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.150/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- jQuery CDN 끝 -->
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){
	 
 });//ready
 </script>
</head>
<body>
<jsp:useBean id="mmVO" class="ra.admin.MembershipManagement.MembershipManagementVO" scope="page"/>
<jsp:setProperty property="*" name="mmVO"/>
<c:catch var="se">
<%
MembershipManagementDAO mmDAO = new MembershipManagementDAO();
String email=mmVO.getEmail();
String USERID=mmVO.getUSERID();
String UNAME=mmVO.getUNAME();
String UNICK=mmVO.getUNICK();
String UTEL=mmVO.getUTEL();

int cnt = mmDAO.modifyMember(USERID, UNICK, UTEL);
if( cnt==0 ){
	
}
%>



</c:catch>


</body>
</html>