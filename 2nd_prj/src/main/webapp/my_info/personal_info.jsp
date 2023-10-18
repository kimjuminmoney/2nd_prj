<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 <!-- jQuery CDN 끝 -->
 <!-- css연결 -->
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="http://192.168.10.150/jsp_prj/common/css/styles.css">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- 연결 끗 -->    
 
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){
	 
 });//ready
 </script>
</head>
<body class="sb-nav-fixed">

        <jsp:include page="include_nav.jsp"></jsp:include>
        <div id="layoutSidenav">
        	<jsp:include page="include_side_nav.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
						<div class="mb-4" style="width:20%; height:75px; margin-top:50px; padding: 10px;" >
                       	 	<h1 class="list-unstyled" >개인정보 수정</h1>
                        </div>
                     </div>
                        <!-- 개인정보 수정 -->
                    <div class="containter-fluid px-4">
					<div class="card-body">
                        <div class="card mb-3" style="margin:10px; padding:10px">
                        	<strong>
		                        <!-- //join -->
		                        <div class="row g-3 align-items-center">
    								<div class="col-6" style="margin-top:10px;">
			                     	<label style="margin:10px">아이디</label>
                                    <input class="form-control form-control-lg"type="text" value="불러온값" disabled readonly />
                            		</div>
                            	</div>
			                  <div class="row g-3 align-items-center" style="margin-top:10px;">
			                  <label><span>닉네임 변경</span></label>
    							<div class="col-auto">
			                   		<input class="form-control form-control-lg" type="text" placeholder="기존닉네임붙여넣기" />
			                  	</div>
			                  	<div class="col-auto">
			                  		<span id="passwordHelpInline" class="form-text">
      								Must be 8-20 characters long.
								    </span>	
			                  	</div>
			                  </div>
							<div class="row g-3 align-items-center"  style="margin-top:10px;">
							<label><span>이름</span></label>
								<div id="user_name" class="col-auto">
							 		<input class="form-control form-control-lg" type="text" value="불러온값" disabled readonly/>
								</div>
							</div>
							
							<div class="row g-3 align-items-center" style="margin-top:10px;">
							<label><span>이메일 변경</span></label>
							 	<div class="col-6">
			                   		<input class="form-control form-control-lg" type="text" placeholder="기존이메일 붙여넣기" />
			                  	</div>
			                  	<div class="col-auto">
			                  		<span id="passwordHelpInline" class="form-text">
      								Must be 8-20 characters long.
								    </span>	
			                  	</div>
							</div>
							
							<div class="row g-3 align-items-center" style="margin-top:10px;">
								<label><span>전화번호 변경</span></label>
								<div class="col-6">		
									<input class="form-control form-control-lg" type="text" placeholder="기존전화번호 붙여넣기" />
								</div>
								<div class="col-auto">
				                	<span id="passwordHelpInline" class="form-text">
	      							Must be using Hyphen.
								   </span>	
			                  	</div>
							</div>
							<div class="row g-3 align-items-center" id="btn_myinfo" style="margin-top:10px;">
								<div class="col-auto">
								<input type="button" id="btn_modify" class="btn btn-outline-dark" value="수정" style="border:1px solid #000"/>
								</div>
								<div class="col-auto">
								<input type="button" id="btn_cancel" class="btn btn-outline-dark" value="취소"style="border:1px solid #000"/>
								</div>
		                   	</div>
		                       </strong>
                         </div>
                           
                   </div>
                   </div>
              </main>
                <footer class="py-4 bg-light mt-auto">
                    <jsp:include page="include_footer.jsp"></jsp:include>
                </footer>
       		</div>
      	</div>
    </body>
</html>
