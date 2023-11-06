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
<%@ include file="../admin_include/login_session_confirm.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>수정하기</title>
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
NoticeVO nVO = null;
try{
	nVO = nDAO.selectNoticeDetail(noticeNo);
	
	pageContext.setAttribute("noticeVO", nVO);
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
     //content값을 summernote에 할당
     var content = "${ noticeVO.ncontent}";
     $('#note').summernote('code', content);
     
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
				        <form action="manageNotice_update_process.jsp" method="post" id="frm">
				        	<input type="hidden" id="nno" name="nno" value="${ noticeVO.nno }">
				        	<!-- 세션넘어오면 value empno로 변경하기 -->
                       		<div class="card mb-4">
				        	<input type="hidden" id="empno" name="empno" value="1">
	                       		<div class="toast-header" style="background-color: #E2E2E2;opacity 3.00%">
	                       			<span class="input-group-text" id="inputGroup-sizing-lg">제 목</span>
									<input type="text" id="ntitle" name="ntitle" class="form-control" 
									placeholder="제목을 입력하세요" aria-label="Sizing example input" 
									aria-describedby="inputGroup-sizing-lg" value="${ noticeVO.ntitle }">
									    <!-- <strong class="me-auto">Bootstrap</strong> -->
									    <div style="width: 200px">
									    <small>작성자 : ${ noticeVO.writer }</small><br>
									    <small>작성일 : ${ noticeVO.input_date }</small><br>
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