<%@page import="ra.admin.restarea.AddRestDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<style>

#inputRest{
	margin-top: 20px;
}

#inputBtn {
	width: 600px;
	display: block; /* 블록 수준 요소로 변환 */
	margin: 0 auto; /* 가운데 정렬 */
}

#fc {
	margin-top: 30px;
	margin-bottom: 30px;
	margin-left: 150px;
	margin: 0 auto;
}

#hw {
	margin-top: 30px;
	margin-bottom: 30px;
	margin-right: 150px;
	margin: 0 auto;
}

.flex-container {
	width:1500px;
	margin-top: 50px;
	display: flex;
	justify-content: space-between; /* 양쪽에 분산 정렬 */
	border: 1px solid #D2D2D2;
	border-radius: 10px;
	margin: 0 auto;
}
</style>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Tables - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../../common/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#inputHname").change(function(){
		var selectedValue = this.value; // 선택된 옵션 값
	});//change
	
    $("#inputBtn").click(function(){
        // 데이터를 수집하거나 사용자 입력을 가져옵니다.
        var addr = $("#inputAddr").val(); // 예: input 필드의 ID가 "addrInput"인 경우
        var direction = $("#inputDir").val();
        var highwaynum = $("#inputHnum").val();
        var locate = $("#inputLoc").val();
        var rax = $("#inputRax").val();
        var ray = $("#inputRay").val();
        var restname = $("#inputRestName").val();
        var tel = $("#inputTel").val();

        // 데이터를 객체로 구성
        var data = {
            addr: addr,
            direction: direction,
            highwaynum: highwaynum,
            locate: locate,
            rax: rax,
            ray: ray,
            restname: restname,
            tel: tel
        };

        // AJAX 요청을 수행
        $.ajax({
            url: "ajax_addRest.jsp",
            type: "POST",
            data: data,
            dataType: "json",
            error: function(xhr){
                alert("서버에서 문제가 발생하였습니다.");
                console.log(xhr.status);
            },
            success: function(jsonObj){
                    alert("추가완료.");
            }
        });//ajax
    });//click
    
    $("#inputHname").change(function(){
    	if($("#inputHname").selectedIndex != 0){
    		var data=$("#inputHname").val();
    		  // AJAX 요청을 수행
            $.ajax({
                url: "ajax_highway_num.jsp",
                type: "POST", // POST 방식을 사용해 데이터를 서버로 보냅니다.
                data: "highwayname="+data,
                dataType: "json",
                error: function(xhr){
                    alert("서버에서 문제가 발생하였습니다.");
                    console.log(xhr.status);
                },
                success: function(jsonObj){
                    $("#inputHnum").val( jsonObj.hNum);
                }
            });//ajax
    		
    	}//end if    	
    });//change
    
});//ready

</script>
<%
AddRestDAO arDAO = AddRestDAO.getInstance();
String raNum = arDAO.selectLastRano();
List<String> hnameList = arDAO.selectHighwayName();
%>
</head>
<body class="sb-nav-fixed">
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
					<h1 class="mt-4">휴게소 추가</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.jsp">대시보드</a></li>
						<li class="breadcrumb-item active">휴게소 추가</li>
					</ol>

					<div class="flex-container">
						<div id="fc">
							<label id="inputRest" class="form-label">휴게소명</label>
							<input style="width:400px" id="inputRestName" name="restname" class="form-control" type="text"><br/>
								
							<label id="inputRest" class="form-label">주소</label>
							<input id="inputAddr" name="addr" class="form-control" type="text"><br/>

							<label id="inputRest" class="form-label">관리번호</label> 
							<input id="inputRestNum" name="restNum" class="form-control" type="text" 
							readonly="readonly" value="<%=raNum %>" disabled><br />
							
							 
							<label id="inputRest" class="form-label">전화번호</label>
							<input id="inputTel" name="tel" class="form-control" type="text"><br />

							<label id="inputRest" class="form-label">노선방향</label>
							<select id="inputDir" name="direction" class="form-select">
							<option>상행</option>
							<option>하행</option>
							<option>양방향</option>
							</select><br /> 
						</div>

						<div id="hw">
							<label id="inputRest" class="form-label">고속도로명</label> 
							<select id="inputHname" name="highwayname" class="form-select">
							<option>고속도로 선택</option>
							<% 
							
							for(int i=0; i<hnameList.size(); i++){ %>
							
							<option value="<%=hnameList.get(i)%>"><%= hnameList.get(i) %></option>
							
							<% } %>
							</select><br /> 
							
							<label id="inputRest" class="form-label">고속도로 번호</label> 
							<input style="width:400px" id="inputHnum" name="highwaynum" class="form-control" type="text" readonly="readonly" 
							 disabled><br />

							<label id="inputRest" class="form-label">위도</label> 
							<input id="inputRax" name="rax" class="form-control" type="text"><br /> 
							
							<label id="inputRest" class="form-label">경도</label> 
							<input id="inputRay" name="ray" class="form-control" type="text"><br />

							<label id="inputRest" class="form-label">지역</label> 
							<select id="inputLoc" name="locate" class="form-select">
							<option>강원</option>
							<option>경기</option>
							<option>경남</option>
							<option>경북</option>
							<option>대구</option>
							<option>대전</option>
							<option>부산</option>
							<option>서울</option>
							<option>울산</option>
							<option>인천</option>
							<option>전남</option>
							<option>전북</option>
							<option>충남</option>
							<option>충북</option>
							</select><br /> 
						</div>
					</div>
					<br />
					<form>
					<button id="inputBtn" type="button" class="btn btn-primary btn-lg"
						style="margin-top: 30px;">추가</button>
					</form>
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
	<script src="js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
