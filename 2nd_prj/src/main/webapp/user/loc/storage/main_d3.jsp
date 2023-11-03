<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>        
<!DOCTYPE html>
<html>
<head>
<jsp:include page="main_e3.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.144/jsp_prj/common/main/favicon.ico">
<!-- boost -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Jquery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
</style>


                        <!-- 다영 -->
                        <div class="tab-pane" id="local" role="tabpanel" aria-labelledby="local-tab">
                       <!--  지역별 지도 모습 -->
                        
                        <!-- 지도 위 안내문-->
	                        <div class="local_box">
	  							<nav class="navbar bg-body-tertiary">
  									<div class="container-fluid">
								    <div class="alert alert-success" role="alert">
									  <p>지역별 휴게소</p>
									  <hr>
									  <p class="mb-0">원하는 지역을 눌러 휴게소의 상세 정보를 확인 할 수 있습니다.</p>
									</div>
								  </div>
								</nav>
							</div> 
							
						<!-- post방식으로 불러오기 -->
								<!-- <form method="post" id="hidFrm" action="../day1020/member_detail.jsp">
									<input type="hidden" name="id" id="id"/>
								</form> -->
							 
						</div>
                        <!-- 다영 -->

            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <!-- <script src="js/scripts.js"></script> -->
            <form method="post" id="frm">
            <input type="hidden" id="hidData" name="hidData">
            </form>
        </body>

        </html>
</html>