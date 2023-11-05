<%@page import="ra.admin.restarea.RestDAO"%>
<%@page import="ra.user.restarea.FoodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<style>
.table {
	width: 100%;
}

.table th:nth-child(1) {
	width: 10px; /* 첫 번째 열의 너비 설정 */
}

.table th:nth-child(2) {
	width: 2s0px; /* 첫 번째 열의 너비 설정 */
}

.table th:nth-child(3) {
	width: 150px; /* 두 번째 열의 너비 설정 */
}

.table th:nth-child(4) {
	width: 150px; /* 세 번째 열의 너비 설정 */
}
/* 나머지 열들에 대한 너비 설정 */
</style>

<head>
<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../../common/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<link rel="icon" href="http://192.168.10.148/jsp_prj/common/main/favicon.ico">
<!-- boost -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>



<script type="text/javascript">
	$(function() {
		$("#restareaname").change(function(){
	    	if($("#restareaname").selectedIndex != 0){
	    		var data=$("#restareaname").val();
	    		  // AJAX 요청을 수행
	            $.ajax({
	                url: "ajax/ajax_restarea_num.jsp",
	                type: "POST", // POST 방식을 사용해 데이터를 서버로 보냅니다.
	                data: "restareaname="+data,
	                dataType: "json",
	                error: function(xhr){
	                    alert("서버에서 문제가 발생하였습니다.");
	                    console.log(xhr.status);
	                },
	                success: function(jsonObj){
	                	var raNum = jsonObj.raNum;
							$("#raNum").val(raNum);
							$("#restareaname2").val($("#restareaname").val());
							$("#raFrm").submit();
	                    }
	                    
	            });//ajax
	    		
	    	}//end if    	
	    });//change
	    
	    $("#deleteBtn").click(function(){
	    	var checkboxes = document.querySelectorAll('.food-checkbox');
	    	<%
	    	String paramRaNum=request.getParameter("raNum");
	    	if(paramRaNum==null){
	    		paramRaNum="1";
	    	}
	    	%>
			var restareaNum = <%=paramRaNum%>;
	    	
	        // 체크박스를 반복하면서 선택된 것을 확인하고 해당 행을 삭제합니다.
	        checkboxes.forEach(function (checkbox, index) {
	            if (checkbox.checked) {
	                // 선택된 체크박스의 상위 tr 요소를 찾아 삭제합니다.
	                var tr = checkbox.closest('tr');
	                
	                if (tr) {
	                	var foodNum = checkbox.getAttribute('data-food-num');
	                	alert(foodNum)
	                	alert(restareaNum)
	                    tr.remove();
	                	
	                	var data = {
	        	        		restareaNum: restareaNum,
	        	        		foodNum: foodNum
	        	            };
	        	        
	        	    	$.ajax({
	        	            url: "ajax/ajax_deleteFood.jsp",
	        	            type: "POST",
	        	            data: data,
	        	            dataType: "json",
	        	            error: function(xhr){
	        	            	alert("서버에 문제가 발생하였습니다.");
	        	            	console.log(xhr);
	        	            },
	        	            success: function(response) {
	        	                alert("삭제완료");
	        	            }//success
	        	        });//ajax
	                }
	            }
	        });//forEach
					 
	    })//click
	});//ready
</script>

</head>
<body class="sb-nav-fixed">
<form  method="get" name="raFrm" id="raFrm">
<input type="hidden" name="raNum" id="raNum">
<input type="hidden" name="restareaname" id="restareaname2">
</form>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.jsp">Start Bootstrap</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
					<li><a class="dropdown-item" href="register.jsp">회원가입</a></li>
					<li><a class="dropdown-item" href="#!">로그아웃</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">메뉴</div>
						<a class="nav-link" href="index.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 대쉬보드
						</a>
						<!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                레이아웃
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.jsp">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.jsp">Light Sidenav</a>
                                </nav>
                            </div> -->
						<!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a> -->
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.jsp">Login</a> <a
											class="nav-link" href="register.jsp">Register</a>
										<!--                                             <a class="nav-link" href="password.jsp">Forgot Password</a> -->
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.jsp">401 Page</a> <a
											class="nav-link" href="404.jsp">404 Page</a> <a
											class="nav-link" href="500.jsp">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>

						<!--   <a class="nav-link" href="charts.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a> -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 휴게소 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="manageFood.jsp">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 음식
								</a> <a class="nav-link" href="manageConv.jsp">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 편의시설
								</a> <a class="nav-link" href="manageBrand.jsp">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 매장시설
								</a> <a class="nav-link" href="manageGas.jsp">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 주유소 정보
								</a> <a class="nav-link" href="addRest.jsp">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 휴게소 추가
								</a>
							</nav>
						</div>

						<a class="nav-link" href="manageReview.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 리뷰 관리
						</a> <a class="nav-link" href="manageService.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 문의
						</a> <a class="nav-link" href="manageUser.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 회원 관리
						</a> <a class="nav-link" href="manageNotice.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 공지사항
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">메뉴 관리</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.jsp">휴게소 관리</a></li>
						<li class="breadcrumb-item active">메뉴 관리</li>
					</ol>
					<div>
							<select id="restareaname" name="restareaname" class="form-select" style="width: 300px">
							<% 
							RestDAO rDAO = RestDAO.getInstance();
							List<String> raNameList = rDAO.selectRestAreaName();
							
							String raNo = request.getParameter("raNum");
							String restareaname = request.getParameter("restareaname");
							if(raNo == null){
								raNo="1";
								restareaname="화성(서울)휴게소";
							}
							
							String raName = "";
							String raNum = "";
							
							for(int i=0; i<raNameList.size(); i++){
								
							raName=raNameList.get(i);
							raNum = rDAO.selectRestAreaNum(raName);
							%>
							
							<option value="<%=raName%>"<%=raName.equals(restareaname) ?" selected='selected'":"" %>><%= raName %></option>
							
							<% } %>
							</select>
							<br/>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 메뉴 정보
						</div>
						<div class="card-body">
							<table id="datatablesSimple" class="table">
								<thead>
									<tr>
										<th><input type="checkbox" /></th>
										<th>번호</th>
										<th>이미지</th>
										<th>메뉴명</th>
										<th>가격</th>
										<th>설명</th>
									</tr>
								</thead>
								<tbody>
										<%
										List<FoodVO> foodList = rDAO.selectFood(raNo);
										for(int i=0; i<foodList.size(); i++){
										FoodVO fVO = foodList.get(i);
										%>
										<tr>
											<td><input type="checkbox" class="food-checkbox" data-food-num="<%= fVO.getFoodNum() %>"/></td>
											<td><%=fVO.getFoodNum() %></td>
											<td style="text-align: center"><img src="../../common/food_images/<%=fVO.getFoodImage() %>" style="height:50px; border-radius: 10px;"/></td>
											<td><%=fVO.getFoodName() %></td>
											<td><%=fVO.getFoodPrice() %></td>
											<td><%=fVO.getFoodDetail() %></td>
										</tr>
										<%
										}
										%>
								</tbody>
							</table>
						</div>
					</div>
					<a href="addFood.jsp?raNo=<%=raNo%>"><input class="btn btn-primary" type="button" value="추가"></a>
					<a href="updateFood.jsp?raNo=<%=raNo%>"><input class="btn btn-primary" type="button" value="수정"></a>
					<input id="deleteBtn" class="btn btn-primary" type="button" value="삭제">
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../../common/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../../common/js/datatables-simple-demo.js"></script>
	
	
	
</body>
</html>
