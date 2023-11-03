<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info="   "%>

<!-- boost -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Jquery CDN시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 카카오 Map API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=768c6f1c275d1694e36faed4cbb9f196&libraries=services"></script>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- 카카오 style -->
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: relative;
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

#placesList .item h5, #placesList .item .info {
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
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
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
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
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

.sidebar-nav li button {
	margin-right: 0px
}

.sidebar-nav li button:hover {
	color: #fff;
	background: rgba(255, 255, 255, 0.5);
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}

/
.nav-tabs .nav-link {
	width: 180px; /* 버튼의 폭을 조절합니다.  */
	height: 180px; /* 버튼의 높이를 조절합니다.  */
	padding: 5px; /* 버튼 내부 여백을 설정합니다.  */
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
	height: 825px;
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

#page-wrapper {
	width: 100px; /* 3개의 div를 옆으로 나란히 배치 */
	height: 750px;
	/* background: lightblue; */
	/* margin: 5px; */
}

#menu-box {
	width: 30%; /* 3개의 div를 옆으로 나란히 배치 */
	height: 750px;
	background: #FFFFFF;

	/* margin: 5px; */
}

#map {
	width: 60%; /* 3개의 div를 옆으로 나란히 배치 */
	height: 750px;
	background: lightblue;
	/* margin: 5px; */
	flex: 1;
}

#search {
	width: 100%;
	/* display: flex; */
}

#menu_wrap {
	width: 100%;
	position: relative;
}

#search-results {
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

#spanNum {
	font-size: 20px;
}

.ml-2 {
	padding-left: 20px;
}
</style>