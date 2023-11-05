<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="index" %>        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%-- <jsp:include page="search/main_e3.jsp" /> --%>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="icon" href="http://192.168.10.151/jsp_prj/common/main/favicon.ico">
boost
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
Jquery CDN시작
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<jsp:include page="../search/css_include.jsp"></jsp:include>
<jsp:include page="../search/function_include.jsp"></jsp:include>
<jsp:include page="../highway/highway_list.jsp"></jsp:include>
</head>
  <body class="d-flex flex-column h-100">
            <!-- <main class=" flex-shrink-0"> -->
                <header>
                <jsp:include page="../myinfo_nav/include_nav.jsp"></jsp:include>
                </header>
                <section class="bg-dark py-5" id="features">
                    <!-- ===============================================사이드바================================================= -->
                <div id="all-wrapper">
                    <div id="page-wrapper">
                        <div id="sidebar-wrapper">
                            <ul class="nav nav-tabs" id="myTab" role="tablist" style="border-bottom-width: 0px; padding-left: 20px;">
                                <!-- <li class="sidebar-brand nav-item" role="presentation">
                                    <a href="#">
                                    <img src="../img/logo_white.png">
                                    </a>
                                </li> -->
                                <li class="nav-item" role="presentation">
									<button class="nav-link active" id="search-tab" data-bs-toggle="tab" data-bs-target="#search" type="button" role="tab" aria-controls="search" aria-selected="true">검색</button>
									<!--                                     <input class="nav-link active" id="search-tab" data-bs-toggle="tab" data-bs-target="#search" type="button" role="tab" aria-controls="search" aria-selected="true" value="검색"> -->
									<!--                                     <button class="nav-link active" id="search-tab" data-bs-toggle="tab" data-bs-target="#search" type="button" role="tab" aria-controls="search" aria-selected="true">검색</button> -->
	                                </li>
	                                <li class="nav-item" role="presentation">
									<button class="nav-link" id="local-tab" data-bs-toggle="tab" data-bs-target="#local" type="button" role="tab" aria-controls="local" aria-selected="false">지역별 휴게소</button>
									<!--                                     <input class="nav-link" id="local-tab" data-bs-toggle="tab" data-bs-target="#local" type="button" role="tab" aria-controls="local" aria-selected="false" value="지역별"> -->
	                                </li>
	                                <li class="nav-item" role="presentation">
									<button class="nav-link" id="highway-tab" data-bs-toggle="tab" data-bs-target="#highway" type="button" role="tab" aria-controls="highway" aria-selected="false">고속도로별 휴게소</button>
									<!--                                     <input class="nav-link" id="highway-tab" data-bs-toggle="tab" data-bs-target="#highway" type="button" role="tab" aria-controls="highway" aria-selected="false"value="고속도로별"> -->
                                </li>
                                
                            </ul>
                        </div>
                    </div>    
                        <!-- /사이드바 -->
                    <!-- 검색창, 지역별, 고속도로별 -->
                   <div id="menu-box"class="tab-content" >
                        <!-- 검색창 -->
                        <jsp:include page="../search/include.jsp"></jsp:include>
                        
                        
                        <!-- 다영 -->
                        <div class="tab-pane" id="local" role="tabpanel" aria-labelledby="local-tab">
					    <!--  지역별 지도 모습 -->
					    <jsp:include page="../loc/css_local.jsp"></jsp:include>
					    <jsp:include page="../loc/function_local.jsp"></jsp:include>
					    
					    <!-- 지도 위 안내문-->
					    <div class="local_box">
					        <nav class="navbar bg-body-tertiary">
					            <div class="container-fluid">
					                <div class="alert alert-success text-center" role="alert">
					                    <p>지역별 휴게소</p>
					                    <hr>
					                    <p class="mb-0">원하는 지역을 눌러 휴게소의 상세 정보를 확인 할 수 있습니다.</p>
					                </div>
					            </div>
					        </nav>
					    </div> 
					    </div>
					    
                        <!-- 지성 -->
                        
	                   <div class="tab-pane" id="highway" role="tabpanel" aria-labelledby="highway-tab">
	                            <div class="container text-center">
	                               <div class="row">
	                                  <div class="col" id="hList">
	                                     <div class="collapse collapse-horizontal" id="collapseWidthExample">
	                                     </div>
	                                  </div>
	                                  <div class="col" id="raList">
	                                  </div>
	                              </div>
	                            </div>
	                   </div>
	                  </div>
                    
                    <!-- 지도 -->
                    <div id="map" >
                    </div>
                </div>        


                </section>
            <!-- </main> -->
            <!-- Footer-->
            <footer class="bg-dark py-4 mt-auto">
                <div class="container px-5">
                    <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                        <div class="col-auto">
                            <div class="small m-0 text-white">Copyright &copy; Your Website 2023</div>
                        </div>
                        <div class="col-auto">
                            <a class="link-light small" href="#!">Privacy</a>
                            <span class="text-white mx-1">&middot;</span>
                            <a class="link-light small" href="#!">Terms</a>
                            <span class="text-white mx-1">&middot;</span>
                            <a class="link-light small" href="#!">Contact</a>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <!-- <script src="js/scripts.js"></script> -->
        </body>

        </html>
</html>