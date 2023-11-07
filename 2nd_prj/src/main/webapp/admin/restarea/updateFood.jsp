<%@page import="ra.user.restarea.FoodVO"%>
<%@page import="java.util.List"%>
<%@page import="ra.admin.restarea.RestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<style>
#inputRest {
	width: 600px;
	display: block; /* 블록 수준 요소로 변환 */
	margin: 0 auto; /* 가운데 정렬 */
}

#updateBtn {
	width: 600px;
	display: block; /* 블록 수준 요소로 변환 */
	margin: 0 auto; /* 가운데 정렬 */
}

#fc {
	margin-top: 30px;
	margin-bottom: 30px;
	margin-left: 300px;
}

#hw {
	margin-top: 30px;
	margin-bottom: 30px;
	margin-right: 150px;
}

.flex-container {
	margin-top: 50px;
	display: flex;
	justify-content: space-between; /* 양쪽에 분산 정렬 */
	border: 1px solid #D2D2D2;
	border-radius: 10px;
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
	$(function() {
		$("#updateBtn").click(function(){
	        // 데이터를 수집하거나 사용자 입력을 가져옵니다.
	        var restAreaNum = $("#restAreaNum").val();
	        var foodNum = $("#foodNum").val();
	        var foodImage = $("#foodImage").val(); 
	        var foodName = $("#foodName").val(); 
	        var foodPrice = $("#foodPrice").val();
	        var foodDetail = $("#foodDetail").val();

	        // 데이터를 객체로 구성
	        var data = {
	        	restAreaNum: restAreaNum,
	        	foodNum: foodNum,
	        	foodImage: foodImage ,
	            foodName: foodName ,
	            foodPrice: foodPrice,
	            foodDetail: foodDetail,
	        };

	        // AJAX 요청을 수행
	        $.ajax({
	            url: "ajax/ajax_updateFood.jsp",
	            type: "POST",
	            data: data,
	            dataType: "json",
	            error: function(xhr){
	                alert("서버에서 문제가 발생하였습니다.");
	                console.log(xhr.status);
	            },
	            success: function(jsonObj){
	                    alert(foodNum+"번 메뉴가 수정되었습니다.");
	                    window.history.back();
	            }
	        });//ajax
	    });//click
	});//ready
	
	function displaySelectedImage() {
        const input = document.getElementById("foodImage");
        const image = document.getElementById("selected-image");

        if (input.files && input.files[0]) {
            const reader = new FileReader();

            reader.onload = function (e) {
                image.src = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
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
					<h1 class="mt-4">메뉴 수정</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.jsp">대시보드</a></li>
						<li class="breadcrumb-item"><a href="manageFood.jsp">메뉴 관리</a></li>
						<li class="breadcrumb-item active">메뉴 수정</li>
					</ol>

					<div class="flex-container">
						<div id="fc" class="align-self-center">
						<% 
						String raNo = request.getParameter("raNo"); 
						String fNo = request.getParameter("fNo"); 
						
						RestDAO rDAO = RestDAO.getInstance();
						FoodVO fVO = rDAO.selectFood2(raNo,fNo);
						%>
							<div class="card" style="width: 18rem;">
        						<img id="selected-image" src="../../common/food_images/<%=fVO.getFoodImage() %>" class="card-img-top">
        						<div class="card-body">
            						<input id="foodImage" class="form-control form-control-sm" type="file" onchange="displaySelectedImage()">
        						</div>
    						</div>
							
						</div>

						<div id="hw" class="align-self-center">
						
							<label id="inputRest" class="form-label">휴게소번호</label> 
							<input id="restAreaNum" class="form-control" type="text" value="<%=raNo %>" readonly="readonly" disabled><br/>
						
							<label id="inputRest" class="form-label">메뉴번호</label> 
							<input id="foodNum" class="form-control" type="text" value="<%=fNo %>" readonly="readonly" disabled><br/>
						
							<label id="inputRest" class="form-label">메뉴명</label> 
							<input id="foodName" class="form-control" type="text" placeholder="<%=fVO.getFoodName()%>"><br/>

							<label id="inputRest" class="form-label">가격</label> 
							<input id="foodPrice" class="form-control" type="text" placeholder="<%=fVO.getFoodPrice()%>"><br />

							<label id="inputRest" class="form-label">설명</label> 
							<input id="foodDetail" class="form-control" type="text" placeholder="<%=fVO.getFoodDetail()%>"><br/>

						</div>
					</div>
					<br />
					<button id="updateBtn" type="button" class="btn btn-primary btn-lg"
						style="margin-top: 30px;">수정</button>
				</div>
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
