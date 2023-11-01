<%@page import="ra.user.restarea.ConvVO"%>
<%@page import="ra.user.restarea.FoodVO"%>
<%@page import="ra.user.restarea.RestAreaVO"%>
<%@page import="ra.user.restarea.ReviewVO"%>
<%@page import="ra.admin.restarea.AddRestDAO"%>
<%@page import="ra.user.restarea.ReviewDAO"%>
<%@page import="ra.user.restarea.RestDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../../common/css/styles.css" rel="stylesheet" />
        <!-- Jquery CDN시작 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
   
});//ready
</script>
    </head>
    <body class="d-flex flex-column h-100">
    <%
    RestDAO rDAO = RestDAO.getInstance();
    ReviewDAO rvDAO = ReviewDAO.getInstance();
    AddRestDAO arDAO = AddRestDAO.getInstance();
    ReviewVO rvVO = new ReviewVO();
		/* try {
			
			System.out.println("--2--"+rDAO.selectConv("1"));
			System.out.println("--3--"+rDAO.selectBrand("1"));
			System.out.println("--4--"+rDAO.selectGas("1"));
			System.out.println("--5--"+rDAO.selectGasType("1"));
			System.out.println("--6--"+rvDAO.selectReview("1"));
		} catch (SQLException e) {
			e.printStackTrace();
		} */

    %>
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.jsp">Start Bootstrap</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                            <li class="nav-item"><a class="nav-link" href="pricing.jsp">Pricing</a></li>
                            <li class="nav-item"><a class="nav-link" href="faq.jsp">FAQ</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="blog-home.jsp">Blog Home</a></li>
                                    <li><a class="dropdown-item" href="blog-post.jsp">Blog Post</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Portfolio</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                                    <li><a class="dropdown-item" href="portfolio-overview.jsp">Portfolio Overview</a></li>
                                    <li><a class="dropdown-item" href="portfolio-item.jsp">Portfolio Item</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Header-->
            <header class="bg-success py-1">
                <div class="container px-1">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                            <%
                            RestAreaVO raVO = rDAO.selectRestArea("1");
                            %>
                                <h1 class="display-5 fw-bolder text-white mb-2"><%=raVO.getRestAreaName() %></h1>
                                <p class="lead fw-normal text-white-50 mb-4">주소: <%=raVO.getAddress() %></p>
                                <p class="lead fw-normal text-white-50 mb-4">전화번호: <%=raVO.getTel() %></p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-outline-light btn-lg px-4" href="#food">먹거리</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#review">리뷰</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#conv">편의시설</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#brand">매장</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#gas">주유시설</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." /></div>
                    </div>
                </div>
            </header>
            <div style="background-color: #E9ECED;">
            
             <script>
            $(function(){
	            
	         /* // 현재 URL에서 파라미터 가져오기
	            const urlParams = new URLSearchParams(window.location.search);

	            // rano 파라미터 가져오기
	            const ranoValue = urlParams.get('rano');
	            
	            $.ajax({
	            	url: "index_ajax.jsp",
	            	type : "get",
	            	dataType : "text",
	            	data : "rano=" + ranoValue,
	            	error : function(xhr){
	            		console.log(xhr.status);
	            	},
	            	success : function(gsno){
	            		gasData(gsno);
	            	}
	            })*/
	
	            // gsno 값을 사용하여 API 호출
	            
	            
	            var rac = '000048';
	            gasData(rac);
	            
	            var foodData = "";
	            
	            
	            function gasData(rac){
		            if (rac) {
		            	var key = '3332053980';
		                var apiUrl = " http://data.ex.co.kr/openapi/restinfo/restBrandList?key="
		                		+key+"&type=json&numOfRows=100&pageNo=1&stdRestCd=" + rac;
		                
		
		                // jQuery를 사용하여 API 요청 보내기
		                $.ajax({
		                    url: apiUrl,
		                    method: 'GET',
		                    dataType: 'json',
		                    success: function(jsonData) {
		                        // API 응답 데이터를 처리
		                        console.log('휴게소음식 : ',jsonData); 
		                        data(jsonData);
		                        var foodList=jsonData.list
		                        var sel=document.getElementById("sel");
		                        var data1="";
		                       for(var i=0 ; i < foodList.length ; i++){
		                    	   data1=foodList[i];
		                    	   sel.options[i]=new Option( data1.brdName, data1.brdName+"/"+data1.stdRestCd
		                    			   +"/"+data1.brdDesc);
		                    	   
		                       }//end for

		                    },
		                    error: function(jqXHR, textStatus, errorThrown) {
		                        console.error('Request failed:', errorThrown);
		                    }
		                });//ajax
		            }//end if
	            }//gasdata
	            
	            function data(json){
	            	
	            }
	            
	            $("#btnAdd").click(function(){
					alert($("#sel").val())	 
					
					var foodData = $("#sel").val();
					
					$.ajax({
	            		url :"addfood_ajax.jsp",
	            		type: 'POST',
	            		data : "foodData="+foodData,
	            		dataType: 'json',
	            		error: function(xhr){
	            			alert("서버에서 문제가 발생하였습니다.");
	                        console.log(xhr.status);
	            		},
	            		success: function(jsonData){
	            			if (jsonData.status == "success") {
	                            alert("추가완료.");
	                        } else {
	                            alert("추가 중 오류가 발생했습니다: " + jsonData.message);
	                        }
	            		}
					
	            });//$ajax
	            
	            });//$click
	            
		      });//ready
		      
		      
		      
		        
            </script>
            <!-- <select id="sel" name="sel">
            </select>
            <input type="button" value="추가" id="btnAdd"/> -->
            <!-- food section-->
            <section class="py-5" id="food">
                <div class="container px-5 my-5">
                    <div class="row gx-8" style="width: 1500px; margin 0 auto">
                        <div class="col-lg-2 mb-5 mb-lg-0 bg-success"><h2 class="fw-bolder mb-0 bg-success">먹거리</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">

								<div id="carouselFood" class="carousel slide" style="width: 1500px; height: 400px">
								  <!-- <div class="carousel-indicators">
								    <button type="button" data-bs-target="#carouselFood" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								    <button type="button" data-bs-target="#carouselFood" data-bs-slide-to="1" aria-label="Slide 2" class="btn btn-success"></button>
								    <button type="button" data-bs-target="#carouselFood" data-bs-slide-to="2" aria-label="Slide 3"></button>
								  </div> -->
								  <div class="carousel-inner">
									<%
								      List<FoodVO> foodList = rDAO.selectFood("1");
								      for(int i=0; i<foodList.size(); i++){
											FoodVO fVO = foodList.get(i);
								      %>
								    <div class="carousel-item<%= i==0?" active":"" %>">
								      <div style="width: 950px; height:400px margin: 0px auto; border: 1px solid #D2D2D2; border-radius: 10px">
								      <img src="images/kj2.png" style=" width:950px; height:300px; margin-bottom: 10px; border-radius: 10px"><br/>
								      <div style="margin-left: 100px; margin-right: 100px">
								      <strong><%=fVO.getFoodName() %></strong>
								      <ul>
								      	<li><%=fVO.getFoodDetail() %></li>
								      	<li><%=fVO.getFoodPrice() %>원</li>
								      </ul>
								      </div>
								      
								      </div>
								    </div>
								      <%
								      }
								      %>
								  </div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carouselFood" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselFood" data-bs-slide="next">
								    <span class="carousel-control-next-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- review section-->
            <section class="py-5" id="review">
                <div class="container px-5 my-5">
                    <div class="row gx-8" style="width: 1500px; margin 0 auto">
                        
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">

								<div id="carouselReview" class="carousel slide" style="width: 1500px; height: 400px">
								  <div class="carousel-indicators">
								    <button type="button" data-bs-target="#carouselReview" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								    <button type="button" data-bs-target="#carouselReview" data-bs-slide-to="1" aria-label="Slide 2" class="btn btn-success"></button>
								    <button type="button" data-bs-target="#carouselReview" data-bs-slide-to="2" aria-label="Slide 3"></button>
								  </div>
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      페이지1 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
								    </div>
								    <div class="carousel-item">
								      페이지2
								    </div>
								    <div class="carousel-item">
								      페이지3
								    </div>
								  </div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carouselReview" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselReview" data-bs-slide="next">
								    <span class="carousel-control-next-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>

                            </div>
                        </div>
                        <div class="col-lg-2 mb-5 mb-lg-0 bg-success"><h2 class="fw-bolder mb-0">리뷰</h2></div>
                    </div>
                </div>
            </section>
            <!-- conv section-->
            <section class="py-5" id="conv">
                <div class="container px-5 my-5">
                    <div class="row gx-8" style="width: 1500px; margin 0 auto"> 
                        <div class="col-lg-2 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">편의 시설</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">

								<div id="carouselConv" class="carousel slide" style="width: 1500px; height: 400px">
								  <div class="carousel-indicators">
								    <button type="button" data-bs-target="#carouselConv" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								    <button type="button" data-bs-target="#carouselConv" data-bs-slide-to="1" aria-label="Slide 2" class="btn btn-success"></button>
								    <button type="button" data-bs-target="#carouselConv" data-bs-slide-to="2" aria-label="Slide 3"></button>
								  </div>
								  <div class="carousel-inner">
								    <%
								      List<ConvVO> convList = rDAO.selectConv("1");
								      for(int i=0; i<convList.size(); i++){
											ConvVO cVO = convList.get(i);
								      %>
								    <div class="carousel-item<%= i==0?" active":"" %>">
								      <div style="width: 950px; margin: 0px auto; border: 1px solid #D2D2D2; border-radius: 10px">
								      <img src="images/kj.png" style=" height:300px; margin-bottom: 10px"><br/>
								      <strong><%=cVO.getConvName() %></strong><br/>
								      <%=cVO.getConvDetail() %><br/>
								      </div>
								    </div>
								      <%
								      }
								      %>
								  </div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carouselConv" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselConv" data-bs-slide="next">
								    <span class="carousel-control-next-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- brand section-->
            <section class="py-5" id="brand">
                <div class="container px-5 my-5">
                    <div class="row gx-8" style="width: 1500px; margin 0 auto">
                        
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">

								<div id="carouselBrand" class="carousel slide" style="width: 1500px; height: 400px">
								  <div class="carousel-indicators">
								    <button type="button" data-bs-target="#carouselBrand" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								    <button type="button" data-bs-target="#carouselBrand" data-bs-slide-to="1" aria-label="Slide 2" class="btn btn-success"></button>
								    <button type="button" data-bs-target="#carouselBrand" data-bs-slide-to="2" aria-label="Slide 3"></button>
								  </div>
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      페이지1 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
								      <div class="carousel-caption d-none d-md-block">
								        <h5>First slide label</h5>
								        <p>Some representative placeholder content for the first slide.</p>
								      </div>
								    </div>
								    <div class="carousel-item">
								      페이지2
								      <div class="carousel-caption d-none d-md-block">
								        <h5>Second slide label</h5>
								        <p>Some representative placeholder content for the second slide.</p>
								      </div>
								    </div>
								    <div class="carousel-item">
								      페이지3
								      <div class="carousel-caption d-none d-md-block">
								        <h5>Third slide label</h5>
								        <p>Some representative placeholder content for the third slide.</p>
								      </div>
								    </div>
								  </div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carouselBrand" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselBrand" data-bs-slide="next">
								    <span class="carousel-control-next-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>

                            </div>
                        </div>
                        <div class="col-lg-2 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">매장</h2></div>
                    </div>
                </div>
            </section>
            <!-- gas section-->
            <!-- <script>
            $(function(){
	            
	         // 현재 URL에서 파라미터 가져오기
	            const urlParams = new URLSearchParams(window.location.search);

	            // rano 파라미터 가져오기
	            const ranoValue = urlParams.get('rano');
	            
	            $.ajax({
	            	url: "index_ajax.jsp",
	            	type : "get",
	            	dataType : "text",
	            	data : "rano=" + ranoValue,
	            	error : function(xhr){
	            		console.log(xhr.status);
	            	},
	            	success : function(gsno){
	            		gasData(gsno);
	            	}
	            })
	        })
	
	            // gsno 값을 사용하여 API 호출
	            function gasData(gsno){
		            if (gsno) {
		            	var key = '3332053980';
		                var apiUrl = "http://data.ex.co.kr/openapi/business/curStateStation?key="
		                		+key+"&type=json&numOfRows=10&pageNo=1&serviceAreaCode2=" + gsno;
		
		                // jQuery를 사용하여 API 요청 보내기
		                $.ajax({
		                    url: apiUrl,
		                    method: 'GET',
		                    dataType: 'json',
		                    success: function(jsonData) {
		                        // API 응답 데이터를 처리
		                        console.log(jsonData);
		                     // 변수에 데이터 저장
		                        var list = jsonData.list[0];
		                        
		                        // 주유소 정보 표시
		                        if (list) {
		                            document.getElementById("gasStation").textContent = list.serviceAreaName;
		                            document.getElementById("gasStationNumber").textContent = list.telNo;
		                        } else {
		                            console.error('No data available for the given criteria.');
		                        }
		                        
		                        // 유가 정보 표시
		                        if (list) {
		                            document.getElementById("gasolinePrice").textContent = list.gasolinePrice;
		                            document.getElementById("dieselPrice").textContent = list.diselPrice;
		                        } else {
		                            console.error('No data available for the given criteria.');
		                        }

		                        // LPG 정보 표시
		                        if (list && list.lpgYn === 'Y') {
		                            const lpgRow = document.createElement("tr");
		                            const lpgType = document.createElement("th");
		                            lpgType.setAttribute("scope", "row");
		                            lpgType.textContent = "LPG";
		                            const lpgPrice = document.createElement("td");
		                            lpgPrice.textContent = list.lpgPrice;

		                            const fuelInfoTable = document.getElementById("fuelInfoTable");
		                            const fuelInfoTbody = fuelInfoTable.querySelector("tbody");

		                            lpgRow.appendChild(lpgType);
		                            lpgRow.appendChild(lpgPrice);
		                            fuelInfoTbody.appendChild(lpgRow);
		                        }
		                    },
		                    error: function(jqXHR, textStatus, errorThrown) {
		                        console.error('Request failed:', errorThrown);
		                    }
		                });
		            }
	            }
            </script> -->

            
            <section class="py-5" id="gas">
                <div class="container px-5 my-5">
                    <div class="row gx-8" style="width: 1500px; margin 0 auto">
                        <div class="col-lg-2 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">주유 시설</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">

								<div id="carouselGas" class="carousel slide" style="width: 1500px; height: 400px">
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <table class='table'>
								      	<thead>
										    <tr>
										      <th scope="col">주유소 정보</th>
										    </tr>
										 </thead>
										 <tbody>
									     <tr>
										      <th scope="row">주유소 명</th>
										      <td id="gasStation"></td>
										 </tr>
									     <tr>
										      <th scope="row">전화 번호</th>
										      <td id="gasStationNumber"></td>
										 </tr>
										 </tbody>
								      </table>
								      <table class='table' id="fuelInfoTable">
								      	<thead>
										    <tr>
										      <th scope="col">유가 정보</th>
										    </tr>
										 </thead>
										 <tbody>
									     <tr>
										      <th scope="row">휘발유</th>
										      <td id="gasolinePrice"></td>
										 </tr>
									     <tr>
										      <th scope="row">경유</th>
										      <td id="dieselPrice"></td>
										 </tr>
										 </tbody>
								      </table>
								      <!-- <div class="carousel-caption d-none d-md-block" id='info'>
								        <h5>First slide label</h5>
								        <p>Some representative placeholder content for the first slide.</p>
								      </div> -->
								    </div>
								  </div>
								</div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            </div>
        </main>
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2023</div></div>
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
        <script src="js/scripts.js"></script>
    </body>
</html>
