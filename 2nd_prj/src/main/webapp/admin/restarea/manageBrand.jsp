<%@page import="ra.user.restarea.BrandVO"%>
<%@page import="ra.admin.restarea.RestDAO"%>
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
	width: 80px; /* 첫 번째 열의 너비 설정 */
}

.table th:nth-child(3) {
	width: 150px; /* 첫 번째 열의 너비 설정 */
}
/* 나머지 열들에 대한 너비 설정 */
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
	    	var checkboxes = document.querySelectorAll('.brand-checkbox');
	    	<%
	    	String paramRaNum=request.getParameter("raNum");
	    	if(paramRaNum==null){
	    		paramRaNum="1";
	    	}
	    	%>
			var restareaNum = <%=paramRaNum%>;
	    	
	    	checkboxes.forEach(function (checkbox, index){
	            if (checkbox.checked) {
	            	
	            	var tr = checkbox.closest('tr');
	            	var brandNum = checkbox.getAttribute('data-brand-num');
	            	
	            	window.location.href = 'updateBrand.jsp?raNo='+restareaNum+'&bNo='+brandNum;
	            }//end if
	    	});//forEach
	    });//click
	    
	    $("#deleteBtn").click(function(){
	    	var checkboxes = document.querySelectorAll('.brand-checkbox');
			var restareaNum = <%=paramRaNum%>;
	    	
	        // 체크박스를 반복하면서 선택된 것을 확인하고 해당 행을 삭제합니다.
	        checkboxes.forEach(function (checkbox, index) {
	            if (checkbox.checked) {
	                // 선택된 체크박스의 상위 tr 요소를 찾아 삭제합니다.
	                var tr = checkbox.closest('tr');
	                
	                if (tr) {
	                	var brandNum = checkbox.getAttribute('data-brand-num');
	                    tr.remove();
	                	
	                	var data = {
	        	        		restareaNum: restareaNum,
	        	        		brandNum: brandNum
	        	            };
	        	        
	        	    	$.ajax({
	        	            url: "ajax/ajax_deleteBrand.jsp",
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
					<h1 class="mt-4">매장 관리</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.jsp">대쉬보드</a></li>
						<li class="breadcrumb-item active">매장 관리</li>
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
							<i class="fas fa-table me-1"></i> 매장 정보
						</div>
						<div class="card-body">
							<table id="datatablesSimple" class="table">
								<thead>
									<tr>
										<th><input type="checkbox" /></th>
										<th>아이콘</th>
										<th>매장명</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<%
										List<BrandVO> brandList = rDAO.selectBrand(raNo);
										for(int i=0; i<brandList.size(); i++){
										BrandVO bVO = brandList.get(i);
										%>
										<tr>
											<td><input type="checkbox" class="brand-checkbox" data-brand-num="<%= bVO.getBarndNum() %>"/></td>
											<td><img src="../../common/icon_images/brand/<%=bVO.getBrandIcon() %>.png"></td>
											<td><%=bVO.getBrandName() %></td>
											<td><%=!(bVO.getBrandHome()==null)?bVO.getBrandHome():"" %></td>
										</tr>
										<%
										}
										%>
								</tbody>
							</table>
						</div>
					</div>
					<a href="addBrand.jsp?raNo=<%=raNo%>"><input class="btn btn-primary" type="button" value="추가"></a>
					<input id="updateBtn" class="btn btn-primary" type="submit" value="수정">
					<input id="deleteBtn" class="btn btn-primary" type="reset" value="삭제">
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
