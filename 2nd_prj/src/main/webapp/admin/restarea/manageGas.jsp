<%@page import="ra.user.restarea.GasVO"%>
<%@page import="ra.user.restarea.RestDAO"%>
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
	width: 100px; /* 첫 번째 열의 너비 설정 */
}

.table th:nth-child(3) {
	width: 200px; /* 두 번째 열의 너비 설정 */
}

.table th:nth-child(4) {
	width: 200px; /* 세 번째 열의 너비 설정 */
}
/* 나머지 열들에 대한 너비 설정 */
#updateBtn {
	margin-top: 100px;
	margin-bottom: 55px;
	margin-left: 550px;
	width: 600px;
}
</style>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>RestArea</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../../common/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<body class="sb-nav-fixed">
	<!-- 해더 nav -->
        <jsp:include page="../admin_include/header_nav.jsp"></jsp:include>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<!-- 사이드바 nav -->
            <jsp:include page="../admin_include/side_bar.jsp"></jsp:include>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">주유소 관리</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.jsp">대쉬보드</a></li>
						<li class="breadcrumb-item active">주유소 관리</li>
					</ol>

					<div>
						<div style="margin-top: 75px">
							<h4>주유소정보</h4>
							<table class="table">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">주유소명</th>
										<th scope="col">정유사</th>
									</tr>
								</thead>
								<tbody>
									<%
										RestDAO rDAO = RestDAO.getInstance();
										List<GasVO> gasList = rDAO.selectGas("1");
										for(int i=0; i<gasList.size(); i++){
										GasVO gVO = gasList.get(i);
										%>
										<tr>
											<td></td>
											<td><%=gVO.getGasName() %></td>
											<td><%=gVO.getGasBrand() %></td>
										</tr>
										<%
										}
										%>
								</tbody>
							</table>
						</div>

						<div style="margin-top: 75px">
							<h4>유가정보</h4>
							<table class="table">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">First</th>
										<th scope="col">Last</th>
										<th scope="col">Handle</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>@fat</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td colspan="2">Larry the Bird</td>
										<td>@twitter</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div style="margin-top: 75px">
							<h4>비고</h4>
							<ul>
								<li>세차장 유무:</li>
							</ul>
						</div>

					</div>
				</div>
				<button type="button" id="updateBtn" class="btn btn-primary btn-lg">수정</button>
			</main>
			<jsp:include page="../admin_include/footer.jsp"></jsp:include>
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
