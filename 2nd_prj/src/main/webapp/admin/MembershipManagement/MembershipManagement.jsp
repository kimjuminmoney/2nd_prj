<%@page import="ra.admin.MembershipManagement.MembershipManagementVO"%>
<%@page import="ra.admin.MembershipManagement.MembershipManagementDAO"%>
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
<%request.setCharacterEncoding("UTF-8");
 
   MembershipManagementDAO mmDAO = new MembershipManagementDAO();
   MembershipManagementVO mmVO = mmDAO.selectUserInfo("test");

	String uNic=request.getParameter("uNick");

	if( uNic != null && !"".equals(uNic)){
		String USERID=request.getParameter("userid");
		String UNICK= request.getParameter("name");
		String UTEL=request.getParameter("UTEL");
		String UNAME=request.getParameter("UNAME");
		USERID="test";
		mmDAO.modifyMember(USERID, UNICK, UTEL); %>
		alert("변경이 완료되었습니다.");
		<%
	 mmVO = mmDAO.selectUserInfo("test");
	}
		//session.removeAttribute("flag");
%>


function modifyMm(i) {
	var jsonObj={
			"UNICK" : $("#UNICK"+i).val()
	}
	$.ajax({
		url:"modifyMm_process.jsp",
		type:"post",
		data:jsonObj,
		dataType:"json",
		error:function(xhr){
			console.log(xhr.status);
		},
		success:function(temp){
			var tempScore = temp.Score;
			var tempText = temp.Text;
			var cnt=temp.cnt;
			
			if(cnt==1){
				$("#mmText")
			}
		}
	})
}

function deleteMm(i) {
	var jsonObj={
		"UNIC" : $("#UNIC"+i).val(),
		
	}
	$.ajax({
		url:"removeMm_process.jsp",
		type:"post",
		data:jsonObj,
		dayaType:"json",
		error:function(xhr){
			console.log(xhr.status);
		},
		success:function( temp ){
			var tempId=temp.UNIC;
			var cnt=temp.cnt;
			alert(tempNic+"삭제되었습니다.");
			location.reload()
		}
	})
	
}


$(function(){
 
 $("#btn_modify").click(function(){
	
 $("#info_frm").submit();

});//click
 
});//ready

		

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
                       	 	<h1 class="list-unstyled" >회원정보</h1>
                        </div>
                     </div>
					<div class="flex-container">
						<div id="fc">
							<label id="inputuserid" class="form-label">아이디</label>
							<input style="width:400px" id="USERID" name="USERID" class="form-control" type="text" value="<%=mmVO.getUSERID() %>"><br/>
								
							<label id="inputname" class="form-label">이름</label>
							<input id="UNAME" name="UNAME" class="form-control" type="text" value="<%=mmVO.getUNAME() %>"><br/>

							<div class="form-group mb-3">
						    <label for="email">이메일</label>
						    <div class="input-group">
						        <input class="form-control" name="email1" id="email1" type="text" maxlength="100" placeholder="이메일을 입력해주세요." value="<%= mmVO.getEmail()%>"/>
						        <span class="input-group-text">@</span>
						        <select class="form-select" name="email2" id="email2" data-value="이메일을 선택해주세요.">
						            <option value="naver.com">naver.com</option>
						            <option value="daum.net">daum.net</option>
						            <option value="gmail.com">gmail.com</option>
						            <option value="hotmail.com">hotmail.com</option>
						            <option value="nate.com">nate.com</option>
						            <option value="korea.com">korea.com</option>
						            <!-- 다른 도메인 옵션을 추가할 수 있습니다 -->
						        </select>
						</div><br/>
							 
							<label id="inputUTEL" class="form-label">전화번호</label>
							<input id="UTEL" name="UTEL" class="form-control" type="text" value="<%= mmVO.getUTEL()%>"><br />

							<label id="inputNick" class="form-label">닉네임</label>
							<select id="UNICK" name="UNICK" class="form-control"" value="<%= mmVO.getUNICK()%>"><br />
						</div>                        
			                 <div id="hw">
							
							<label id="inputUJOIN" class="form-label">가입일</label> 
							<input id="UJOIN" name="UJOIN" class="form-control" type="text" value="<%=mmVO.getUJOIN()%>"><br /> 
							
							<label id="inputUQUIT" class="form-label">탈퇴일</label> 
							<input id="UQUIT" name="UQUIT" class="form-control" type="text" value="<%=mmVO.getUQUIT()%>"><br />
								  
						</div>
								  
								  <c:otherwise>
		                            	<div class="card-body" style="height:100px;">
			                                <textarea id="rvText${ i.count }"  name="rvText${ i.count }" class="form-control">${ rv.rvText }</textarea>
		                        		</div>
				                            <div id="btn_review" class="card-footer">
								<input type="button" onclick="deleteMm(${i.count})" class="btn btn-outline-dark" value="회원탈퇴" style="border:1px solid #000"/>
								<input type="button" onclick="modifyMm(${i.count})" class="btn btn-outline-dark" value="확인" style="border:1px solid #000"/>
							
							</c:otherwise>
					</div>
					<br />
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