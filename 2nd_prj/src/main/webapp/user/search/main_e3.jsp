<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page info="  지도검색, 길찾기 " %>
 <link rel="icon" href="http://192.168.10.151/jsp_prj/common/main/favicon.ico">
 <!-- boost -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <!-- Jquery CDN시작 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 <!-- 카카오 Map API -->
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=768c6f1c275d1694e36faed4cbb9f196&libraries=services"></script>
     
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
 <meta name="description" content="" />
 <meta name="author" content="" />
 <!-- Favicon-->
 <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
 <!-- Bootstrap icons-->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
 <!-- Core theme CSS (includes Bootstrap)-->
            
            <!-- 카카오 style -->
            <style>
                .map_wrap,
                .map_wrap * {
                    margin: 0;
                    padding: 0;
                    font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
                    font-size: 12px;
                }

                .map_wrap a,
                .map_wrap a:hover,
                .map_wrap a:active {
                    color: #000;
                    text-decoration: none;
                }

                .map_wrap {
                    position: relative;
                    width: 100%;
                    height: 500px;
                }

                #menu_wrap {
                    position: relative ;  
                    top: 0;
                    left: 0;
                    bottom: 0;
                    width: 250px;
                    margin: 0px 0 0px 0px;
                    padding: 5px;
                    overflow-y: auto;
                    background: rgba(255, 255, 255);
                    z-index: 1;
                    font-size: 12px;
                    
                }

                .bg_white {
                    background: #EAEAEA;
                }

                #menu_wrap hr {
                    display: block;
                    height: 1px;
                    border: 0;
                    border-top: 2px solid #5F5F5F;
                    margin: 3px 0;
                }

                #menu_wrap .option {
                    text-align: center;
                }

                #menu_wrap .option p {
                    margin: 10px 0;
                }

                #menu_wrap .option button {
                    margin-left: 5px;
                }

                #placesList li {
                    list-style: none;
                }

                #placesList .item {
                    position: relative;
                    border-bottom: 1px solid #888;
                    overflow: hidden;
                    cursor: pointer;
                    min-height: 65px;
                }

                #placesList .item span {
                    display: block;
                    margin-top: 4px;
                }

                #placesList .item h5,
                #placesList .item .info {
                    text-overflow: ellipsis;
                    overflow: hidden;
                    white-space: nowrap;
                }

                #placesList .item .info {
                    padding: 10px 0 10px 55px;
                }

                #placesList .info .gray {
                    color: #8a8a8a;
                }

                #placesList .info .jibun {
                    padding-left: 26px;
                    background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
                }

                #placesList .info .tel {
                    color: #009900;
                }

                #placesList .item .markerbg {
                    float: left;
                    position: absolute;
                    width: 36px;
                    height: 37px;
                    margin: 10px 0 0 10px;
                    background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
                }

                #placesList .item .marker_1 {
                    background-position: 0 -10px;
                }

                #placesList .item .marker_2 {
                    background-position: 0 -56px;
                }

                #placesList .item .marker_3 {
                    background-position: 0 -102px
                }

                #placesList .item .marker_4 {
                    background-position: 0 -148px;
                }

                #placesList .item .marker_5 {
                    background-position: 0 -194px;
                }

                #placesList .item .marker_6 {
                    background-position: 0 -240px;
                }

                #placesList .item .marker_7 {
                    background-position: 0 -286px;
                }

                #placesList .item .marker_8 {
                    background-position: 0 -332px;
                }

                #placesList .item .marker_9 {
                    background-position: 0 -378px;
                }

                #placesList .item .marker_10 {
                    background-position: 0 -423px;
                }

                #placesList .item .marker_11 {
                    background-position: 0 -470px;
                }

                #placesList .item .marker_12 {
                    background-position: 0 -516px;
                }

                #placesList .item .marker_13 {
                    background-position: 0 -562px;
                }

                #placesList .item .marker_14 {
                    background-position: 0 -608px;
                }

                #placesList .item .marker_15 {
                    background-position: 0 -654px;
                }
                
                
 
                #pagination {
                    margin: 10px auto;
                    text-align: center;
                }

                #pagination a {
                    display: inline-block;
                    margin-right: 10px;
                }

                #pagination .on {
                    font-weight: bold;
                    cursor: default;
                    color: #777;
                }
                
                
            </style>
            
            <!-- 수정 CSS -->
            <!-- <style>
            	#features {
            	height: 800px;
            	 margin-top: -40px; 
            	}
            	.navbar navbar-expand-lg navbar-dark bg-dark{
            	margin: 0px;
            	}
            	
            	#div-wrapper{
            	height: 800px;
            	}
            	#map{
            	width: 70%;
            	height: 800px;
            	
            	}*/
            	
            	.nav-link {
				    width: 120px; /* 버튼의 폭을 조절합니다. */
				   /* height: 40px; /* 버튼의 높이를 조절합니다. */
				   /* padding: 5px; /* 버튼 내부 여백을 설정합니다. */
				   /*font-size: 16px; /* 폰트 크기를 조절합니다. */
				}
            
                
            </style> -->
            <!-- 수정 CSS -->
            
			<!-- 사이드바 래퍼 스타일 --> 
            <style>
				  
				  #page-wrapper {
				    padding-left: 100px;
				    /* width: 120px; */
				    
				  }
				  
				  #sidebar-wrapper {
				    position: fixed; 
				    width: 120px; 
				    height: 100%; 
				    margin-left: -120px;
				    background: #212529;
				    overflow-x: hidden;
				    overflow-y: auto;
				  }
				  
				  #page-content-wrapper {
				    width: 100%;
				    padding: 20px;
				  }
				  /* 사이드바 스타일 */
				  
				  .sidebar-nav {
				    width: 250px;
				    margin: 0;
				    padding: 0;
				    list-style: none;
				  }
				  
				   /* .sidebar-nav li {
				    text-indent: 1.5em;
				    line-height: 2.8em;
				  } */
				  
				  .nav.nav-tabs li {
				  
				  text-indent: 1.5em;
				  line-height: 2.8em;
				  font-size: 16px;
				  color: white;
				  
				}
				  
				  
				  
				  
				  /* .sidebar-nav li input {
				    display: block;
				    text-decoration: none;
				    color: #212529;
				    width: 200px;
				    
				  }  */
				  .nav-tabs .nav-link {
				    display: block;
				    text-decoration: none;
				    color: #FFFFFF;
/* 				    color: #212529; */
				    width: 95px;
				    font-family: '맑은 고딕';
				  }  
				  
				  .sidebar-nav li button:hover {
				    color: #fff;
				    background: rgba(255, 255, 255, 0.5);
				  } 
				  
				  .sidebar-nav > .sidebar-brand {
				    font-size: 1.3em;
				    line-height: 3em;
				  }
				  /
				  .nav-tabs .nav-link {
				    width: 180px;  /* 버튼의 폭을 조절합니다.  */
				    height: 180px;  /* 버튼의 높이를 조절합니다.  */
				    padding: 5px;  /* 버튼 내부 여백을 설정합니다.  */
				   font-size: 16px; /*  폰트 크기를 조절합니다.  */
				   /* white-space: nowrap; */
				   
				}
				 
				</style>
				
				<style>
				    body, html {
				        height: 100%;
				        margin: 0;
				        padding: 0;
                        
				    }
				
				    header, footer {
				        height: 5%;
				        /* background: lightgray; */
				    }
				
				    section {
				        height: 836px;
				        display: flex;
				        align-items: center;
				        justify-content: center;
				        padding-top: 0px;
						padding-bottom: 0px;
				    }
				
				    #all-wrapper {
				        display: flex;
				        /* justify-content: space-between; */
				        width: 100%;
				        height: 750px;
				        flex-wrap: nowrap;
				        /* max-width: 800px; */ /* 섹션 내부의 최대 너비 조절 */
				    }
				
				    #page-wrapper{
				        width: 100px;  /* 3개의 div를 옆으로 나란히 배치 */ 
				        height: 750px;
				        /* background: lightblue; */
				        /* margin: 5px; */
				    } 
				    #menu-box{
				        width: 30%;  /* 3개의 div를 옆으로 나란히 배치 */ 
				        height: 750px;
				        background: #FFFFFF; 
				        
				        /* margin: 5px; */
				    } 
				    #map{
				        width: 60%;  /* 3개의 div를 옆으로 나란히 배치 */ 
				        height: 750px;
				        background: lightblue;
				        /* margin: 5px; */
				        flex: 1;
				    } 
				    #search{
				    	width: 100%;
                        /* display: flex; */
				    }
				    #menu_wrap{
				    	width: 100%;
				    	position: relative;
				    }
                    #search-results{
                    	flex: 1;
                        overflow: auto;
                        position: relative; 
                        height: 520px;
						
                    }
                    
                    .list-group li {
  margin-bottom: 12px;
}

