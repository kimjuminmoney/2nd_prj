<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page info="  지도검색, 길찾기 " %>
            <link rel="icon" href="http://192.168.10.144/jsp_prj/common/main/favicon.ico">
            <!-- boost -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <!-- Jquery CDN시작 -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
            <!-- 카카오 Map API -->
            <!-- <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36678bc719ca21832c0fe5e7f326ba22&libraries=services"></script> -->
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36678bc719ca21832c0fe5e7f326ba22&libraries=services"></script>
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
				  
				  .sidebar-nav li {
				    text-indent: 1.5em;
				    line-height: 2.8em;
				  }
				  
				  
				  
				  
				  .sidebar-nav li button {
				    display: block;
				    text-decoration: none;
				    color: #212529;
				  }
				  
				  .sidebar-nav li button:hover {
				    color: #fff;
				    background: rgba(255, 255, 255, 0.5);
				  } 
				  
				  .sidebar-nav > .sidebar-brand {
				    font-size: 1.3em;
				    line-height: 3em;
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
                    ps.keywordSearch(keyword, placesSearchCB,{size:10});
                }

                // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
                function placesSearchCB(data, status, pagination) {
                    if (status === kakao.maps.services.Status.OK) {

                        // 정상적으로 검색이 완료됐으면
                        // 검색 목록과 마커를 표출합니다
                        displayPlaces(data);

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
                function displayPlaces(places) {

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
                            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

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
                function getListItem(index, places) {

                    var el = document.createElement('li'),
                        itemStr = 
                        /* '<p class="p-3 mb-2 bg-dark text-white">'+(index + 1) +'</p>'+ */
                        '<div class="d-flex flex-row align-items-center">'+
/*                         '<div class="info">' + */
                        '<div class="d-flex flex-row align-items-center">'+
                        '<span id="spanNum" class="badge bg-primary rounded-pill">'+(index + 1) +'</span>'+
                        '<div class="ml-2">'+
                        '<h5>' +  places.place_name + '</h5>';
                        

                    if (places.road_address_name) {
                        itemStr += '    <span>' + places.road_address_name + '</span>' ;
                            /* '   <span class="jibun gray">' + places.address_name + '</span>' */
                    } else {
                        itemStr += '    <span>' + places.address_name + '</span>';
                    }

                    itemStr +=  '</div>'+'</div>'+'</div>'+
		                        '<div class="btn-group-vertical">'+
                    			'<input type="button" class="strBtn btn btn-primary"value="출발지">'+
                    			'<input type="button" class="endBtn btn btn-primary"value="도착지">'+
                        		'</div>';
                        		
                    			
                    el.innerHTML = itemStr;
                    el.className = 'd-flex justify-content-between';
/*                     el.className = 'item'; */
                    
                    
                    btnEvent(el,places);
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
					      'Authorization': 'KakaoAK 66627a8c409df00f4fac34dd1e77b381'
					    }
					  })
					  .then(response => response.json())
					    .then(data => {
					    // API 응답 데이터 처리
					    console.log(data);
					    
					 // 데이터를 hidden input 요소에 저장
					      var hidData = document.getElementById('hidData');
					      hidData.value = JSON.stringify(data);
					    
					    // 기존 폴리라인을 제거
					    if (polyline) {
					      polyline.setMap(null);
					    }
					    // 새로운 폴리라인을 그림
					    polyline = createPolyline(data);
					    polyline.setMap(map);
					  })
					  .catch(error => {
					    // 오류 처리
					    console.error(error);
					  });
					} 
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
				    strokeColor: '#000000',
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
                        alert("출발지 버튼이 클릭되었습니다!");
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
                        alert("도착지 버튼이 클릭되었습니다!");
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

                  // 마커가 표시될 위치입니다
                  var markerPosition = new kakao.maps.LatLng(Y, X);

                  // 마커를 생성합니다
                  var marker = new kakao.maps.Marker({
                    map: map,
                    position: markerPosition,
                    clickable: true,
                    title: hiddenValue.getAttribute("data-place-name")
                  });

                  // 마커가 지도 위에 표시되도록 설정합니다
                  marker.setMap(map);

                  // 마커 이벤트 등록
                  // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
                  var iwContent = '<div style="padding:5px;">' + hiddenValue.getAttribute("data-place-name") + '</div';
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
                
              	
              	
				function setCenter() {            
				    // 이동할 위도 경도 위치를 생성합니다 
				    var moveLatLon = new kakao.maps.LatLng(37.4993118,127.0331422);
				    
				    // 지도 중심을 이동 시킵니다
				    map.panTo(moveLatLon);
				}

				function panTo( latLng ) {
				    // 이동할 위도 경도 위치를 생성합니다 
				    var tempLatLng=latLng.split(",");
				    var moveLatLon = new kakao.maps.LatLng(tempLatLng[0],tempLatLng[1] );
				    
				    // 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
				    map.panTo(moveLatLon);            
				}        
				
				
				
				
				//다영
				
				var map ;
				window.onload=function(){ //기본 지도 위치는 서울 시청
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(37.56680618275856, 126.97865226396553),
					level: 13
				};
		
				map = new kakao.maps.Map(container, options);
				}//onload
				
				/* function setCenter() {            
			    // 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new kakao.maps.LatLng(37.46706395633558, 126.97308517871186);
			    
			     
			    // 지도 중심을 이동 시킵니다
			    map.panTo(moveLatLon);
				}*/
				
				
				function panTo( latLng ) {
			    // 이동할 위도 경도 위치를 생성합니다 
			    var tempLatLng=latLng.split(",");
			    var moveLatLon = new kakao.maps.LatLng(tempLatLng[0],tempLatLng[1], tempLatLng[2],
			    		tempLatLng[3],tempLatLng[4],tempLatLng[5],tempLatLng[6],tempLatLng[7],
			    		tempLatLng[8],tempLatLng[9],tempLatLng[10],tempLatLng[11],tempLatLng[12],
			    		tempLatLng[13],tempLatLng[14]);
			    
			    // 지도 중심을 부드럽게 이동시킵니다
			    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			    map.panTo(moveLatLon);            
				}        
            	  
                
            </script>
          <style type="text/css">

           </style>


			<script type="text/javascript">
			/* var arr=["36.521262837135794, 127.08059923438643", "36.521262837135794, 127.08059923438643",
					"36.521262837135794, 127.08059923438643", "36.658823851198, 126.67277789438113", "36.6353144624646, 127.49146431652277", 
					"36.35048259471354, 127.38482899946409", "34.816043439644275, 126.46280006087093", "35.820195455176155, 127.10898501017087", 
					"35.16005239546396, 126.85163828080933", "35.23768689993227, 128.69192143849028","36.57597416220703, 128.505798268333",
					"35.8713631180291, 128.60180736020476","35.53957875859995, 129.31160847733696", "35.179707926039455, 129.07508354364657"]; */
					
					$("#seoul").click( function(){ //37.56680618275856, 126.97865226396553
						$("#hidden").submit();
					} );
					
					$("#InCheon").click( function(){ //36.521262837135794, 127.08059923438643
						$("#hidden").submit();
					} );
					
					$("#gyeongGiDo").click( function(){ //36.521262837135794, 127.08059923438643
						$("#hidden").submit();
					} );
					
					$("#gangWon").click( function(){ //36.521262837135794, 127.08059923438643
						$("#hidden").submit();
					} );
					
					$("#chungNam").click( function(){ //36.658823851198, 126.67277789438113
						$("#hidden").submit();
					} );
					
					$("#chungBug").click( function(){ //36.6353144624646, 127.49146431652277
						$("#hidden").submit();
					} );
					
					$("#daeJeon").click( function(){ //36.35048259471354, 127.38482899946409
						$("#hidden").submit();
					} );
					
					$("#jeonNam").click( function(){ //34.816043439644275, 126.46280006087093
						$("#hidden").submit();
					} );
					
					$("#jeonBug").click( function(){ //35.820195455176155, 127.10898501017087
						$("#hidden").submit();
					} );
					
					$("#gwangJu").click( function(){ //35.16005239546396, 126.85163828080933
						$("#hidden").submit();
					} );
					
					$("#gyeongNam").click( function(){ //35.23768689993227, 128.69192143849028
						$("#hidden").submit();
					} );
					
					$("#gyeongBug").click( function(){ //36.57597416220703, 128.505798268333
						$("#hidden").submit();
					} );
					
					$("#daeGu").click( function(){ //35.8713631180291, 128.60180736020476
						$("#hidden").submit();
					} );
					
					$("#ulSan").click( function(){ //35.53957875859995, 129.31160847733696
						$("#hidden").submit();
					} );
					
					$("#buSan").click( function(){ //35.179707926039455, 129.07508354364657
						$("#hidden").submit();
					} );
					
					$("#jeJu").click( function(){ 
						$("#hidden").submit();
					} );
					
			</script>
			</head>
			<body>
             
             <!-- 다영 -->
            <%--  <%
			LocalRestDAO lDao = LocalRestDAO.getInstance();
			LocalSearchVO lsVO = new LocalSearchVO();
			
			String field=request.getParameter("field");
			String keyword=request.getParameter("keyword");
			
			/* 페이지가 최초 호출 시에는 field나 keyword가 없다. 
			검색을 하지 않는 경우에도 값이 없다. */
			lsVO.setPointX(request.getParameter("pointX"));
			lsVO.setPointY(request.getParameter("pointY"));
	
             %>
            </body>
            
            <tbody>
			<!-- list가 존재하지 않을 경우 -->
			<c:if test="${ empty localrestList }">
				<tr>
					<td colspan="8" style="text-align: center;"> 
						회원정보가 존재하지 않습니다. </td>
				</tr>
			</c:if>
			
			<!-- list가 존재하는 경우 -->
			<c:forEach var="localName" items="${ localrestList }" varStatus="i">
				<tr>
					<td><c:out value="${ localrestList.localName }"/></td>
					<td><a href="#void" onclick="memberDetail('${ localrestList.localName }')"><c:out value="${ member.name }"/></a></td>
				</tr>
			</c:forEach>
		</tbody> --%>
