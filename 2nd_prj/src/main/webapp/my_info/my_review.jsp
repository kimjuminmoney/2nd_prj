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
                        <h1 class="mt-4">내 리뷰 관리</h1>
                        <div class="card mb-4">
                        	<div class="card-header" id="review_head">
                        		<label id="review_date"  class="btn btn-outline-dark">날짜</label>&nbsp;&nbsp;&nbsp;<label id="review_RAName" class="btn btn-outline-dark">휴게소</label>&nbsp;&nbsp;&nbsp;<label id="review_RAScore" class="btn btn-outline-dark">평점</label>
                       		</div>
                            <div class="card-body">
                                <p class="mb-0">
                                   리뷰내용이 들어갈부분입니다
                                </p>
                            </div>
                        </div>
                            <div id="btn_review" class="card-footer">
                            <input type="button" id="btn_RVModify" value="수정" style="border: 1px solid #000"/><input type="button" id="btn_RVDelete" value="삭제"style="border: 1px solid #000"/>
                            </div>
                            <br/>

 						<div class="card mb-4">
                        	<div class="card-header" id="review_head">
                        		<label id="review_date"  class="btn btn-outline-dark">날짜</label>&nbsp;&nbsp;&nbsp;<label id="review_RAName" class="btn btn-outline-dark">휴게소</label>&nbsp;&nbsp;&nbsp;<label id="review_RAScore" class="btn btn-outline-dark">평점</label>
                       		</div>
                            <div class="card-body">
                                <p class="mb-0">
                                   리뷰내용이 들어갈부분입니다
                                </p>
                            </div>
                        </div>
                            <div id="btn_review" class="card-footer">
                            <input type="button" id="btn_RVModify" value="수정" style="border: 1px solid #000"/><input type="button" id="btn_RVDelete" value="삭제"style="border: 1px solid #000"/>
                            </div>
                            <br/>
                        	    
                       <div class="card mb-4">
                        	<div class="card-header" id="review_head">
                        		<label id="review_date"  class="btn btn-outline-dark">날짜</label>&nbsp;&nbsp;&nbsp;<label id="review_RAName" class="btn btn-outline-dark">휴게소</label>&nbsp;&nbsp;&nbsp;<label id="review_RAScore" class="btn btn-outline-dark">평점</label>
                       		</div>
                            <div class="card-body">
                                <p class="mb-0">
                                   리뷰내용이 들어갈부분입니다
                                </p>
                            </div>
                        </div>
                            <div id="btn_review" class="card-footer">
                            <input type="button" id="btn_RVModify" value="수정" style="border: 1px solid #000"/><input type="button" id="btn_RVDelete" value="삭제"style="border: 1px solid #000"/>
                            </div>
                            <br/> 
                        	    
                        	    
                        	    
                        	    
                        	    
                        	    
                        <div style="height: 100vh"></div>
                        <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
                    </div>
                </main>
                    </div>
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
