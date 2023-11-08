<%@page import="java.sql.SQLException"%>
<%@page import="ra.admin.notice.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="ra.admin.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
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
<style type="text/css">

 </style>
 <script type="text/javascript">
 $(function(){
	 $("#backBtn").click(function() {
		 window.location.href = "userNotice.jsp"
	    });//click
 });//ready
 </script>
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
</head>
<body class="sb-nav-fixed">
        <jsp:include page="../myinfo_nav/include_nav.jsp"></jsp:include>
        <div id="layoutSidenav">
            <div id="layoutSidenav_content"style="padding-right: 225px;">
                <main>
                   <div class="container-fluid px-4">
                        <h1 class="mt-4">공지사항</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                <h1>${ noticeVO.ntitle }</h1>
                                <span>작성자 : ${ noticeVO.writer }</span><span>작성일 : ${ noticeVO.input_date }</span>
                                
                            </div>
                            <div class="card-body" >
								<div class="card" >
									${ noticeVO.ncontent }
								        
								</div>
                                <div style="text-align: center; margin-top: 20px">
				                	<input type="button" value="목록으로" class="btn btn-success" id="backBtn" >
				                </div>
                            </div>
                        </div>
                    </div>
               
                </main>
                <footer class="py-4 bg-light mt-auto">
                     <jsp:include page="../myinfo_nav/include_footer.jsp"></jsp:include>
                </footer>
            </div>
        </div>
        <script src="../../common/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/datatables-simple-demo.js"></script>
</body>
</html>