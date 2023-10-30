<%@page import="myPage.myPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="수정된 개인정보를 트랜잭션 전송하는 페이지" %>
<%
request.setCharacterEncoding("UTF-8");
//GET방식의 요청이라면 memberjoin_frm.jsp로 이동
String method=request.getMethod();
if("GET".equals(method)){
	response.sendRedirect("modify_frm.jsp");
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
<jsp:useBean id="uiVO" class="myPage.userInfoVO" scope="page"/>
<jsp:setProperty property="*" name="uiVO"/>
<c:catch var="se">
<%
myPageDAO mpDAO = new myPageDAO();
String email=uiVO.getEmail();
String id=uiVO.getId();
String name=uiVO.getName();
String nick=uiVO.getNick();
String tel=uiVO.getTel();

int cnt = mpDAO.modifyInfo(id, nick, email, tel);
if( cnt==0 ){
	
}
%>



</c:catch>


</body>
</html>