.list-group-item {
}

.list li {
  list-style: none;
  padding: 10px;
  border: 2px solid #e3dada;
  margin-top: 12px;
  margin-left: 7px;
  margin-right: 5px;
  border-radius: 5px;
  background: #fff;
}
#spanNum{
	font-size: 20px;
}
.ml-2 {
 padding-left: 20px;
}

			    </style>
            
            <!-- 카카오 맵, 검색 JS  -->
            <script>
            /* ----------------------------------------------------------- */
            /* 지도생성 */
				var map
                // 마커를 담을 배열입니다
                var markers = [];
                window.onload = function () {
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                        mapOption = {
                            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };
                    // 지도를 생성합니다    
                    map = new kakao.maps.Map(mapContainer, mapOption);
            		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new kakao.maps.ZoomControl();
					map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
                }
                
                
            /* 지도생성 */
            
            /* ----------------------------------------------------------- */
            /* 지도검색 */
                // 장소 검색 객체를 생성합니다
                var ps = new kakao.maps.services.Places();

                // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
                var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

                // 키워드로 장소를 검색합니다
                /* searchPlaces(); */

                // 키워드 검색을 요청하는 함수입니다
                function searchPlaces() {
                	var keyword = document.getElementById("keyword");
                	if (keyword !== null) {
                	    var keyword = keyword.value;
                	}

                    /* var keyword = document.getElementById('keyword').value;

                    if (!keyword.replace(/^\s+|\s+$/g, '')) {
                        alert('키워드를 입력해주세요!');
                        return false;
                    } */

                    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                    ps.keywordSearch(keyword, placesSearchCB,{size:15});
                }

                // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
                function placesSearchCB(data, status, pagination) {
                    if (status === kakao.maps.services.Status.OK) {
						console.log(data);
                        // 정상적으로 검색이 완료됐으면
                        // 검색 목록과 마커를 표출합니다
                        var flag = true;
                        displayPlaces(data,flag);
	
                        // 페이지 번호를 표출합니다
                        displayPagination(pagination);

                    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                        alert('검색 결과가 존재하지 않습니다.');
                        return;

                    } else if (status === kakao.maps.services.Status.ERROR) {

                        alert('검색 결과 중 오류가 발생했습니다.');
                        return;

                    }
                }

                // 검색 결과 목록과 마커를 표출하는 함수입니다
                function displayPlaces(places, flag) {
                	

                    var listEl = document.getElementById('placesList'),
                        menuEl = document.getElementById('menu_wrap'),
                        fragment = document.createDocumentFragment(),
                        bounds = new kakao.maps.LatLngBounds(),
                        listStr = '';

                    // 검색 결과 목록에 추가된 항목들을 제거합니다
                    removeAllChildNods(listEl);

                    // 지도에 표시되고 있는 마커를 제거합니다
                    removeMarker();

                    for (var i = 0; i < places.length; i++) {

                        // 마커를 생성하고 지도에 표시합니다
                        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                            marker = addMarker(placePosition, i),
                            itemEl = getListItem(i, places[i],flag); // 검색 결과 항목 Element를 생성합니다

                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                        // LatLngBounds 객체에 좌표를 추가합니다
                        bounds.extend(placePosition);

                        // 마커와 검색결과 항목에 mouseover 했을때
                        // 해당 장소에 인포윈도우에 장소명을 표시합니다
                        // mouseout 했을 때는 인포윈도우를 닫습니다
                        (function (marker, title) {
                            kakao.maps.event.addListener(marker, 'mouseover', function () {
                                displayInfowindow(marker, title);
                            });

                            kakao.maps.event.addListener(marker, 'mouseout', function () {
                                infowindow.close();
                            });

                            itemEl.onmouseover = function () {
                            	// 클릭된 항목과 연관된 마커의 좌표를 가져옵니다
                                var markerPosition = marker.getPosition();

                                // 해당 마커의 위치로 지도를 이동합니다
                                map.panTo(markerPosition);
                                displayInfowindow(marker, title);
                            };

                            itemEl.onmouseout = function () {
                                infowindow.close();
                            };
                        })(marker, places[i].place_name);

                        fragment.appendChild(itemEl);
                    }

                    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
                    listEl.appendChild(fragment);
                    menuEl.scrollTop = 0;

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                    map.setBounds(bounds);
                }

                // 검색결과 항목을 Element로 반환하는 함수입니다
                function getListItem(index, places,flag) {

                    var el = document.createElement('li'),
                        itemStr = 
                        /* '<p class="p-3 mb-2 bg-dark text-white">'+(index + 1) +'</p>'+ */
                        '<div class="d-flex flex-row align-items-center">'+
/*                         '<div class="info">' + */
                        '<div class="d-flex flex-row align-items-center">'+
                        '<span id="spanNum" class="badge rounded-pill bg-success">'+(index + 1) +'</span>'+
                        '<div class="ml-2">'+
                        '<h5>' +  places.place_name + '</h5>';
                        

                    if (places.road_address_name) {
                        itemStr += '    <span>' + places.road_address_name + '</span>' ;
                            /* '   <span class="jibun gray">' + places.address_name + '</span>' */
                    } else {
                        itemStr += '    <span>' + places.address_name + '</span>';
                    }

                    itemStr +=  '</div>'+'</div>'+'</div>';
                    
                    if(flag){
                    	//검색하기 눌리면 출발지, 도착지 버튼 생성
	                    itemStr +=  '<div class="btn-group-vertical">'+
	                    			'<input type="button" class="strBtn btn btn-success"value="출발지">'+
	                    			'<input type="button" class="endBtn btn btn-success"value="도착지">'+
	                        		'</div>';
                    } else {
                    	//길찾기 버튼이 눌리면 상세보기
                    	// 휴게소상세페이지 생기면 href수정하기
                    	itemStr +=  '<div class="btn-group-vertical">'+
			            			'<a href="../User_jsp/index.jsp?rano=' + places.rano + '"type="button" class="strBtn btn btn-success"value="휴게소번호">상세보기</a>'+
			                		'</div>';
                    }    		
                    			
                    el.innerHTML = itemStr;
                    el.className = 'd-flex justify-content-between';
/*                     el.className = 'item'; */
                    
                    if(flag){
                    btnEvent(el,places);
                    }
                    return el;
                }
                
             // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
                function addMarker(position, idx, title) {
                    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                        imgOptions = {
                            spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                            spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                        },
                        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                        marker = new kakao.maps.Marker({
                            position: position, // 마커의 위치
                            image: markerImage
                        });

                    marker.setMap(map); // 지도 위에 마커를 표출합니다
                    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

                    return marker;
                }

                // 지도 위에 표시되고 있는 마커를 모두 제거합니다
                function removeMarker() {
                    for (var i = 0; i < markers.length; i++) {
                        markers[i].setMap(null);
                    }
                    markers = [];
                }

                // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
                function displayPagination(pagination) {
                    var paginationEl = document.getElementById('pagination'),
                        fragment = document.createDocumentFragment(),
                        i;

                    // 기존에 추가된 페이지번호를 삭제합니다
                    while (paginationEl.hasChildNodes()) {
                        paginationEl.removeChild(paginationEl.lastChild);
                    }

                    for (i = 1; i <= pagination.last; i++) {
                        var el = document.createElement('a');
                        el.href = "#";
                        el.innerHTML = i;

                        if (i === pagination.current) {
                            el.className = 'on';
                        } else {
                            el.onclick = (function (i) {
                                return function () {
                                    pagination.gotoPage(i);
                                }
                            })(i);
                        }

                        fragment.appendChild(el);
                    }
                    paginationEl.appendChild(fragment);
                }

                // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
                // 인포윈도우에 장소명을 표시합니다
                function displayInfowindow(marker, title) {
                    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>이거냐?';

                    infowindow.setContent(content);
                    infowindow.open(map, marker);
                }

                // 검색결과 목록의 자식 Element를 제거하는 함수입니다
                function removeAllChildNods(el) {
                    while (el.hasChildNodes()) {
                        el.removeChild(el.lastChild);
                    }
                }
                
            /* 지도검색 */
            /* ----------------------------------------------------------- */
            //길찾기 메소드
				var polyline = null;
                 function getKakaoDirections() {
					  // 출발지와 도착지 좌표
					  var strHidden = document.getElementById('strHidden');
					  var endHidden = document.getElementById('endHidden');
					  var origin = strHidden.getAttribute("data-place-x").substring(0, 9) + ',' + strHidden.getAttribute("data-place-y").substring(0, 9);
					  var destination = endHidden.getAttribute("data-place-x").substring(0, 9) + ',' + endHidden.getAttribute("data-place-y").substring(0, 9); 
					
					  // API 요청 URL 생성
					  var apiUrl = 'https://apis-navi.kakaomobility.com/v1/directions?origin='+origin+'&destination='+destination+
					 '&waypoints=&priority=RECOMMEND&car_fuel=GASOLINE&car_hipass=false&alternatives=false&road_details=false';
					
					  // API 호출
					  fetch(apiUrl, {
					    method: 'GET',
					    headers: {
					      'Authorization': 'KakaoAK 8b7f8f63f919e489457742800cfe5f95'
					    }
					  })
					  .then(response => response.json())
					    .then(data => {
					    // API 응답 데이터 처리
					    console.log(data);
					    
					 // 데이터를 hidden input 요소에 저장
					     /*  var hidData = document.getElementById('hidData');
					      hidData.value = JSON.stringify(data); */
					    //길찾기 결과 처리메소드
					   /*  directionFrm(data); */
					    
					    // 기존 폴리라인을 제거
					    if (polyline) {
					      polyline.setMap(null);
					    }
					    // 새로운 폴리라인을 그림
					    polyline = createPolyline(data);
					    polyline.setMap(map);
					    
					   sendDirectionDataToServer(data);
					  })
					  .catch(error => {
					    // 오류 처리
					    console.error(error);
					  });
					}//getKakaoDirections 
               //길찾기 메소드
                	
                /*  `````````````````````````````````````````````````````````````````````````````````````````````*/
