<%@page import="ra.user.restarea.ConvVO"%>
<%@page import="ra.user.restarea.BrandVO"%>
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
<%
String sesId=(String)session.getAttribute("sesId");
pageContext.setAttribute("sesId", sesId);
%>
	function updateReport(rvNum){
		if(${empty sesId}){
			alert("로그인 후 리뷰를 신고할 수 있습니다.")
			location.href="../login/Client_login.jsp"
			return;
		}
		var confirmation = confirm('리뷰를 신고하시겠습니까?');
		   
		   if(confirmation){
		 $.ajax({
	           url: "addReport_ajax.jsp",
	           type: "POST",
	           data: { rvNum: rvNum },
	           dataType: "text",
	           error: function(xhr){
	               alert("서버에서 문제가 발생하였습니다.");
	               console.log(xhr.status);
	           },
	           success: function(jsonObj){
	                   alert("리뷰가 신고되었습니다.");
	           }
	       });//ajax
	   }else{
		   alert("신고하기가 취소되었습니다.");  
		}//end else
	}//click
	
$(function(){
	
   $("#btnReview").click(function(){
	   var confirmation = confirm('리뷰를 등록하시겠습니까?');
	   
	   if(confirmation){
       // 데이터를 수집하거나 사용자 입력을 가져옵니다.
       var reviewDetail = $("#inputReview").val(); 
       var reviewScore = $("#selectScore").val(); 
       var restareaNum = $("#raNum").val();

       if (reviewDetail === "") {
           alert("리뷰를 입력해주세요");
       } else if(reviewScore === "평점"){
    	   alert("평점을 선택해주세요");
       }else{
       
    	   if(${empty sesId}){
   			alert("로그인 후 리뷰를 작성할 수 있습니다.")
   			location.href="../login/Client_login.jsp"
   			return;
   		}
	       // 데이터를 객체로 구성
	       var data = {
	    		reviewDetail: reviewDetail,
	    		reviewScore: reviewScore ,
	    		restareaNum: restareaNum ,
	    		userId: "${sesId}"
	       };
	
	       // AJAX 요청을 수행
	       $.ajax({
	           url: "addReview_ajax.jsp",
	           type: "POST",
	           data: data,
	           dataType: "json",
	           error: function(xhr){
	               alert("서버에서 문제가 발생하였습니다.");
	               console.log(xhr.status);
	           },
	           success: function(jsonObj){
	                   alert("리뷰가 등록되었습니다.");
	                   location.reload(); // 현재 페이지를 새로 고침
	           }
	       });//ajax
       }
			}else{
			   alert("리뷰 등록이 취소되었습니다.");  
			}//end else
   });//click
});//ready
</script>
    </head>
    <body class="d-flex flex-column h-100">
    <input type="hidden" name="raNum" id="raNum" value="<%=request.getParameter("rano")%>">
    <%
    String rano = request.getParameter("rano");
    RestDAO rDAO = RestDAO.getInstance();
    ReviewDAO rvDAO = ReviewDAO.getInstance();
    AddRestDAO arDAO = AddRestDAO.getInstance();
    ReviewVO rvVO = new ReviewVO();
    %>
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <jsp:include page="../myinfo_nav/include_nav.jsp"></jsp:include>
            <!-- Header-->
            <header class="bg-success py-1">
                <div class="container px-1">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                            <%
                            RestAreaVO raVO = rDAO.selectRestArea(rano);
                            %>
                                <h1 class="display-5 fw-bolder text-white mb-2"><%=raVO.getRestAreaName() %></h1>
                                <p class="lead fw-normal text-white-50 mb-4">주소: <%=raVO.getAddress() %></p>
                                <p class="lead fw-normal text-white-50 mb-4">전화번호: <%=raVO.getTel() %></p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-outline-light btn-lg px-4" href="#food">먹거리</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#brand">매장</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#conv">편의시설</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#gas">주유시설</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#review">리뷰</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="../../common/logo_images/raimage.png" alt="..." /></div>
                    </div>
                </div>
            </header>
            <div style="background-color: #E9ECED;">
            
             <script>
            $(function(){
	            
		      });//ready
		      
            </script>
            <!-- food section-->
            <section class="py-5" id="food">
                <div class="container px-5 my-5">
                    <div class="row gx-8" style="width: 1500px; margin 0 auto">
                        <div class="col-lg-2 mb-5 mb-lg-0 bg-success" style="border-radius: 10px">
                        <h2 class="fw-bolder mb-0 bg-success" style="margin-top: 10px">먹거리</h2>
                        </div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">

								<div id="carouselFood" class="carousel slide" style="width: 1500px; height: 400px">
								  <div class="carousel-inner">
									<%
								  	List<FoodVO> foodList = rDAO.selectFood(rano);
									String fDetail = "";
								    for(int i=0; i<foodList.size(); i++){
										FoodVO fVO = foodList.get(i);
 										fDetail=fVO.getFoodDetail();
										if(fDetail==null){
											fDetail="";
										}
 								      %>
								    <div class="carousel-item<%= i==0?" active":"" %>">
								      <div style="width: 950px; height:400px margin: 0px auto; border-radius: 10px">
								      <img src="../../common/food_images/<%=fVO.getFoodImage() %>" style=" width:950px; height:280px; margin-bottom: 10px; border-radius: 10px; object-fit: cover;"/><br/>
								      <div style="margin-tom:50px; margin-left: 25px; margin-right: 25px">
								      
								      <table>
								      	<tr>
								      		<td style="border-right: 1px solid gray; padding-right: 10px;  font-size: 20px;"><strong><%=fVO.getFoodName() %></strong></td>
								      		<td style="padding-left: 10px;"><strong>￦<%=fVO.getFoodPrice() %></strong></td>
								      	<tr>
								      </table>
								      
								      
								      <hr style="background-color: #E9ECED;">
								      
								      	<%=fDetail %>
								      
								      </div>
								      
								      </div>
								    </div>
								      <%
								      }//end for
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
            <!-- brand section-->
            <section class="py-5" id="brand">
                <div class="container px-5 my-5">
                    <div class="row gx-8" style="width: 1500px; margin 0 auto">
                        
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">

								<div id="carouselBrand" class="carousel slide" style="width: 1500px; height: 400px; display: grid; place-items: center;">
								  <div class="carousel-inner" id="convItem" style="width: 950px;">
								    <%
								      List<BrandVO> brandList = rDAO.selectBrand(rano);
								    	String bDetail="";
								    	int disSize=4;
								      for(int i=0; i<brandList.size(); i+=disSize){
								      %>
								      <div class="carousel-item<%= i == 0 ? " active" : "" %>">
								      <% for (int j = i; j < i + disSize && j < brandList.size(); j++) {
										BrandVO bVO = brandList.get(j);
										bDetail = bVO.getBrandHome();
										if(bDetail==null){
											bDetail="";
										}
								      %>
								      <div id="convContent">
								      <table style=" margin-bottom: 20px">							
								      	<tr>
								      		<td><img src="../../common/icon_images/brand/<%=bVO.getBrandIcon() %>.png"><br/></td>
								      		<td><strong><%=bVO.getBrandName() %></strong><br/><%=bDetail %></td>
								      	</tr>
								      </table>
								      <hr style="background-color: #E9ECED;">
								      </div>
								     
								      <%
								      }//end for
								      %>
								      </div>
								      <%
								      }//end for
								      %>
								  </div>
								  <button style="width:50px" class="carousel-control-prev" type="button" data-bs-target="#carouselBrand" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button style="width:55px" class="carousel-control-next" type="button" data-bs-target="#carouselBrand" data-bs-slide="next">
								    <span class="carousel-control-next-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>

                            </div>
                        </div>
                        <div class="col-lg-2 mb-5 mb-lg-0 bg-success" style="border-radius: 10px">
                        <h2 class="fw-bolder mb-0" style="margin-top: 10px">매장</h2>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- conv section-->
            <section class="py-5" id="conv">
                <div class="container px-5 my-5">
                    <div class="row gx-8" style="width: 1500px; margin 0 auto"> 
                        <div class="col-lg-2 mb-5 mb-lg-0 bg-success" style="border-radius: 10px">
                        <h2 class="fw-bolder mb-0" style="margin-top: 10px">편의 시설</h2>
                        </div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">

								<div id="carouselConv" class="carousel slide" style="width: 1500px; height: 400px; display: grid; place-items: center;">
								  <div class="carousel-inner" id="convItem" style="width: 950px;">
								    <%
								      List<ConvVO> convList = rDAO.selectConv(rano);
								    	String cDetail="";
								      for(int i=0; i<convList.size(); i+=disSize){
								      %>
								      <div class="carousel-item<%= i == 0 ? " active" : "" %>">
								      <% for (int j = i; j < i + disSize && j < convList.size(); j++) {
										ConvVO cVO = convList.get(j);
										cDetail=cVO.getConvDetail();
										if(cDetail==null){
											cDetail="";
										}
								      %>
								      <div id="convContent">
								      <table style=" margin-bottom: 20px">							
								      	<tr>
								      		<td><img src="../../common/icon_images/convinient/<%=cVO.getConvIcon() %>.png"><br/></td>
								      		<td><strong><%=cVO.getConvName() %></strong><br/><%=cDetail %></td>
								      	</tr>
								      </table>
								      <hr style="background-color: #E9ECED;">
								      </div>
								     
								      <%
								      }//end for
								      %>
								      </div>
								      <%
								      }//end for
								      %>
								  </div>
								  <button style="width:50px" class="carousel-control-prev" type="button" data-bs-target="#carouselConv" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button style="width:55px" class="carousel-control-next" type="button" data-bs-target="#carouselConv" data-bs-slide="next">
								    <span class="carousel-control-next-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
			
            <!-- gas section-->
            <script>
            $(function(){
               
               // 현재 URL에서 파라미터 가져오기
                  const urlParams = new URLSearchParams(window.location.search);

                  // rano 파라미터 가져오기
                  const ranoValue = urlParams.get('rano');
                  
                  $.ajax({
                     url: "gasstaion_ajax.jsp",
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
            </script>

            
            <section class="py-5" id="gas">
                <div class="container px-5 my-5">
                    <div class="row gx-8" style="width: 1500px; margin 0 auto">
                        
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">

								<div id="carouselGas" class="carousel slide" style="width: 1500px; height: 400px; display: grid; place-items: center;">
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
                        <div class="col-lg-2 mb-5 mb-lg-0 bg-success" style="border-radius: 10px">
                        <h2 class="fw-bolder mb-0" >주유 시설</h2>
                        </div>
                    </div>
                </div>
            </section>
            <!-- review section-->
            <section class="py-5" id="review">
                <div class="container px-5 my-5">
                    <div class="row gx-8" style="width: 1500px; margin 0 auto">
                        <div class="col-lg-2 mb-5 mb-lg-0 bg-success" style="border-radius: 10px">
                        <h2 class="fw-bolder mb-0" style="margin-top: 10px">리뷰</h2>
                        </div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">

								<div id="carouselReview" class="carousel slide" style="width: 1500px; height: 550px; ">
								  <div class="carousel-inner">
								    <%
								    List<ReviewVO> reviewList = rvDAO.selectReview(rano);
								    int batchSize = 2; // 리뷰를 한 번에 표시할 개수
								    for (int i = 0; i < reviewList.size(); i += batchSize) {
								    %>
								    <div class="carousel-item<%= i == 0 ? " active" : "" %>">
								      <% for (int j = i; j < i + batchSize && j < reviewList.size(); j++) {
								        rvVO = reviewList.get(j);
								        if(rvVO.getReviewReport()<6){
								        	
								      %>
								      <div id="reviewContent" style="width: 900px; height: 120px; margin-top:15px; margin-left: 40px; border: 1px solid gray; border-radius: 10px; display: flex; align-items: center;">
								        <div style="margin-left: 25px; margin-right: 25px;">
								          <table>
								            <tr>
								              <td style="width: 700px;"><strong><%= rvVO.getUserNick() %></strong></td>
								              <td>작성일: <%= rvVO.getReviewDate() %></td>
								            </tr>
								          </table>
								          <hr style="background-color: #E9ECED;">
								          <table>
								            <tr>
								              <td style="width: 700px;"><%= rvVO.getReviewText() %></td>
								              <td style="width: 80px;">평점: <%= rvVO.getReviewScore() %>/5</td>
								              <td><input id="reviewNum" type="hidden" value="<%=rvVO.getReviewNum()%>"></td>
								              <td><button id="reportBtn" type="button" class="btn btn-outline-danger" onclick="updateReport(<%=rvVO.getReviewNum()%>)">
								              신고
								              </button></td>
								            </tr>
								          </table>
								        </div>
								      </div>
								      <br/>
								      <% 
									  	}//end if
								      } // end for
								      %>
								    </div>
								    <%
								    } // end for
								    %>
								      <div id="addReview" style="width: 900px; height: 200px; margin-left: 40px; margin-top: 330px; border: 1px solid gray; border-radius: 10px;">
								      	<table style="margin-top:10px">
								      		<tr>
								      			<td style="width: 775px;">
											      	<label style="margin-left:20px" class="form-label"><strong>리뷰 작성</strong></label>
								      			</td>
								      			<td>
											      	<select id="selectScore" style="width:100px" class="form-select form-select-sm">
													  <option selected="selected">평점</option>
													  <option value="1">1</option>
													  <option value="2">2</option>
													  <option value="3">3</option>
													  <option value="4">4</option>
													  <option value="5">5</option>
													</select>
								      			</td>
								      		</tr>
								      	</table>
								          <hr style="background-color: #E9ECED;">
								        <textarea style="width:850px; margin:0px auto;" class="form-control" id="inputReview" rows="2"></textarea>
								        <button id="btnReview" type="button" class="btn btn-outline-success" style="width: 200px; margin-top:10px; margin-left:350px">등록</button>
								      </div>
								  </div>
								  <button style="width:50px" class="carousel-control-prev" type="button" data-bs-target="#carouselReview" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button style="width:55px" class="carousel-control-next" type="button" data-bs-target="#carouselReview" data-bs-slide="next">
								    <span class="carousel-control-next-icon btn btn-success" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
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
        <script src="../../common/js/scripts.js"></script>
    </body>
</html>
