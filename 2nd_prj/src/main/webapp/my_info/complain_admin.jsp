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
		 $("#cs_detail").click(function(){
				var id=$("#id").val();
				window.open("complain_sub_admin.jsp","cs_detail","width=800,height=700,top="
			            +( window.screenY+150)+",left="+( window.screenX+200));	
			}); 
 });//ready
 </script>
</head>
<body class="sb-nav-fixed">
        <jsp:include page="include_nav.jsp"></jsp:include><!-- 위쪽 사이드 nav 넣기 -->
        <div id="layoutSidenav">
        	<jsp:include page="include_side_nav.jsp"></jsp:include><!-- 왼쪽 사이드 nav 넣기 -->
            <div id="layoutSidenav_content">
                <main>
                      <div class="container-fluid px-4">
						<div class="mb-4" style="width:20%; height:75px; margin-top:50px; padding: 10px;" >
                       	 	<h1 class="list-unstyled" >문의 내역</h1>
                        </div>
                     </div>
                    <div class="container-fluid px-4" style="margin-top:50px;">
                        <div class="card mb-4">
                            <div class="card-body">
                                    <table class="datatable-table">
                                    <thead>
                                    <tr>
                                    	<th>날짜</th>
                                    	<th>아이디</th>
                                    	<th>문의내용</th>
                                    	<th>휴게소명</th>
                                    	<th>유형</th>
                                    	<th>상태</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr id="cs_detail">
                                    	<td>2013-12-01</td><td>bluecarrot0217</td><td>어쩌고저쩌고</td><td>가평휴게소</td><td>휴게소</td><td>Y</td>
                                    </tr>
                                    <tr id="cs_detail">
                                    	<td>2013-12-01</td><td>bluecarrot0217</td><td>어쩌고저쩌고</td><td>가평휴게소</td><td>휴게소</td><td>Y</td>
                                    </tr>
                                    <tr id="cs_detail">
                                    	<td>2013-12-01</td><td>bluecarrot0217</td><td>어쩌고저쩌고</td><td>가평휴게소</td><td>휴게소</td><td>Y</td>
                                    </tr>
                                    <tr id="cs_detail">
                                    	<td>2013-12-01</td><td>bluecarrot0217</td><td>어쩌고저쩌고</td><td>가평휴게소</td><td>휴게소</td><td>Y</td>
                                    </tr>
                                    <tr id="cs_detail">
                                    	<td>2013-12-01</td><td>bluecarrot0217</td><td>어쩌고저쩌고</td><td>가평휴게소</td><td>휴게소</td><td>Y</td>
                                    </tr>
                                    <tr id="cs_detail">
                                    	<td>2013-12-01</td><td>bluecarrot0217</td><td>어쩌고저쩌고</td><td>가평휴게소</td><td>휴게소</td><td>Y</td>
                                    </tr>
                                    <tr id="cs_detail">
                                    	<td>2013-12-01</td><td>bluecarrot0217</td><td>어쩌고저쩌고</td><td>가평휴게소</td><td>휴게소</td><td>Y</td>
                                    </tr>
                                    <tr id="cs_detail">
                                    	<td>2013-12-01</td><td>bluecarrot0217</td><td>어쩌고저쩌고</td><td>가평휴게소</td><td>휴게소</td><td>Y</td>
                                    </tr>
                                    </tbody>
									</table>
                            	</div>
                        	</div>
                        </div>
                    
                    <div class="container text-center" style="margin-top:50px;">    
						<div id="searchCS" class="self-align-center">
							<div class="row justify-content-md-center">
								<div id="searchType" class="col col-lg-2">
									<select class="form-select" >
										<option>유형선택</option>
										<option>아이디</option>
										<option>닉네임</option>
										<option>휴게소명</option>
									</select>
								</div>
								<div class="col-md-4">
									<input type="text" class="form-control" id="search_var"/>
								</div>
								<div class="col col-lg-2">
									<input type="button" class="btn btn-outline-dark" id="search_search_btn" value="검색"/>
								</div>
							</div>
						</div>
					</div>
                        
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
ㅌ
    </body>
</html>
