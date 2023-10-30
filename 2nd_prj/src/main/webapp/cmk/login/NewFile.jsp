<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.148/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>
 <div class="container">
   <div class="row">
					    <div class="col">
					       <label for="inputFirstName">아이디</label>
					    </div>
					    <div class="col">
					  <input class="form-control" name="id" id="id" type="text" maxlength="20"  style="width: 400px" placeholder="아이디를 입력해주세요" />
					    </div>
					    <div class="col">
					    <input type="button" value="중복확인" class="btn btn-info" id="btnDup"  />
					    </div>
					    <div class="col">
					     <input type="hidden" id="idDupFlag" name="idDupFlag"/>
					    </div>
					  </div>
					</div>

                                          
                                            
						                   
</body>
</html>