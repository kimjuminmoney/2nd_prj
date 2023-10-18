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
                    <div class="container-fluid px-4" style="margin-top:3%; margin-left:2%">
                        <h1 class="mt-4">문의 내역</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                    <table  class="datatable-table">
                                    <thead>
                                    <tr>
                                    	<th>문의유형</th>
                                    	<th>날짜</th>
                                    	<th>내용</th>
                                    	<th>휴게소명</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                    	<td>1</td><td>2</td><td>3</td><td>4</td>
                                    </tr>
                                    <tr>
                                    	<td>1</td><td>2</td><td>3</td><td>4</td>
                                    </tr>
                                    <tr>
                                    	<td>1</td><td>2</td><td>3</td><td>4</td>
                                    </tr>
                                    </tbody>
									</table>
                            	</div>
                        	</div>
                        </div>
                        <div style="height: 3vh"></div>
                    <div class="container-fluid px-4" style="margin-left:2%;">
                     	<h1 class="mt-4">문의하기</h1>
                        <div class="card mb-4">
    	                   	<div class="card-header">
                        		<div id="select_cs">
                        		<select id="select_dropdown" class="datatable-selector">
                        			<option>고속도로관련</option><option> 휴게소관련</option><option> 회원정보관련</option></select>
                        		<select id="select_CSType" class="datatable-selector">
                        			<option>휴게소명</option><option>경부선휴게소1</option>
                        			</select>
	    	                    </div>
            	            </div>
                        	<div class="card-body">
                        	<div id="ta">
                        		<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" style="height: 100px;	">[Web발신] 너희는 나를 존중해야한다. 나는 1조 조장으로 .....       [더보기]
                        		</textarea>
                        	</div>
                        	<div class="row g-3 align-items-center" id="btn_myinfo" style="margin-top:10px;">
								<div class="col-auto">
								<input type="button" id="btn_modify" class="btn btn-outline-dark" value="확인" style="border:1px solid #000"/>
								</div>
								<div class="col-auto">
								<input type="button" id="btn_cancel" class="btn btn-outline-dark" value="취소"style="border:1px solid #000"/>
								</div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
