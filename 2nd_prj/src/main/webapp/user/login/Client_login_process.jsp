<%@page import="ra.user.login.ClientDataVO"%>
<%@page import="ra.user.login.ClientLoginDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%
if("GET".equals(request.getMethod().toUpperCase())){
	response.sendRedirect("Client_login.html");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<jsp:useBean id="clVO" class="ra.user.login.ClientLoginVO" scope="page"/>
<jsp:setProperty property="*" name="clVO"/>

<%
clVO.setUPW(DataEncrypt.messageDigest("MD5", clVO.getUPW()));

ClientLoginDAO clDAO = ClientLoginDAO.getInstance();
try{
	ClientDataVO cdVO = clDAO.selectLogin(clVO);
	
	if(cdVO != null){
		session.setAttribute("sesId", clVO.getUSERID());
		session.setAttribute("userData", cdVO);
		
		response.sendRedirect("test.jsp");
}else{
	%>
	아이디나 비밀번호를 확인해 주세요<br/>
	<a href="Client_login.html">로그인</a>
<%
}
}catch(SQLException se){
	se.printStackTrace();
}
%>
<script>
$(document).ready(function(){
	//저장된 쿠키값을 가져와서 ID칸에 넣어준다. 없으면 공백으로 들어간다.
	var key=getCookie("key");
	$("#USERID").val(key);
	
	//그전에 ID를 저장해서 처음 페이지 로딩 시, 입력칸에 저장된 ID가 표시된 상태라면,
	if($("#USERID").val() !=""){
		$("#checked").attr("checked", true);//ID저장하기를 체크 상태로 두기
	}
	$("#checkId").change(function(){//체크박스에 변화가 있다면
		if($("chckId").is(":checked")){//ID 저장하기 체크했을 떄
			setCookie("key",$("#id").val(),7);//7일 동안 쿠키 보관
		}else{//ID저장하기 체크 헤제시
		deleteCookie("key");	
		}
		});
	
	//ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장
	$("#id").keyup(function() {//ID입력 칸에 ID를 입력할 떄
		if($("#checkId").is(":checked")){// ID저장하기를 체크한 상태라면
			setCookie("key",$("#id").val(),7); //7일동안 쿠키 보관
	}
	})
});

//쿠키저장하기
//setCookie => saveid함수에서 넘겨준 시간이 현재 시간과 비교해서 쿠키를 생성하고 지워주는 역할
function setCookie(cookieName, value, exdays){
	var exdate = new Date();
	exdate.setDate(exdate.getDate());
	var cookieValue = escape(value)+((exdays==null)?"":"; expires="+exdate.toGMTSring());
	document.cookie=cookieName+"="+ cookieValue;
}
//쿠키 삭제
function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires="
			+ expireDate.toGMTString();
}
 
// 쿠키 가져오기
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if (start != -1) { // 쿠키가 존재하면
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
			end = cookieData.length;
            console.log("end위치  : " + end);
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}
</script>

</body>
</html>