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
#datatablesSimple th:nth-child(1) {
    width: 50px; /* 1번 열 헤더의 너비 설정 */
}

#datatablesSimple th:nth-child(2) {
    width: 300px; /* 2번 열 헤더의 너비 설정 */
}

#datatablesSimple th:nth-child(3) {
    width: 80px; /* 3번 열 헤더의 너비 설정 */
}

#datatablesSimple th:nth-child(4) {
    width: 80px; /* 4번 열 헤더의 너비 설정 */
}
#datatablesSimple th:nth-child(2),
#datatablesSimple td:nth-child(2) {
    text-align: left; /* 2번째 열의 열 헤더와 행 데이터의 셀 내용 왼쪽 정렬 */
}

#datatablesSimple th,
#datatablesSimple td {
    text-align: center; /* 나머지 열 헤더와 행 데이터의 셀 내용 가운데 정렬 */
}


</style>
<script type="text/javascript">
$(function(){
	$("#writeBtn").click(function(){
		 window.location.href = "manageNotice_write.jsp";
	})
});//ready
</script>
<%
NoticeDAO nDAO = NoticeDAO.getInstance();

try{
	List<NoticeVO> list = nDAO.selectNotice();
	pageContext.setAttribute("noticeList", list);
} catch(SQLException se){
	se.printStackTrace();
}

%>

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
                        <!-- <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div> -->
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
                               <div style="text-align: right; margin: 10px;">
								    <input type="button" id="writeBtn"class="btn btn-success" value="글쓰기" style="width: 150px;">
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