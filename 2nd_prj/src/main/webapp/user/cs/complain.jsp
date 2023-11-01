<%@page import="ra.util.BoardUtil"%>
<%@page import="ra.util.BoardUtilVO"%>
<%@page import="ra.user.cs.MyCSVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ra.user.cs.myCSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=" cs페이지" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); 
int totalCount=0;
String id="HJS";
myCSDAO mcDAO= myCSDAO.getInstance();
try{
totalCount=mcDAO.selectTotalCount(id);//리뷰 전체 개수 count
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

List<MyCSVO> csList=mcDAO.selectMyCS(id,startNum,endNum);//리뷰조회
pageContext.setAttribute("csList",csList);


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
<link rel="stylesheet" type="text/css" href="../../common/css/styles.css">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<!-- 연결 끗 -->    
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){
	 $("#select_Type").change(function(){
		 
		 if( $("#select_Type").selectedIndex != 0 ){
		 if($("#select_Type").val()=='R'){
			 	var jsonObj= {};
			 $.ajax({
					url:"loc_process.jsp",
					type:"post",
					data:jsonObj,
					dataType:"json",
					error:function(xhr){
						console.log(xhr.status);
					},
					success:function( tempArr ){
						var sel=$("#ra_location")[0];
						$.each(tempArr, function(i, json ){
							sel.options[i+1]=new Option(json.loc, json.loc);
						});//end for
					
					}//success 
			 });//ajax
		 }else{
			 var sel=$("#ra_location")[0].length=1;;
		 }//if
	 }//end if
	 })//change
	 
	$("#ra_location").change(function(){
		var jsonObj= {"loc" : $("#ra_location").val()}

		if( $("#ra_location").selectedIndex != 0 ){
			$.ajax({
				url:"option_process.jsp",
				type:"post",
				data:jsonObj,
				dataType:"json",
				error:function(xhr){
					console.log(xhr.status);
					},
				success:function( temp ){
					
					var tempJson;
					var selName=$("#ra_name")[0];
					for( var i =0; i<temp.length ; i++){
						tempJson = temp[i];
						selName.options[i+1]=new Option(tempJson.raName, tempJson.raNo);
						
						}//end for
					}//success
				});//ajax
			 }//end if
		});//change
		
		$("#btn_submit").click(function(){
			//유효성 검사필요
			
			$("#cs_frm").submit();
			alert("문의가 완료되었습니다.");
			//location.reload();
		
		});//click
		
	
	
	
 });//ready
 
 function open_detail( i ){
	 
	 var csNO=$("#csNO"+i).val();
 	 window.open("complain_sub.jsp?csNO="+csNO,"cs_detail","width=800,height=400,top="
            +( window.screenY+150)+",left="+( window.screenX+200));
 }//open_detail
 
 
 
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
                       	 	<h1 class="list-unstyled" >문의 내역</h1>
                        </div>
                     </div>
                    <div class="container-fluid px-4">
                        <div class="card mb-4">
                            <div class="card-body">
                                    <table  class="datatable-table">
                                    <thead>
                                    <tr>
                                    	<th>문의유형</th>
                                    	<th>날짜</th>
                                    	<th>내용</th>
                                    	<th>휴게소명</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="cs" items="${ csList }" varStatus="i">
	                                    	<tr id="cs_detail${ i.count }" onclick="open_detail(${i.count})">
	                                    	
	                                    		<c:if test="${ cs.csType eq 'U' }">
	                                    			<td>회원정보</td>
	                                    		</c:if>
	                                    		<c:if test="${ cs.csType eq 'R' }">
	                                    			<td>휴게소</td>
	                                    		</c:if>
	                                    		<td>${ cs.csDate }</td>
	                                    		<td>${ cs.csText }<input type="hidden" value="${ cs.csNO }" id="csNO${ i.count }" name="csNO${ i.count }"></td>
	                                    		<td>${ cs.raName }</td>
	                                    	</tr>
	                                    </c:forEach>
	                                    </tbody>
									</table>
									<div id="tbottom">
									<%
			                        	BoardUtilVO buVO=new BoardUtilVO("complain.jsp",currentPage,totalPage);
										BoardUtil bu=BoardUtil.getInstance();
			                        	out.println(bu.pageNation(buVO));
		                        	%>
									</div>												
                            	</div>
                        	</div>
                        </div>
                        
                        <div style="height: 1vh"></div>
                        
                      <div class="container-fluid px-4">
						<div class="mb-4" style="width:20%; height:75px; margin-top:50px; padding: 10px;" >
                       	 	<h1 class="list-unstyled" >문의하기</h1>
                        </div>
                     </div>
                     <div class="container-fluid px-4">
                        <div class="card mb-4">
                        	<form action="cs_insert_process.jsp" method="post" id="cs_frm" name="cs_frm">
    	                   	<div class="card-header">
                        		<div id="select_cs">
	                        		<select id="select_Type" name="csType" class="datatable-selector">
	                        			<option>유형선택</option><option id="type_r" value="R" > 휴게소관련</option><option id="type_u" value="U" > 회원정보관련</option>
	                        		</select>
	                        		<select id="ra_location" name="ra_location" class="datatable-selector" >
	                        			<option>지역별</option>
	                        		</select>
	                        		<select id="ra_name" name="ra_name" class="datatable-selector" >
	                        			<option >휴게소명</option>
	                        			</select>
	    	                    </div>
            	            </div>
                        	<div class="card-body">
	                        	<div id="ta">
	                        		<textarea class="form-control" id="cs_text" name="cs_text" style="height: 100px;	">[Web발신] 너희는 나를 존중해야한다. 나는 1조 조장으로 .....       [더보기]	</textarea>
	                        	</div>
	                        	<div class="row g-3 align-items-center" id="btn_myinfo" style="margin-top:10px;">
									<div class="col-auto">
										<input type="button" id="btn_submit" class="btn btn-outline-dark" value="확인" style="border:1px solid #000"/>
									</div>
									<div class="col-auto">
										<input type="button" id="btn_cancel" class="btn btn-outline-dark" value="취소"style="border:1px solid #000"/>
									</div>
			                   	</div>
                    		</div>
                    		</form>
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
