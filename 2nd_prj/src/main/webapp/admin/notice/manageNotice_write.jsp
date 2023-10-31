<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="ra.admin.notice.NoticeVO"%>
<%@page import="ra.admin.notice.NoticeDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 <!-- 서머노트 스타일 및 스크립트 불러오기 -->
<script src="../../common/js/summernote/summernote-lite.js"></script>
<script src="../../common/js/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../../common/css/summernote/summernote-lite.css">
  
<style type="text/css">

</style>
<%
String noticeNo = request.getParameter("nno");
NoticeDAO nDAO = NoticeDAO.getInstance();
Date temp_date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
String input_date = sdf.format(temp_date);

pageContext.setAttribute("input_date", input_date);

try{
	NoticeVO nVO = nDAO.selectNoticeDetail(noticeNo);
	
	int max = nDAO.selectNnoMax();
	
	
	pageContext.setAttribute("maxNno",max);
} catch(SQLException se){
	se.printStackTrace();
}

%>
<script type="text/javascript">
$(function(){
	 $('#note').summernote({
		 toolbar: [
			    // [groupName, [list of button]]
			    ['style', ['bold', 'italic', 'underline', 'clear']],
			    ['font', ['strikethrough', 'superscript', 'subscript']],
			    ['fontsize', ['fontsize']],
			    ['color', ['color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']]
			  ],placeholder: '공지사항을 입력해주세요',
         height: 300,
         lang: 'ko-KR'
     });//summernote
	 
	 $("#saveBtn").click(function(){
		 var confirmation = confirm("저장하시겠습니까?");
         
         if (!confirmation) {
             alert("저장이 취소되었습니다.");
             return;
         }//end if
			 $("#frm").submit();
             alert("저장되었습니다.");
	 })//click
	 
	 $("#cancelBtn").click(function() {
         window.history.back(); // 브라우저에서 뒤로 가기
     });//click
     alert(${ maxNno+1})
	 
});//ready
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
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공지사항</h1>
                        <!-- <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol> -->
                        <div class="card mb-4">
                            <div class="card-body">
                               <!--  DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                . -->
                            </div>
                        </div>
						        <form action="manageNotice_write_process.jsp" method="post" id="frm">
						        <input type="hidden" id="nno" name="nno" value="${ maxNno+1 }">
						        <!-- 세션넘어오면 value empno로 변경하기 -->
						        <input type="hidden" id="empno" name="empno" value="1">
                        <div class="card mb-4">
						    <div class="card-header">
						        <div class="input-group input-group-lg">
								  <span class="input-group-text" id="inputGroup-sizing-lg">제 목</span>
								  <input type="text" id="ntitle" name="ntitle" class="form-control" placeholder="제목을 입력하세요" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
								</div>
						        <!-- 세션 들어가면 작성자랑 날짜 넣기 -->
						        <div class="input-group mb-3">
								  <span class="input-group-text" id="basic-addon1">작성자</span>
								  <input type="text" id="writer" value="홍지성" name="writer"class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly">
								</div>
						        <div class="input-group mb-3">
								  <span class="input-group-text" id="basic-addon1">작성일</span>
								  <input type="text" id="input_date" name="input_date" class="form-control" value="${ input_date }" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly">
						        </div>
						    </div>
						    <div class="card-body">
						            <textarea id="note" name="ncontent"></textarea>
						            <div style="text-align: right; margin: 10px;">
						            <input type="button" value="저장" id="saveBtn" class="btn btn-success" />
						            <input type="button" value="취소" id="cancelBtn" class="btn btn-success" />
						            </div>
						    </div>
						</div>
						        </form>
                    </div>
                </main>
                <!-- 풋터 -->
                <jsp:include page="../admin_include/footer.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/datatables-simple-demo.js"></script>
    </body>
</html>