<%@page import="ra.admin.review.ReviewDAO"%>
<%@page import="ra.admin.review.ReviewVO"%>
<%@page import="ra.util.BoardUtil"%>
<%@page import="ra.util.BoardUtilVO"%>
<%@page import="ra.user.myreview.MyReviewVO"%>
<%@page import="ra.user.myreview.MyReviewDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="review page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); 


ReviewDAO rDAO= ReviewDAO.getInstance();
List<ReviewVO> rvList=rDAO.selectAllReview();//리뷰조회

pageContext.setAttribute("rvList",rvList);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 <!-- jQuery CDN 끝 -->
 <!-- css연결 -->
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="http://192.168.10.150/jsp_prj/common/css/styles.css">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
 <script src="../../common/js/datatables-simple-demo.js"></script>
<!-- 연결 끗 -->    
 
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){
	 
 });//ready
 
 function modifyRv( i ){
	
	 if (isNaN( $("#rvScore"+i).val()) ) {
		 	alert($("#rvScore"+i).val());
		    alert("숫자를 입력해주세요.");
		    return;
		}
	 var inputValue = parseInt($("#rvScore" + i).val());
	 if (inputValue < 1 || inputValue > 5) {
	     alert("평점을 1부터 5 사이의 값으로 입력해주세요.");
	     return;
	 }
 
	 var jsonObj={ 
		<%-- "id" : <%= request.getParameter("id")%> --%>
		"rvNo" :	$("#rvNo"+i).val(),
		"rvScore" :	$("#rvScore"+i).val(),
		"rvText" : $("#rvText"+i).val()
	}
	 
		$.ajax({	
			url:"modify_process.jsp",
			type:"post",
			data:jsonObj,
			dataType:"json",
			error:function(xhr){
				console.log(xhr.status);
			},
			success:function( temp ){
				var tempScore=temp.Score;
				var tempText=temp.Text;
				var cnt=temp.cnt;
				
				if(cnt == 1 ){
					$("#rvText"+i).val(tempText);
					$("#rvScore"+i).val(tempScore);
					alert("게시글이 수정되었습니다.");
					location.reload();
				}//endif	
			}//success
		 });//ajax
 }//modifyRv
 
 function deleteRv( i ){
	 
	 var jsonObj={ 
		 "rvNo" :	$("#rvNo"+i).val(),
		<%-- "id" : <%= request.getParameter("id")%> --%>
		}
	 
		$.ajax({	
			url:"remove_process.jsp",
			type:"post",
			data:jsonObj,
			dataType:"json",
			error:function(xhr){
				console.log(xhr.status);
			},
			success:function( temp ){
				var tempNo=temp.rvNo;
				var cnt=temp.cnt;
				alert(tempNo+"번 게시글이 삭제되었습니다.");
				location.reload()
			}//success
		 });//ajax
 }//removeRv
 </script>
</head>
<body class="sb-nav-fixed">
         <jsp:include page="../admin_include/header_nav.jsp"></jsp:include>
        <div id="layoutSidenav">
        	<jsp:include page="../admin_include/side_bar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
					<div class="container-fluid px-4">
						<div class="mb-4" style="width:20%; height:75px; margin-top:50px; padding: 10px;" >
                       	 	<h1 class="list-unstyled" >내 리뷰 관리</h1>
                    	</div>
                    </div>
                    <div class="container-fluid px-4" style="margin-top:2%; margin-left:1%;">
                        <div class="card mb-4">
		                        <!--<c:forEach var="rv" items="${ rvList }" varStatus="i">-->
		                        <!-- int idx, rvNO, raNO, raName, rvDate, rvScore, rvText, rvReport,rvddate,rvdtype,rvddetail ; !-->
		                        <table id="datatablesSimple">
		                           	<thead>
		                            	<tr>
		                            		<th>날짜</th>
		                            		<th>휴게소명</th>
		                            		<th>닉네임</th>
		                            		<th>평점</th>
		                            		<th>신고횟수</th>
		                            	</tr>
		                           	</thead>
	                            	<tbody>
			                        	<c:forEach var="rv" items="${ rvList }" varStatus="i">
			                           		<tr id="m_detail${ i.count }" >
			                         			<td>
						                        	<div class="card-header" id="review_head">
						                        		<label class="btn btn-outline-dark"  >날짜</label>&nbsp;&nbsp;&nbsp;
						                        		<label class="btn btn-outline-dark"  >${rv.rvDate }</label>&nbsp;&nbsp;&nbsp;
						                        		<input type="hidden" id="rvNo" name="rvNo" value=""/>
						                        		<label class="btn btn-outline-dark" disabled>휴게소 명</label>&nbsp;&nbsp;&nbsp;
						                        		<label class="btn btn-outline-dark" disabled>${ rv.raName }</label>&nbsp;&nbsp;&nbsp;
						                        		<label class="btn btn-outline-dark" disabled>닉네임</label>&nbsp;&nbsp;&nbsp;
						                        		<label class="btn btn-outline-dark" disabled>${ rv.uNic }</label>&nbsp;&nbsp;&nbsp;
						                        		<label class="btn btn-outline-dark" > 평점</label>&nbsp;&nbsp;&nbsp;
						                        		<input type="text" id="rvScore${ i.count }" name="rvScore${ i.count }" class="btn btn-outline-dark" value="${ rv.rvScore }" style="width:50px;"/>
						                        		<label class="btn btn-outline-dark" > 신고횟수</label>&nbsp;&nbsp;&nbsp;
						                        		<label class="btn btn-outline-dark" > ${ rv.rvReport }</label>&nbsp;&nbsp;&nbsp;
						                     		</div>
						                 		</td>
					                  		</tr>
										</c:forEach>	
									</tbody>
								</table> 
                            </div> 
                        <div class="card mb-4">
                        	<div class="card-body">
                        	</div>
                        </div>

                    	</div>
                	</main>
                <footer class="py-4 bg-light mt-auto">
                    <jsp:include page="../admin_include/footer.jsp"></jsp:include>
                </footer>
                </div>
            </div>
    </body>
</html>