// 페이지네이션을 생성하고 페이지를 클릭할 때 데이터를 표시
        function createPagination(responseData) {
            // JSON 데이터를 JavaScript 배열로 파싱
            const data = responseData;

            // 페이지당 아이템 수
            const itemsPerPage = 10;

            // 페이지네이션을 담을 엘리먼트
            const paginationElement = document.getElementById('pagination');
            
         // 이전 페이지네이션을 지우기
            while (paginationElement.firstChild) {
                paginationElement.removeChild(paginationElement.firstChild);
            }

            for (let page = 1; page <= Math.ceil(data.length / itemsPerPage); page++) {
                const li = document.createElement('li');
                li.classList.add('page-item');
                const a = document.createElement('a');
                a.classList.add('page-link');
                a.textContent = page;
                a.href = '#';

                a.addEventListener('click', function () {
                    const startIdx = (page - 1) * itemsPerPage;
                    const endIdx = Math.min(startIdx + itemsPerPage, data.length);
                    const pageData = data.slice(startIdx, endIdx);
                    displayPageData(page, pageData);
                });

                li.appendChild(a);
                paginationElement.appendChild(li);
            }
         // 최초에 1번 페이지의 데이터를 표시
            const startIdx = 0;
            const endIdx = Math.min(itemsPerPage, data.length);
            const pageData = data.slice(startIdx, endIdx);
            displayPageData(1, pageData);
        }

     // 데이터를 페이지네이션에 맞게 휴게소 표시하는 함수
        function displayPageData(page, data) {
            // 이 예제에서는 페이지 번호와 해당 페이지의 데이터를 콘솔에 출력합니다.
            console.log('Page', page, 'data:', data);
            var flag = false;
			displayPlaces(data, flag); 
            
        }




                /*  `````````````````````````````````````````````````````````````````````````````````````````````*/
                /* 검색결과 데이터 세션에 저장 메소드 */
				function sendDirectionDataToServer(data) {
               		// 클라이언트에서 데이터 추출
					const guides = data.routes[0].sections[0].guides;
                	const filteredNames = guides.filter(guide => guide.name.includes('휴게소')).map(guide => guide.name);
                	console.log(filteredNames);
                	
					// 서버로 보낼 데이터 준비
					var sendData = JSON.stringify(filteredNames);
					
					$.ajax({
						url: 'http://localhost/2nd_prj_sub/prj/v3/main_ajax.jsp', // 서버의 URL
						method: 'POST',
						contentType: 'application/json',
						data: sendData,
						success: function(responseData) {
						// 서버 응답 처리
						console.log('서버 응답:', responseData);
						// responseData를 원하는 방식으로 처리
						//페이지네이션
						createPagination(responseData);
						},
						error: function(jqXHR, textStatus, errorThrown) {
						// 오류 처리
							console.error('오류 발생:', textStatus, errorThrown);
						}
					});
				}//sendDirectionDataToServer

                
                /* 검색결과 데이터 세션에 저장 메소드 */
                /*  `````````````````````````````````````````````````````````````````````````````````````````````*/
                
                /* 폴리라인 메소드 */
				function createPolyline(routesData) {
				  const path = [];
				  
				  if (routesData.routes && routesData.routes.length > 0) {
				    const firstRoute = routesData.routes[0];
				    
				    if (firstRoute.sections && firstRoute.sections.length > 0) {
				      const roads = firstRoute.sections[0].roads;
				      
				      for (const road of roads) {
				        if (road.vertexes) {
				          const vertexes = road.vertexes;
				          for (let i = 0; i < vertexes.length; i += 2) {
				            const lng = vertexes[i];
				            const lat = vertexes[i + 1];
				            path.push(new kakao.maps.LatLng(lat, lng));
				          }//for
				        }//if
				      }//for
				    }//if
				  }//if
				  
				  return new kakao.maps.Polyline({
				    path: path,
				    strokeWeight: 5,
				    strokeColor: '#198754',
				    strokeOpacity: 0.7,
				    strokeStyle: 'solid'
				  });
				}
            	
            	
                /* 폴리라인 메소드 */
                /*  `````````````````````````````````````````````````````````````````````````````````````````````*/
                /* 추가한 메소드 */
               
                  // 출발지, 도착지 좌표값 설정
                  //input hidden에 동적으로 값 설정하기
				function setHidden(places,hidden){
					// 이미 존재하는 input 요소를 선택합니다.
					var Hidden = document.getElementById(hidden);
					
					// dataset을 사용하여 data-이름 속성을 동적으로 추가하고 값을 설정합니다.
					Hidden.setAttribute("data-place-name" , places.place_name);
					Hidden.setAttribute("data-place-x" , places.x);
					Hidden.setAttribute("data-place-y" , places.y);
				};
                    
                //검색목록, 페이지번호 삭제
                function deleteElement(){
                	 //검색목록가져오기
                    var listEl = document.getElementById('placesList')
                    //검색목록 페이지번호 가져오기
                    var paginationEl = document.getElementById('pagination') ,
                        fragment = document.createDocumentFragment(),
                        i; 
                	// 검색 결과 목록에 추가된 항목들을 제거합니다
	                removeAllChildNods(listEl); 
                	// 지도에 표시되고 있는 마커를 제거합니다
	                removeMarker();
                        
                    // 기존에 추가된 페이지번호를 삭제합니다
                    while (paginationEl.hasChildNodes()) {
                        paginationEl.removeChild(paginationEl.lastChild);
                    };
                };
				                
                //출발지, 도착지 버튼처리 이벤트
				function btnEvent(el,places){
					// 동적으로 생성된 버튼을 선택합니다.
                    var strBtn = el.querySelector(".strBtn");
                    var endBtn = el.querySelector(".endBtn");
                    //출발지, 도착지에 경로 입력
                    var strInput = document.getElementById('strInput');
                    var endInput = document.getElementById('endInput');
                    

                    // 출발지 버튼에 대한 클릭 이벤트 핸들러를 등록합니다.
                    strBtn.addEventListener("click", function() {
                        // 원하는 동작을 추가할 수 있습니다.
                        //출발지 input값 설정
                        strInput.value=places.place_name;
                        setHidden(places,"strHidden");
                        deleteElement();
                        str_end_marker("strHidden");
                        //인포윈도우 닫기
                        infowindow.close();
                    });
                    
                    endBtn.addEventListener("click", function() {
                        // 원하는 동작을 추가할 수 있습니다.
                        //도착지 input에 값 설정
                        endInput.value=places.place_name;
                        setHidden(places,"endHidden");
                        deleteElement();
                        str_end_marker("endHidden")
                        //인포윈도우 닫기
                        infowindow.close();
                    });
                  };
                
               //출발지, 도착지 마커생성
                
                var strMarker = null;
                var endMarker = null;

                function str_end_marker(hidden) {
                  var hiddenValue = document.getElementById(hidden);
                  var X = hiddenValue.getAttribute("data-place-x");
                  var Y = hiddenValue.getAttribute("data-place-y");

                  // 이전 마커가 존재하는 경우 제거
                  if (hidden === 'strHidden' && strMarker) {
                    strMarker.setMap(null);
                  } else if (hidden === 'endHidden' && endMarker) {
                    endMarker.setMap(null);
                  }
                  
               // 마커 이미지 URL 설정
                  var markerImageURL = hidden === 
               'strHidden' ? 'http://localhost/2nd_prj_sub/prj/common/icons/png/start.png' : 'http://localhost/2nd_prj_sub/prj/common/icons/png/end.png';

               // 마커 이미지 설정
                  var markerImage = new kakao.maps.MarkerImage(markerImageURL, new kakao.maps.Size(40, 40));


                  // 마커가 표시될 위치입니다
                  var markerPosition = new kakao.maps.LatLng(Y, X);

                  // 마커를 생성합니다
                  var marker = new kakao.maps.Marker({
                    map: map,
                    position: markerPosition,
                    clickable: true,
                    title: hiddenValue.getAttribute("data-place-name"),
                    image: markerImage // 마커 이미지 설정
                  });

                  // 마커가 지도 위에 표시되도록 설정합니다
                  marker.setMap(map);

                  // 마커 이벤트 등록
                  // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
                  var iwContent = '<div style="padding:5px;">' + hiddenValue.getAttribute("data-place-name") + '</div>';
                  var iwRemoveable = true;

                  // 인포윈도우를 생성합니다
                  var infowindow = new kakao.maps.InfoWindow({
                    content: iwContent,
                    removable: iwRemoveable
                  });

                  // 마커에 클릭 이벤트를 등록합니다
                  kakao.maps.event.addListener(marker, 'click', function () {
                    // 마커 위에 인포윈도우를 표시합니다
                    infowindow.open(map, marker);
                  });

                  // hidden 값에 따라 strMarker 또는 endMarker에 마커를 할당
                  if (hidden === 'strHidden') {
                    strMarker = marker;
                  } else if (hidden === 'endHidden') {
                    endMarker = marker;
                  }

                  markerEvn(marker);
                  
                  
					// 지도 범위를 재설정
					resetMapBounds();
                }
                
				// 지도 범위를 재설정하는 함수
                function resetMapBounds() {
                	if (strMarker && endMarker) {
                	var bounds = new kakao.maps.LatLngBounds();

	                // strMarker와 endMarker를 포함한 경계 설정
	                bounds.extend(strMarker.getPosition());
	                bounds.extend(endMarker.getPosition());
	
	                // 지도의 중심을 지정된 범위로 이동
	                map.setBounds(bounds);
	                }
                }

				              
              	//마커 이벤트 등록
				function markerEvn(marker){
              		kakao.maps.event.addListener(marker, 'click', function() {
                    alert('marker click!');
                	});
              	}
                
               
		            
                
            </script>
            <style type="text/css">

            </style>
            <script type="text/javascript">
                $(function () {
                	//초기화버튼
                	$("#resetBtn").click(function(){
                		// 검색 폼 초기화
                	    document.getElementById('resetBtn').form.reset();
                	    var listEl = document.getElementById('placesList')
                		
                	 // 검색 결과 목록에 추가된 항목들을 제거합니다
                        removeAllChildNods(listEl);

                        // 지도에 표시되고 있는 마커를 제거합니다
                        removeMarker();
                        
                        var paginationEl = document.getElementById('pagination')

	                    // 기존에 추가된 페이지번호를 삭제합니다
	                    while (paginationEl.hasChildNodes()) {
	                        paginationEl.removeChild(paginationEl.lastChild);
	                    }
                        
                     // 기존 폴리라인을 제거
					    if (polyline) {
					      polyline.setMap(null);
					    }
                     
					 // 이전 마커가 존재하는 경우 제거
		                  if (strMarker) {
		                    strMarker.setMap(null);
		                  } 
					 		if (endMarker) {
		                    endMarker.setMap(null);
		                  }
                        
                        
                	    // 폼 제출 방지
                	    return false;
                	})
                	//길찾기버튼
                	$("#directionsBtn").click(function(){
                		// 출발지와 도착지 입력란의 값을 가져옵니다
                	    const startInputValue = document.getElementById('strInput').value;
                	    const endInputValue = document.getElementById('endInput').value;

                	    // 출발지 또는 도착지 중 하나라도 값이 비어있을 경우
                	    if (startInputValue === '' || endInputValue === '') {
                	        // 경고 메시지를 띄웁니다
                	        alert('출발지와 도착지를 확인해주세요.');
                	        return;
                	    }
                		//길찾기 메소드
                		getKakaoDirections();
                		
                	})
                	
                	//지도검색버튼
                	$("#searchBtn").click(function(){
                		 searchPlaces(); 
                	})//click
                	$("#keyword").keypress(function(evt){
                		if (event.which === 13) { // 13은 Enter 키의 키 코드입니다.
                		 	searchPlaces(); 
                		}//end if
                	})//
                	
                })
            </script>
            
          



