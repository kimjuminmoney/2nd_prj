<%@page import="ra.user.login.ClientDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page info="아이디 중복확인" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RestArea</title>
<style type="text/css">
   #wrap { width: 502px; height: 303px; margin: 0px auto; }
   #idDup { width: 502px; height: 303px; background: #FFFFFF url(../../common/logo_images/id_background.png) no-repeat; }
   #idDiv { position: absolute; top: 100px; left: 80px; width: 300px; }
   #idResult { position: absolute; top: 200px; left: 80px; }
</style>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
   $("#btn").click(function() {
       chkNull();
   });
   $("#userId").keydown(function(evt) {
       if (evt.which == 13) {
           chkNull();
       }
   });
});

function chkNull() {
    var id = $("#USERID").val();

    if (id.trim() == "") {
        alert("중복확인할 아이디를 입력해 주세요.");
        return;
    }//end if
    $("#frm").submit();
}

function useId(USERID) {
    // 부모창에 전달한 후(opener)
    opener.window.document.frm.USERID.value = USERID;
    // 중복확인 flag를 설정
    opener.window.document.frm.idDupFlag.value = 1;
    // 자식창을 닫기
    self.close();
}
</script>
</head>
<body>
   <div id="wrap">
      <div id="idDup">
         <div id="idDiv">
            <form name="subFrm" id="frm" action="id_dup.jsp">
               <label>아이디</label>
               <input type="text" id="USERID" name="USERID" class="inputBox" style="width:160px;"
               maxlength="16" autofocus="autofocus" value="${param.USERID}" />
               <input type="button" value="중복확인" class="btn" id="btn" />
               <input type="text" style="display:none" />
            </form>
         </div>
         <div id="idResult">
            <c:catch var="se">
                <%
                String USERID = request.getParameter("USERID");
                if (USERID != null) {
                    // 아이디 길이 검증
                    if (USERID.length() < 4 || USERID.length() > 16) {
                %>
                <span style="color:#DC5460">아이디는 4자 이상 16자 이하로 입력해야 합니다.</span>
                <%
                    } else {
                        // DB에서 입력된 아이디를 검색
                        ClientDAO cDAO = ClientDAO.getInstance();
                        try {
                            boolean flag = cDAO.selectId(USERID);
                %>
                            <strong>${param.USERID}</strong>는
                            <c:choose>
                            <c:when test="${flag}">
                            <span style="color:#DC5460">이미 사용중 입니다.</span>
                            </c:when>
                            <c:otherwise>
                            <span style="color:#233942">사용가능합니다.</span>
                            <a href="javascript:useId('${param.USERID}')">사용</a>
                            </c:otherwise>
                            </c:choose>
                <%
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                }
                %>
            </c:catch>
            <c:if test="${not empty se}">
                문제가 발생하였습니다. 잠시 후 다시 시도해주세요.
                ${ se }
            </c:if>
         </div>
      </div>
   </div>
</body>
</html>
