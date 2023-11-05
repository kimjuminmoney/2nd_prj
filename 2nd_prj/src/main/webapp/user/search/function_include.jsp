<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                }//searchPlaces

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
                }//placesSearchCB

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
                }//displayPlaces

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
			            			'<a href="../ra_page/restarea_page.jsp?rano=' + places.rano + '"type="button"'+
			            			' class="strBtn btn btn-success"value="휴게소번호" style="padding-top: 15px;">상세보기</a>'+
			                		'</div>';
                    }    		
                    			
                    el.innerHTML = itemStr;
                    el.className = 'd-flex justify-content-between';
/*                     el.className = 'item'; */
                    
                    if(flag){
                   		btnEvent(el,places);
                    }
                    return el;
                }//getListItem
                
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
                }//addMarker

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
					    var flag = data.routes[0].result_code;
					    if(flag != 0){
					    	alert("경로를 다시 확인해주세요.")
					    	return;
					    }
					   sendDirectionDataToServer(data);
					   
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
        }//createPagination

     // 데이터를 페이지네이션에 맞게 휴게소 표시하는 함수
        function displayPageData(page, data) {
            // 이 예제에서는 페이지 번호와 해당 페이지의 데이터를 콘솔에 출력합니다.
            console.log('Page', page, 'data:', data);
            var flag = false;
			displayPlaces(data, flag); 
        }//displayPageData




                /*  `````````````````````````````````````````````````````````````````````````````````````````````*/
                /* 검색결과 데이터 세션에 저장 메소드 */
				function sendDirectionDataToServer(data) {
               		// 클라이언트에서 데이터 추출
					const guides = data.routes[0].sections[0].guides;
                	//const filteredNames = guides.filter(guide => guide.name.includes('휴게소')).map(guide => guide.name);
                	//console.log(filteredNames);
                	
					// 서버로 보낼 데이터 준비
					//var sendData = JSON.stringify(filteredNames);
					var sendData = JSON.stringify(guides);
					
					$.ajax({
						url: '../search/search_ajax.jsp', // 서버의 URL
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
				}//createPolyline
            	
            	
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
                	});
              	}
              	
              	function resetFunction(){
              		 // 지도에 표시되고 있는 마커를 제거합니다
              		if(markers){
              			removeMarker();
              		};
                 	// 이전 마커가 존재하는 경우 제거
	                  if (strMarker) {
	                    strMarker.setMap(null);
	                  } 
				 		if (endMarker) {
	                    endMarker.setMap(null);
	                  }
				 	// 기존 폴리라인을 제거
					    if (polyline) {
					      polyline.setMap(null);
					    }
					 // 이미 열려있는 인포윈도우가 있다면 닫기
					    if (infowindow) {
					        infowindow.close(); 
					    }
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

                        var paginationEl = document.getElementById('pagination')

	                    // 기존에 추가된 페이지번호를 삭제합니다
	                    while (paginationEl.hasChildNodes()) {
	                        paginationEl.removeChild(paginationEl.lastChild);
	                    }
                        //리셋 펑션
					    resetFunction();
                        
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
            
          



