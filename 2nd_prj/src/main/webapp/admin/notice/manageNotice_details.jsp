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
<style type="text/css">

</style>
<%
String noticeNo = request.getParameter("nno");
NoticeDAO nDAO = NoticeDAO.getInstance();

try{
	NoticeVO nVO = nDAO.selectNoticeDetail(noticeNo);
	pageContext.setAttribute("noticeVO", nVO);
} catch(SQLException se){
	se.printStackTrace();
}

%>
<script type="text/javascript">

$(function(){
	$("#modifyBtn").click(function(){
		 window.location.href = "manageNotice_update.jsp?nno=<c:out value='${ noticeVO.nno }' />"
	});//click
	$("#deleteBtn").click(function(){
		var answer = confirm("삭제하시겠습니까?");
		if (answer) {
		 window.location.href = "manageNotice_delete_process.jsp?nno=<c:out value='${ noticeVO.nno }' />"
		}//end if
	});//click
	$("#backBtn").click(function() {
		 window.location.href = "manageNotice.jsp"
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
                        <div class="card mb-4">
                            <!-- <div class="card-header"> -->
                                <div class="toast-header" style="background-color: #E2E2E2;opacity 3.00%">
                                <h1 class="me-auto" style="color: #000000">${ noticeVO.ntitle }</h1>
								    <div>
								    <small>작성자 : ${ noticeVO.writer }</small><br>
								    <small>작성일 : ${ noticeVO.input_date }</small><br>
								    <div>
                                <input type="button" class="btn btn-success" value="수정" id="modifyBtn" >
                                <input type="button" class="btn btn-success" value="삭제" id="deleteBtn" >
								    </div>
								    </div>
							  	</div>
                                <%-- <span>작성자 : ${ noticeVO.writer }</span><span>작성일 : ${ noticeVO.input_date }</span> --%>
                                
                            <!-- </div> -->
                            <div class="card-body">
							    <div class="card" >
							     ${ noticeVO.ncontent }
							        
							    </div>
							    <div style="text-align: center; margin-top: 20px">
				                    <input type="button" value="목록으로" class="btn btn-success" id="backBtn">
								</div>
                                
                            </div>
                        </div>
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