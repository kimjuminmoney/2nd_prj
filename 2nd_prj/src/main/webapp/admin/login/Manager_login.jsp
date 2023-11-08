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
        <title>RestArea</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../../common/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- boost -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#id").keydown(function( evt ){
		if(evt.which==13){
			checkNull();
		 }//end if
	});//end keydown
	
	$("#pass").keydown(function( evt ){
		if(evt.which == 13){
			checkNull();
		}
	});
	$("#btnLogin").click(function(  ){
			checkNull();
	   });
	});

function checkNull() {
	var id=$("#id").val();
	var pass=$("#pass").val();
	
	$("#id").focus();
	if(id.replace(/ /g,"") == ""){
		alert("아이디를 입력해주세요.");
		frm.USERID.focus();;
		return;
	}
	
	$("#pass").focus();
	if(pass.replace(/ /g,"") ==""){
		alert("비밀번호를 입력해주세요.");
		frm.UPW.focus();;
		return;
	}
	
	$.ajax({
		url: "Manager_login_ajax.jsp",
		data: "id="+id+"&pw="+pass,
		type: "POST",
		dataType: "json",
		error: function(xhr){
			alert("다시 시도해주세요");
			console.log(xhr)
		},
		success: function(data){
			var flag = data.flag;
			if(!flag){
				var output = "<span style='color: red;font-weight: bold;'>아이디와 비밀번호를 확인해주세요</span>";
				$("#output").html(output);
			}
			if(flag){
				window.location.href = "../dashboard/index.jsp";
			}
		}//success
	})
}

</script>

</head>
<body class="bg-success">
	<div id="layoutAuthentication">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header text-center" style="text-align: center; padding: 60px;">
                                     <!-- 이미지를 추가합니다 -->
                                        <img src="../../common/logo_images/logo_black.png" />
                                    </div>
                                    <div class="card-body">
                                   
                                            <div class="form-floating mb-3" id="idWarn">
                                                <input class="form-control"  name="EMPNO" id="id"  type="text"  autofocus="autofocus" placeholder="id"  style="width: 100%"/>
                                                <label for="inputId">관리자번호</label>
                                            </div>
                                            <div id="passWarn" class="form-floating mb-3">
                                                <input class="form-control" name="EPW" id="pass" type="password" placeholder="Password"  style="width:100%;"/>
                                                <label for="inputPassword">비밀번호</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-end mt-4 mb-0">
                                            <div id="output">
                                            </div>
                                            <input type="button" value="로그인" id="btnLogin" class="btn btn-success"/>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
			    <footer class="py-4 bg-light mt-auto">
					<div id="layoutAuthentication_footer">
						<div class="container-fluid px-4">
							<div class="d-flex align-items-center justify-content-between small">
								<div class="navbar-brand" >
									<img src="../../common/logo_images/logo_black.png" width="150" height="50" />
								</div>
								<div style="position: absolute; left:200px;">
									<span>1234 - 5678</span><br>
									<span>평일 09:00 ~ 18:30</span><br>
									<span>주말 및 공휴일 휴무</span>
								</div>
							</div>
						</div>
					</div>
				</footer>
	</div>
                <!-- 풋터 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/scripts.js"></script>
    </body>
</html>