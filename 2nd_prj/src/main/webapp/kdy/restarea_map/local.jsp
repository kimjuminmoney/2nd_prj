<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
.list0, .list1, .list2, .list3, .list4, .list5, .list6, .list7, .list8, .list9, 
.list10,.list11, .list12, .list13, .list14, .list15, .list16{
	clear:both; margin-top: 200px; margin-left: 150px;
}

.list0 { position: relative; z-index: 1; top: -35px; left: -5px; } 
.list1 { position: absolute; z-index: 1; top: 260px; left: 20px; }
.list2 { position: absolute; z-index: 2; top: 215px; left: 52px; } 
.list3 { position: absolute; z-index: 3; top: 232px; left: 115px; } 
.list4 { position: absolute; z-index: 4; top: 050px; left: 88px; } 
.list5 { position: absolute; z-index: 5; top: 154px; left: 35px; } 
.list6 { position: absolute; z-index: 6; top: 074px; left: 63px; } 
.list7 { position: absolute; z-index: 7; top: 143px; left: 98px; } 
.list8 { position: absolute; z-index: 8; top: 147px; left: 128px; } 
.list9 { position: absolute; z-index: 9; top: 368px; left: 40px; } 
.list10 {position: absolute; z-index: 10; top: 112px; left: 72px; } 
.list11 { position: absolute; z-index: 11; top: 101px; left: 39px; } 
.list12 { position: absolute; z-index: 12; top: 192px; left: 96px; } 
.list13 { position: absolute; z-index: 13; top: 275px; left: 62px; } 
.list14 { position: absolute; z-index: 14; top: 223px; left: 157px; } 
.list15 { position: absolute; z-index: 15; top: 242px; left: 189px; } 
.list16 { position: absolute; z-index: 16; top: 263px; left: 179px; }
</style>
<script>
//-----------------------------------------------------------------------------------------
/* 지역별 지도 조각 */
mus1on  = new Image( );
mus1off = new Image( );
mus2on  = new Image( );
mus2off = new Image( );
mus3on  = new Image( );
mus3off = new Image( );
mus4on  = new Image( );
mus4off = new Image( );
mus5on  = new Image( );
mus5off = new Image( );
mus6on  = new Image( );
mus6off = new Image( );
mus7on  = new Image( );
mus7off = new Image( );
mus8on  = new Image( );
mus8off = new Image( );
mus9on  = new Image( );
mus9off = new Image( );
mus10on  = new Image( );
mus10off = new Image( );
mus11on  = new Image( );
mus11off = new Image( );
mus12on  = new Image( );
mus12off = new Image( );
mus13on  = new Image( );
mus13off = new Image( );
mus14on  = new Image( );
mus14off = new Image( );
mus15on  = new Image( );
mus15off = new Image( );
mus16on  = new Image( );
mus16off = new Image( );
/* 마우스가 올라가면 색이 바뀜 */
mus1off.src = './map/m061.gif';
mus2off.src = './map/m063.gif';
mus3off.src = './map/m055.gif';
mus4off.src = './map/m033.gif';
mus5off.src = './map/m041.gif';
mus6off.src = './map/m031.gif';
mus7off.src = './map/m043.gif';
mus8off.src = './map/m054.gif';
mus9off.src = './map/m064.gif';
mus10off.src = './map/m02.gif';
mus11off.src = './map/m032.gif';
mus12off.src = './map/m042.gif';
mus13off.src = './map/m062.gif';
mus14off.src = './map/m053.gif';
mus15off.src = './map/m052.gif';
mus16off.src = './map/m051.gif';
mus1on.src  = './map/m061o.gif';
mus2on.src  = './map/m063o.gif';
mus3on.src  = './map/m055o.gif';
mus4on.src  = './map/m033o.gif';
mus5on.src  = './map/m041o.gif';
mus6on.src  = './map/m031o.gif';
mus7on.src  = './map/m043o.gif';
mus8on.src  = './map/m054o.gif';
mus9on.src  = './map/m064o.gif';
mus10on.src  = './map/m02o.gif';
mus11on.src  = './map/m032o.gif';
mus12on.src  = './map/m042o.gif';
mus13on.src  = './map/m062o.gif';
mus14on.src  = './map/m053o.gif';
mus15on.src  = './map/m052o.gif';
mus16on.src  = './map/m051o.gif';




