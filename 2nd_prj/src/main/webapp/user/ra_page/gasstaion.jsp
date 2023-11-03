<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<!-- gas section-->
            <script>
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
            </script>

            
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