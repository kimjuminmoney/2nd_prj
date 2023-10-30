<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info="   "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"
	href="http://192.168.10.151/jsp_prj/common/main/favicon.ico">
<!-- boost -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Jquery CDN시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {

	});//ready
</script>
<!-- API -->
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=1024" />

<link rel="stylesheet"
	href="//t1.daumcdn.net/kakaomapweb/map/20230925140813/app_A.css">
<link rel="stylesheet"
	href="//t1.daumcdn.net/kakaomapweb/map/20230925140813/app_B.css">
<link rel="stylesheet"
	href="//t1.daumcdn.net/kakaomapweb/map/20230925140813/app_C.css">
<link rel="stylesheet"
	href="//t1.daumcdn.net/kakaomapweb/map/20230925140813/app_D.css">
<link rel="stylesheet"
	href="//t1.daumcdn.net/kakaomapweb/map/20230925140813/canvas_roadview.css">

<link rel="stylesheet"
	href="https://t1.daumcdn.net/kakaomapweb/subway/linemap/canvas/prod/css/subway.css">

<link rel="icon" type="image/x-icon" href="/favicon.ico" />

<title>카카오맵</title>
<script type="text/javascript">
	if (true === true
			&& (true === false || 0)
			&& document.referrer.split('?')[0] === "https://accounts.kakao.com/login?continue="
					.split('?')[0]) {
		window.location.href = window.location.origin + '/user/signup';
	}
</script>




<meta property="og:site_name" content="카카오맵">
<meta property="og:title" content="카카오맵">
<meta property="og:description" content="당신을 좋은 곳으로 안내 할 지도">
<meta property="og:type" content="websit">
<meta property="og:image"
	content="//t1.daumcdn.net/localimg/localimages/07/common/ogtag.png">

<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="카카오맵">
<meta name="twitter:description" content="당신을 좋은 곳으로 안내 할 지도">
<meta name="twitter:image"
	content="//t1.daumcdn.net/localimg/localimages/07/common/ogtag.png">

<meta name="description" content="당신을 좋은 곳으로 안내 할 지도">
<link rel="search" type="application/opensearchdescription+xml"
	href="/OpenSearch.xml" title="카카오맵">
<!-- API -->
</head>
<body>
	<div id="search" class="Search" style="width: 800px; height: 800px; border: 1px solid;">
	<%
	String rano = request.getParameter("rano");
	%>
<%= rano %>	
	</div>
</body>
</html>