var cMuName="";

var exx = new Array("","전남","전북","경남","강원","충남","경기","충북","경북","제주","서울","인천","대전","광주","대구","울산","부산","제주 지역은 서비스 불가 지역입니다");
function mus_on(musName) {
  if(cMuName!=musName) {
     document [musName].src = eval(musName + 'on.src');
  }
}
function mus_off(musName) {
  if(cMuName!=musName)
     document [musName].src = eval(musName + 'off.src');
}

 function smenu_click(musName){ 
     alert(musName); //alert 확인 메소드
 
  	// 서버로 보낼 데이터 준비
     
     $.ajax({
         url: 'local_ajax.jsp', // 서버의 URL
         type: 'GET',
         dataType: 'json',
         data: "loc=" + musName,
         success: function(jsonObj) {
         // 서버 응답 처리
         //console.log('서버 응답:', responseData);
         // responseData를 원하는 방식으로 처리
         /* displayPlaces2(responseData); */
        
    	    // 이동할 위도 경도 위치를 생성합니다 
    	    var moveLatLon = new kakao.maps.LatLng(jsonObj.lat, jsonObj.lng);
    	    // 지도 중심을 이동 시킵니다
    	    map.setCenter(moveLatLon);
    	    map.setLevel(10);
    	    
    	    
         },
         error: function(xhr) {
         // 오류 처리
            console.log('오류 발생:'+xhr.status);
         }
      });
     
     
 
     /* cMuName=musName;
     document [musName].src = eval(musName + 'on.src'); */
     
}
 
 
//지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
 kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
     // 클릭한 위치에 마커를 표시합니다 
     addMarker(mouseEvent.latLng);             
 });

 // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
 var markers = [];

 // 마커 하나를 지도위에 표시합니다 
 addMarker(new kakao.maps.LatLng(33.450701, 126.570667));

 // 마커를 생성하고 지도위에 표시하는 함수입니다
 function addMarker(position) {
     
     // 마커를 생성합니다
     var marker = new kakao.maps.Marker({
         position: position
     });

     // 마커가 지도 위에 표시되도록 설정합니다
     marker.setMap(map);
     
     // 생성된 마커를 배열에 추가합니다
     markers.push(marker);
 }

 // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
 function setMarkers(map) {
     for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(map);
     }            
 }
 
 /* // 검색 결과 목록과 마커를 표출하는 함수입니다
 function displayPlaces2(places) {
    


     var   menuEl = document.getElementById('menu_wrap'),
         fragment = document.createDocumentFragment(),
         bounds = new kakao.maps.LatLngBounds(),
         listStr = '';


     // 지도에 표시되고 있는 마커를 제거합니다
     removeMarker();

     for (var i = 0; i < places.length; i++) {

         // 마커를 생성하고 지도에 표시합니다
         var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
             marker = addMarker(placePosition, i),

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

     }


     // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
     map.setBounds(bounds);
 } */

//-----------------------------------------------------------------------------------------
</script>
<script language="javascript">

</script>

<link rel="icon" href="http://192.168.10.144/jsp_prj/common/main/favicon.ico">
<!-- boost -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	
});//ready
</script>
</head>
<body>
<div style="clear:both; position: relative; z-index: 1; top: -35px; left: 25; ">


<!-- 수도권: 서울, 인천, 경기 -->
<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus10') onmouseout=mus_off('mus10') onclick=smenu_click('서울')>
<input type="hidden" value="서울" id="seoul">
<img src='./map/m02.gif' alt='' border='0' name='mus10' class='list10' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus11') onmouseout=mus_off('mus11') onclick=smenu_click('인천')>
<input type="hidden" value="인천" id="InCheon">
<img src='./map/m032.gif' alt='' border='0' name='mus11' class='list11' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus6') onmouseout=mus_off('mus6') onclick=smenu_click('경기')>
<input type="hidden" value="경기" id="gyeongGiDo">
<img src='./map/m031.gif' alt='' border='0' name='mus6' class='list6' ></a>


