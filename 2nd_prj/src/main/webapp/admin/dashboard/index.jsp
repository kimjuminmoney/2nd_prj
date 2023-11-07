<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 페이지 지시자 설정 --%>
<%@ page info="" %>
<%@ include file="../admin_include/login_session_confirm.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>RestArea 관리자 페이지</title>
        <!-- <link href="https://cdn.jsdelivr.net/npm/simples-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
         --><link href="../../common/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
        
	<body class="sb-nav-fixed">
	<jsp:include page="../admin_include/header_nav.jsp"></jsp:include>
       
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
            <jsp:include page="../admin_include/side_bar.jsp"></jsp:include>
            
            </div>
            
            <div id="layoutSidenav_content">
		    <main>
		        <div class="container-fluid px-4">
		            <br/>
		            <br/>
		            <div class="left">
		                <div class="row">
		                    <div class="col-xl-6">
		                        <div class="card mb-4">
		                            <div class="card-header">
		                                <i class="fas fa-chart-area me-1"></i>
		                                휴게소 조회수
		                            </div>
		                            <jsp:include page="dashboard_hits.jsp"/>
		                          <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
		                        </div>
		                    </div>
		                    
		                    <div class="col-xl-6">
		                        <div class="card" style="width: 100%;">
		                            <div class="card-header">
		                             <i class="fas fa-chart-bar me-1"></i>
		                                휴게소별 리뷰수
		                            </div>
		                            <jsp:include page="dashboard_review_list.jsp"/>
		                            <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
		                            	
		                        </div>
		                    </div>
		                </div>
		            </div>
                    <br/>
                         
                        
					    <div class="card mb-4">
					        <div class="card-header">
					            <i class="fas fa-table me-1"></i>
					            휴게소 전체 정보
					        </div>
					        <div class="card-body">
					            <table class="table">
					                <thead>
					                    <tr>
					                        <th>오늘 가입자수</th>
					                        <th>전체 가입자수</th>
					                        <th>오늘 리뷰수</th>
					                        <th>전체 리뷰수</th>
					                        <th>오늘 탈퇴자수</th>
					                        <th>전체 탈퇴자수</th>
					                    </tr>
					                </thead>
					                <jsp:include page="dashboard_list.jsp" />
					            </table>
					        </div>
					    </div>
		        </div>
		    </main>
            </div>
			</div>	
        <jsp:include page="../admin_include/footer.jsp"></jsp:include> 
        <script src="../../common/assets/demo/chart-area-demo.js"></script>
        <script src="../../common/assets/demo/chart-bar-demo.js"></script>       
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/scripts.js"></script>
    </body>
</html>