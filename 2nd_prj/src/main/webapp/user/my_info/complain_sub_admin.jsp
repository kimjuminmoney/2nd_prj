<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
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

<div class="container-fluid px-4" style="margin-top:50px; margin-left:2%;">
	<h1 class="mt-4">문의 상세내역</h1>
	<div class="card mb-4">
		<div class="card-header">
			<div class="container">
			<div class="row">
				<div class="col align-self-center" >
					문의 날짜
				</div>
				<div class="col align-self-center">
					문의 번호
				</div>
				<div class="col">
					<select id="select_CSType" class="datatable-selector" disabled>
	            		<option>고속도로관련</option><option> 휴게소관련</option><option> 회원정보관련</option></select>
	          	</div>
	            <div class="col">
		            <select id="select_CSType_sub" class="datatable-selector" disabled>
		           		<option>경부선휴게소1</option>
		            </select>
	            </div>
	    	</div>
	    	</div>
	    </div>
	        <div class="card-body">
	        	<div id="ta">
	            	<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" style="height: 100px;	">[Web발신] 너희는 나를 존중해야한다. 나는 1조 조장으로 .....       [더보기]
	            	</textarea>
	            </div>
	            <div class="row g-3 align-items-center" id="btn_myinfo" style="margin-top:10px;">
					<div class="col-2">
						<input type="button" id="btn_close" class="btn btn-outline-dark" value="닫기" style="border:1px solid #000"/>
					</div>
			     </div>
	         </div>
	     </div>
	</div>
	
	<div class="container-fluid px-4" style="margin-left:2%;">
	<h1 class="mt-4">답변</h1>
	<div class="card mb-4">
		<div class="card-header">
			<div class="container">
			<div class="row">
				<div class="col align-self-center" >
					문의 날짜
				</div>
				<div class="col align-self-center">
					문의 번호
				</div>
				<div class="col">
					<select id="select_CSType" class="datatable-selector" disabled>
	            		<option>고속도로관련</option><option> 휴게소관련</option><option> 회원정보관련</option></select>
	          	</div>
	            <div class="col">
		            <select id="select_CSType_sub" class="datatable-selector" disabled>
		           		<option>경부선휴게소1</option>
		            </select>
	            </div>
	    	</div>
	    	</div>
	    </div>
	        <div class="card-body">
	        	<div id="ta">
	            	<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" style="height: 100px;	">[Web발신] 너희는 나를 존중해야한다. 나는 1조 조장으로 .....       [더보기]
	            	</textarea>
	            </div>
	            <div class="row g-3 align-items-center" id="btn_myinfo" style="margin-top:10px;">
					<div class="col-2">
						<input type="button" id="btn_save" class="btn btn-outline-dark" value="저장" style="border:1px solid #000"/>
					</div>
					<div class="col-2">
						<input type="button" id="btn_close" class="btn btn-outline-dark" value="닫기" style="border:1px solid #000"/>
					</div>
			     </div>
	         </div>
	     </div>
	</div>
	
</body>
</html>