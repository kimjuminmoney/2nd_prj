<%@page import="ra.admin.restarea.RestDAO"%>
<%@page import="ra.user.restarea.FoodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<link rel="icon" href="../../common/icon_images/marker/favicon.png">

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
	width: 70px; /* 첫 번째 열의 너비 설정 */
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
        <title>RestArea</title>
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
	    
	    $("#updateBtn").click(function(){
	    	var checkboxes = document.querySelectorAll('.food-checkbox');
	    	
	    	<%
	    	String paramRaNum=request.getParameter("raNum");
	    	if(paramRaNum==null){
	    		paramRaNum="1";
	    	}
	    	%>
			var restareaNum = <%=paramRaNum%>;
	    	
	    	checkboxes.forEach(function (checkbox, index){
	            if (checkbox.checked) {
	            	var foodNum = checkbox.getAttribute('data-food-num');
	            	window.location.href = 'updateFood.jsp?raNo='+restareaNum+'&fNo='+foodNum;
	            
	            }//end if
	    	});//forEach
	    		
	    });//click
	    
	    $("#deleteBtn").click(function(){
	    	
	    	var confirmation = confirm('메뉴를 삭제하시겠습니까?');
			   
			if(confirmation){
	    	var checkboxes = document.querySelectorAll('.food-checkbox');

			var restareaNum = <%=paramRaNum%>;
	    	
	        // 체크박스를 반복하면서 선택된 것을 확인하고 해당 행을 삭제합니다.
	        checkboxes.forEach(function (checkbox, index) {
	            if (checkbox.checked) {
	                // 선택된 체크박스의 상위 tr 요소를 찾아 삭제합니다.
	                var tr = checkbox.closest('tr');
	                
	                if (tr) {
	                	var foodNum = checkbox.getAttribute('data-food-num');
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
	        	            	alert(foodNum+"번 메뉴가 삭제되었습니다.");
	        	            }//success
	        	        });//ajax
	                }//end if
	                }//end if
	        
	        });//forEach
	                }else{
	                	alert("취소되었습니다.")
	                }
					 
	    })//click
	});//ready
</script>

</head>
<body class="sb-nav-fixed">
<form  method="get" name="raFrm" id="raFrm">
<input type="hidden" name="raNum" id="raNum">
<input type="hidden" name="restareaname" id="restareaname2">
</form>
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
										<th>#</th>
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
										String fDetail = "";
										for(int i=0; i<foodList.size(); i++){
										FoodVO fVO = foodList.get(i);
										fDetail=fVO.getFoodDetail();
										if(fDetail==null){
											fDetail="";
										}
										%>
										<tr>
											<td><input type="radio" id="foodRadio" name="foodRadio" value="" class="food-checkbox" data-food-num="<%= fVO.getFoodNum() %>"/></td>
											<td><%=fVO.getFoodNum() %></td>
											<td style="text-align: center"><img src="../../common/food_images/<%=fVO.getFoodImage() %>" style="height:50px; border-radius: 10px;"/></td>
											<td><%=fVO.getFoodName() %></td>
											<td><%=fVO.getFoodPrice() %></td>
											<td><%=fDetail %></td>
										</tr>
										<%
										}
										%>
								</tbody>
							</table>
						</div>
					</div>
					<a href="addFood.jsp?raNo=<%=raNo%>"><input class="btn btn-primary" type="button" value="추가"></a>
					<input id="updateBtn" class="btn btn-primary" type="button" value="수정">
					<input id="deleteBtn" class="btn btn-primary" type="button" value="삭제">
				</div>
			</main>
			<jsp:include page="../admin_include/footer.jsp"></jsp:include>
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
