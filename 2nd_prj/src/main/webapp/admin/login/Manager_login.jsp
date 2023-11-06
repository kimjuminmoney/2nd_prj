<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../../common/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<link rel="icon" href="http://192.168.10.151/jsp_prj/common/main/favicon.ico">
<!-- boost -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
<%
%>
$(function(){
	$("#EMPNO").keydown(function( evt ){
	if(evt.which==13){
		checkNull();
	 }//end if
});//end keydown

$("#EPW").click(function( evt ){
	if(evt.which == 13){
		checkNull();
	}
});
$("#btnLogin").click(function(  ){
		checkNull();
   });
});

function checkNull() {
	var id=$("#EMPNO").val();
	var pass=$("#EPW").val();
	
	$("#EMPNO").focus();
	if(id.replace(/ /g,"") == ""){
		alert("아이디를 입력해주세요.");
		frm.USERID.focus();;
		return;
	}
	
	$("#EPW").focus();
	if(pass.replace(/ /g,"") ==""){
		alert("비밀번호를 입력해주세요.");
		frm.UPW.focus();;
		return;
	}
	$("#frm").submit();
}

</script>

</head>
<body class="sb-nav-fixed">
  <!-- 해더 nav -->
        <jsp:include page="../admin_include/header_nav.jsp"></jsp:include>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
            <!-- 사이드바 nav -->
            <jsp:include page="../admin_include/side_bar.jsp"></jsp:include>
               
            </div>
       </div>
            <div id="layoutSidenav_content">
                <main>
           
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header text-center" style="text-align: center; padding: 60px;">
                                     <!-- 이미지를 추가합니다 -->
                                        <img src="http://localhost/jsp_prj/2_project/admin/assets/img/logo.png" />
                                    </div>
                                    <div class="card-body">
                                   
                                        <form action="Manager_login_process.jsp" method="post" name="frm" id="frm">
                                            <div class="form-floating mb-3" id="idWarn">
                                                <input class="form-control"  name="EMPNO" id="EMPNO"  type="text"  autofocus="autofocus" placeholder="id"  style="width: 100%"/>
                                                <label for="inputId">관리자번호</label>
                                            </div>
                                            <div id="passWarn" class="form-floating mb-3">
                                                <input class="form-control" name="EPW" id="EPW" type="password" placeholder="Password"  style="width:100%;"/>
                                                <label for="inputPassword">비밀번호</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end mt-4 mb-0">
                                            <input type="button" value="로그인" id="btnLogin" class="btn btnLogin"/>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                    </div>
         <div id="layoutAuthentication_footer">
    <footer class="py-4 bg-light mt-auto sticky-footer">
        <div class="container-fluid px-4">
            <div class="d-flex align-items-center justify-content-between small">
                <div class="navbar-brand" >
                    <img src="http://localhost/jsp_prj/2_project/admin/assets/img/logo.png" width="150" height="50" />
                </div>
                <div style="position: absolute; left:200px;">
                    <span>1234 - 5678</span><br>
                    <span>평일 09:00 ~ 18:30</span><br>
                    <span>주말 및 공휴일 휴무</span>
                </div>
                        </div>
                    </div>
            </div>
                <!-- 풋터 -->
                <footer class="py-4 bg-light mt-auto">
                    <jsp:include page="../admin_include/footer.jsp"></jsp:include>
                </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/datatables-simple-demo.js"></script>
    </body>
</html>