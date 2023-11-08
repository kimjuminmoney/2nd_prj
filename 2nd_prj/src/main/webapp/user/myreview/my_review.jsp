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

String id=String.valueOf(session.getAttribute("sesId"));

int totalCount=0;
MyReviewDAO mrDAO = MyReviewDAO.getInstance();
try{
totalCount=mrDAO.selectTotalCount(id);//리뷰 전체 개수 count
}catch(SQLException se){
	se.printStackTrace();
}
//한 페이지에서 보여줄 게시글의 수
int pageScale=3;
//총 페이지 수
int totalPage = totalCount/pageScale;
//딱코가 아닐때 방지용
if( totalCount % pageScale != 0){
totalPage++;
}
//페이지별 시작번호
String tempPage=request.getParameter("currentPage");
int currentPage=1;
if(tempPage != null){
	currentPage=Integer.parseInt(tempPage);
}
int startNum=currentPage*pageScale-pageScale+1;
//끝 페이지
int endNum=startNum+pageScale-1;

//많은양의 레코드를 잘라서 보여준다.
//1.화면에 보여줄 페이지 인덱스의 수
int pageNumber=5;
//2.화면에 보여줄 시작페이지 번호
int startPage=((currentPage-1)/pageNumber)*pageNumber+1;
//3.화면에 보여줄 마지막 페이지 번호
int endPage=(((startPage-1)+pageNumber/pageNumber)*pageNumber);
//4.총 페이지수가 연산된 마지막 페이지 수보다 작으면 총 페이지 수가 마지막 페이지 수로 설정
if( totalPage < endPage){
    endPage = totalPage;
}

List<MyReviewVO> rvList=mrDAO.selectReview(id,startNum,endNum);//리뷰조회
pageContext.setAttribute("rvList",rvList);

%>
<c:if test="${ empty sesId }">
<c:redirect url="../login/Client_login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RestArea</title>

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
<!-- 연결 끗 -->    
 
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){
	 
 });//ready
 
 function modifyRv( i ){
	
	 if (isNaN( $("#rvScore"+i).val()) ) {
		    alert("숫자를 입력해주세요.");
		    return;
		}
	 var inputValue = parseInt($("#rvScore" + i).val());
	 if (inputValue < 1 || inputValue > 5) {
	     alert("평점을 1부터 5 사이의 값으로 입력해주세요.");
	     return;
	 }
 
	 var jsonObj={ 
		"userId" : "${ sesId }",
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
	 var del=window.confirm( "리뷰를 지우시겠습니까?" );
	 if(del){
	 var jsonObj={ 
		 "rvNo" :	$("#rvNo"+i).val(),
		 "userId" : "${ sesId}"
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
	 }//end if
 }//removeRv
 </script>
</head>
<body class="sb-nav-fixed">
         <jsp:include page="../myinfo_nav/include_nav.jsp"></jsp:include>
        <div id="layoutSidenav">
        	<jsp:include page="../myinfo_nav/include_side_nav.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
					  <div class="container-fluid px-4">
						<div class="mb-4" style="width:20%; height:75px; margin-top:50px; padding: 10px;" >
                       	 	<h1 class="list-unstyled" >내 리뷰 관리</h1>
                        </div>
                     </div>
                    <div class="container-fluid px-4" style="margin-top:2%; margin-left:1%;">
						<c:choose>
							<c:when test="${ empty rvList }">
								<div class="mb-4">
									리뷰를 작성해주세요.
								</div>
							</c:when>
						<c:otherwise>
	                        <c:forEach var="rv" items="${ rvList }" varStatus="i"> 
	                        <div class="card mb-4">
	                        	<div class="card-header" id="review_head">
	                        		<label class="btn btn-outline-dark"  >날짜</label>&nbsp;&nbsp;&nbsp;
	                        		<label class="btn btn-outline-dark"  >${ rv.rvDate }</label>&nbsp;&nbsp;&nbsp;
	                        		<input type="hidden" id="rvNo${i.count}" name="rvNo${i.count}" value="${ rv.rvNo }"/>
	                        		<label class="btn btn-outline-dark" disabled>휴게소 명</label>&nbsp;&nbsp;&nbsp;
	                        		<label class="btn btn-outline-dark" disabled>${rv.raName }</label>&nbsp;&nbsp;&nbsp;
	                        		<label class="btn btn-outline-dark" > 평점</label>
	                        		<input type="text" id="rvScore${ i.count }" name="rvScore${ i.count }" class="btn btn-outline-dark" value="${ rv.rvScore }" style="width:50px;"/>
	                       		</div>
		                           <c:choose>
		                                <c:when test="${ not empty rv.rvdType}"> 
		                            	<div class="card-body" style="height:100px;">
			                                <p class="mb-0">
			                                   ${ rv.rvdDate } : ${ rv.rvdType } 사유로 관리자에 의해 삭제되었습니다.
			                                </p>
			                               </div>
			                               <div id="btn_review" class="card-footer">
				                            	<input type="button" onclick="modifyRv(${i.count})" value="수정" style="border: 1px solid #000"/>
				                            	<input type="button" onclick="deleteRv(${i.count})" value="삭제"style="border: 1px solid #000"/>
				                            </div>
		                                </c:when>
		                                <c:otherwise>
		                            	<div class="card-body" style="height:100px;">
			                                <textarea id="rvText${ i.count }"  name="rvText${ i.count }" class="form-control">${ rv.rvText }</textarea>
		                        		</div>
				                            <div id="btn_review" class="card-footer">
				                            	<input type="button" onclick="modifyRv(${i.count})" value="수정" style="border: 1px solid #000"/>
				                            	<input type="button" onclick="deleteRv(${i.count})" value="삭제"style="border: 1px solid #000"/>
				                            </div>
		                                </c:otherwise>
		                            </c:choose>
	                            </div> 
							</c:forEach> 
						</c:otherwise>
                 	   </c:choose>
                        <div class="card mb-4">
                        	<div class="card-body">
                        	<%
                        	BoardUtilVO buVO=new BoardUtilVO("my_review.jsp",currentPage,totalPage);
							BoardUtil bu=BoardUtil.getInstance();
                        	out.println(bu.pageNation(buVO));
                        	%>
                        	</div>
                        </div>

                    	</div>
                	</main>
                <footer class="py-4 bg-light mt-auto">
                    <jsp:include page="../myinfo_nav/include_footer.jsp"></jsp:include>
                </footer>
                </div>
            </div>
        
    </body>
</html>
