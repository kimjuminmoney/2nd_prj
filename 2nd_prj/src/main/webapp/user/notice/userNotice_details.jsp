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
 <script type="text/javascript">
 $(function(){
	 $("#backBtn").click(function() {
	        window.history.back(); // 브라우저에서 뒤로 가기
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
            <jsp:include page="../myinfo_nav/include_side_nav.jsp"></jsp:include>
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
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                <h1>${ noticeVO.ntitle }</h1>
                                <span>작성자 : ${ noticeVO.writer }</span><span>작성일 : ${ noticeVO.input_date }</span>
                                
                            </div>
                            <div class="card-body">
                                <div class="container mt-5">
								    <div class="card" >
								     ${ noticeVO.ncontent }
								        <!-- <div class="card-header">
								            <h4>게시물 제목</h4>
								        </div>
								        <div class="card-body">
								            <p class="card-text">작성자: 글쓴이 이름</p>
								            <p class="card-text">작성일: 2023-10-30</p>
								            <p class="card-text">게시물 내용:</p>
								            <p class="card-text">게시물 내용이 여기에 나타납니다.</p>
								        </div> -->
								        
								    </div>
								</div>
                                
                            </div>
                        </div>
                    </div>
                    <input type="button" value="목록으로" class="btn btn-success" id="backBtn">
               
                    <%-- <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <!-- <table class="table"> -->
                                 <table id="datatablesSimple"> 
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:if test="${ empty noticeList }">
											<tr>
											<td colspan="8" style="text-align: center;">게시글이 존재하지 않습니다.</td>
											</tr>
										</c:if>
										
										<c:forEach var="notice" items="${ noticeList }" varStatus="i">
										<tr>
										<td><c:out value="${ notice.nno }"/></td>
										<td><a href="manageNotice_details.jsp?nno=${ notice.nno}"><c:out value="${ notice.ntitle }"/></a></td>
										<td><c:out value="${ notice.writer  }"/></td>
										<td><c:out value="${ notice.input_date }" /></td>
										</tr>
										</c:forEach>
										
                                    
                                    </tbody>
                                </table>
                            </div>
                        </div> --%>
                        <!-- <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Primary Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Warning Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Success Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Danger Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                               
                               
                                </table>
                            </div>
                        </div> 
                    </div>-->
                </main>
                <footer class="py-4 bg-light mt-auto">
                     <jsp:include page="../myinfo_nav/include_footer.jsp"></jsp:include>
                </footer>
            </div>
        </div>
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
        <script src="../../common/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/datatables-simple-demo.js"></script>
</body>
</html>