<!-- 강원 -->
<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus4') onmouseout=mus_off('mus4') onclick=smenu_click('강원')>
<input type="hidden" value="강원"id="gangWon">
<img src='./map/m033.gif' alt='' border='0' name='mus4' class='list4' ></a>


<!-- 충청: 충남, 충북, 대전 -->
<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus5') onmouseout=mus_off('mus5') onclick=smenu_click('충남')>
<input type="hidden" value="충남" id="chungNam">
<img src='./map/m041.gif' alt='' border='0' name='mus5' class='list5' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus7') onmouseout=mus_off('mus7') onclick=smenu_click('충북')>
<input type="hidden" value="충북" id="chungBug">
<img src='./map/m043.gif' alt='' border='0' name='mus7' class='list7' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus12') onmouseout=mus_off('mus12') onclick=smenu_click('대전')>
<input type="hidden" value="대전" id="daeJeon">
<img src='./map/m042.gif' alt='' border='0' name='mus12' class='list12' ></a>


<!-- 호남: 전남, 전북, 광주 -->
<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus1') onmouseout=mus_off('mus1') onclick=smenu_click('전남')>
<input type="hidden" value="전남" id="jeonNam">
<img src='./map/m061.gif' alt='' border='0' name='mus1' class='list1' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus2') onmouseout=mus_off('mus2') onclick=smenu_click('전북')>
<input type="hidden" value="전북" id="jeonBug">
<img src='./map/m063.gif' alt='' border='0' name='mus2' class='list2' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus13') onmouseout=mus_off('mus13') onclick=smenu_click('광주')>
<input type="hidden" value="광주" id="gwangJu">
<img src='./map/m062.gif' alt='' border='0' name='mus13' class='list13' ></a>


<!-- 영남: 경남, 경북, 대구, 울산, 부산  -->
<a href='#void' onfocus='this.blur()' onmouseover=mus_on('mus3') onmouseout=mus_off('mus3') onclick=smenu_click('경남')>
<input type="hidden" value="경남" id="gyeongNam">
<img src='./map/m055.gif' alt='' border='0' name='mus3' class='list3' ></a>

<a href='#void' onfocus='this.blur()' onmouseover=mus_on('mus8') onmouseout=mus_off('mus8') onclick=smenu_click('경북')>
<input type="hidden" value="경북" id="gyeongBug">
<img src='./map/m054.gif' alt='' border='0' name='mus8' class='list8' ></a>

<a href='#void' onfocus='this.blur()' onmouseover=mus_on('mus14') onmouseout=mus_off('mus14') onclick=smenu_click('대구')>
<input type="hidden" value="대구" id="daeGu">
<img src='./map/m053.gif' alt='' border='0' name='mus14' class='list14' ></a>

<a href='#void' onfocus='this.blur()' onmouseover=mus_on('mus15') onmouseout=mus_off('mus15') onclick=smenu_click('울산')>
<input type="hidden" value="울산" id="ulSan">
<img src='./map/m052.gif' alt='' border='0' name='mus15' class='list15' ></a>

<a href='#void' onfocus='this.blur()' onmouseover=mus_on('mus16') onmouseout=mus_off('mus16') onclick=smenu_click('부산')>
<input type="hidden" value="부산" id="buSan">
<img src='./map/m051.gif' alt='' border='0' name='mus16' class='list16' ></a>


<!-- 제주 -->
<a href='#void' onfocus='this.blur()' onmouseover="mus_on('mus9')" onmouseout="mus_off('mus9')" onclick="smenu_click('제주는 서비스 불가 지역 입니다.')">
<input type="hidden" value="제주" id="jeJu">
<img src='./map/m064.gif' alt='' border='0' name='mus9' class='list9' ></a>



</div>
<form>
<input type="hidden" id="locHid" name="locHid">

</form>

</body>
</html>