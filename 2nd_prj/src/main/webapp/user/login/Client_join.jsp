<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
<!-- boost -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">


<%

%>
$(document).ready(function() {
    // req 체크박스의 상태가 변경될 때 호출할 함수
    $("input[name='req']").change(function() {
        if ($(this).is(":checked")) {
            // req 체크박스가 체크되면 req1과 req2도 체크
            $("input[name='req1']").prop("checked", true);
            $("input[name='req2']").prop("checked", true);
        } else {
            // req 체크박스가 체크 해제되면 req1과 req2도 해제
            $("input[name='req1']").prop("checked", false);
            $("input[name='req2']").prop("checked", false);
        }
    });
	
    // 비밀번호 입력란이 변경될 때 호출할 함수
    $("#UPW").change(function(){
        checkPassword($('#UPW').val(), $('#USERID').val());
    });
    

    $("#email1").on("input", function() {
        var regex = /^[a-zA-Z0-9]+$/; // 영어와 숫자만 입력 가능한 정규 표현식
        var inputText = $(this).val();
        
        if (!regex.test(inputText)) {
            alert("영어와 숫자만 입력 가능합니다.");
            $(this).val("");
        }
    });

    


    function checkPassword(password, id) {
        // 비밀번호 유효성 검사 코드 추가
        if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)) {            
            alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
            $('#UPW').val('').focus();
            return false;
        }    
        var checkNumber = password.search(/[0-9]/g);
        var checkEnglish = password.search(/[a-z]/ig);
        if (checkNumber < 0 || checkEnglish < 0) {
            alert("숫자와 영문자를 혼용하여야 합니다.");
            $('#UPW').val('').focus();
            return false;
        }
        if (/(\w)\1\1\1/.test(password)) {
            alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
            $('#UPW').val('').focus();
            return false;
        }
        
        if (password.search(id) > -1) {
            alert("비밀번호에 아이디가 포함되었습니다.");
            $('#UPW').val('').focus();
            return false;
        }
        return true;
    }
    
    
    $("#frm").submit(function(e) {
        var password = $("#UPW").val();
        var confirmPassword = $("#pwchk").val();
        
     // 전체 약관 체크박스를 클릭할 때 실행될 함수
        function selectAll(source) {
            var checkboxes = document.querySelectorAll('input[type="checkbox"][name="req1"], input[type="checkbox"][name="req2"]');
            
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }

        // req 체크박스의 상태가 변경될 때 호출할 함수
        document.querySelector('input[type="checkbox"][name="req"]').addEventListener('change', function() {
            selectAll(this); // req 체크박스 클릭 시 req1과 req2 체크박스 상태 변경
        });

        // 비밀번호가 일치하지 않으면 폼 제출을 막고 경고 메시지를 표시
        if (password !== confirmPassword) {
            e.preventDefault();
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }


        // 개인회원 약관과 개인정보 수집 및 이용에 동의해야 가입 가능하도록 확인
        if (!$("input[name='req1']").is(":checked") || !$("input[name='req2']").is(":checked")) {
            e.preventDefault();
            alert("개인회원 약관 및 개인정보 수집 및 이용에 모두 동의해야 회원 가입이 가능합니다.");
        }
    });
    function isPasswordValid(password) {
        // 비밀번호는 8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 모두 포함해야 함
        var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&]).{8,}$/;
        return regex.test(password);
    }


    $("#btnDup").click(function(){
        var id = $("#USERID").val();
        window.open("id_dup.jsp?USERID=" + id, "id_dup", "width=512,height=313,top=" + (window.screenY + 150) + ",left=" + (window.screenX + 200));
    });

    $("#btn").click(function(){
        // 입력값에 대한 유효성 검증
        if ($("#idDupFlag").val() == 0) {
            alert($("#USERID").val() + "은 중복확인 되지 않은 아이디 입니다.\n 중복확인을 수행해 주세요.");
            return;
        }
        $("#frm").submit();
    });

    $("#USERID").keydown(function(){
        $("#idDupFlag").val(0);
    });
});




</script>

</head>
<body class="sb-nav-fixed">
            <div id="layoutSidenav_content">
               <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header"><h3 class="text-center font-weight-light my-4">회원가입</h3></div>
                                <div class="card-body">
                                    <form id="frm" name="frm" method="post" action="Client_join_process.jsp">
                                    
                                        <div class="container form-group mb-3">
<div class="form-group mb-3">
    <label for="inputFirstName">아이디</label>
    <div class="row">
        <div class="col-md-13">
                 <div class="input-group"> <!-- input과 button을 그룹으로 묶음 -->
                <input class="form-control" name="USERID" id="USERID" type="text" maxlength="20" placeholder="아이디를 입력해주세요" style="width: 430px;" />
                <div class="input-group-append">
                    <input type="button" value="중복확인" class="btn btn-info btn-sm" id="btnDup" />
                </div>
                  <small id="passwordHelp" class="form-text text-muted">아이디는 4자 이상 16자 이하로 입력해야 합니다.</small>
            </div>
        </div>
        <div class="col-md-2">
            <input type="hidden" id="idDupFlag" name="idDupFlag" />
        </div>
    </div>
</div>


<div class="form-group mb-3">
    <label for="inputPassword">비밀번호</label>
    <div class="input-group">
        <input class="form-control" name="UPW" id="UPW" type="password" placeholder="비밀번호를 입력해주세요." />
        <span class="input-group-text">
            <i class="bi bi-lock"></i>
        </span>
    </div>
    <small id="passwordHelp" class="form-text text-muted">비밀번호는 8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 모두 포함해야 합니다.</small>
</div>

<div class="form-group mb-3">
    <label for="pwchk">비밀번호 확인</label>
    <div class="input-group">
        <input class="form-control" name="pwchk" id="pwchk" type="password" placeholder="비밀번호를 다시 한번 입력해주세요." />
        <span class="input-group-text">
            <i class="bi bi-lock"></i>
        </span>
    </div>
</div>



<div class="form-group mb-3">
    <label for="UNAME">이름</label>
    <input class="form-control" name="UNAME" id="UNAME" type="text" placeholder="이름을 입력해주세요." />
</div>

<div class="form-group mb-3">
    <label for="UNICK">닉네임</label>
    <input class="form-control" name="UNICK" id="UNICK" type="text" placeholder="닉네임을 입력해주세요." />
</div>
<div class="form-group mb-3">
    <label for="email">이메일</label>
    <div class="input-group">
        <input class="form-control" name="email1" id="email1" type="text" maxlength="100" placeholder="이메일을 입력해주세요." />
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
    </div>
</div>

<div class="form-group mb-3">
    <label for="UTEL">전화번호</label>
    <input class="form-control" name="UTEL" id="UTEL" type="text" placeholder="전화번호를 입력해주세요" />
</div>
<div id="validationResult"></div>

<script>
const UTELInput = document.getElementById("UTEL");
const validationResult = document.getElementById("validationResult");

// 입력값이 변경될 때마다 유효성 검사 수행
UTELInput.addEventListener("input", validatePhoneNumber);

function validatePhoneNumber() {
    const phoneNumber = UTELInput.value;
    const phoneNumberPattern = /^\d{3}-\d{4}-\d{4}$/; // 예: 000-0000-0000 형식

    if (phoneNumberPattern.test(phoneNumber)) {
        validationResult.textContent = "유효한 전화번호입니다.";
        validationResult.style.color = "green";
    } else {
        validationResult.textContent = "유효하지 않은 전화번호입니다. 예: 000-0000-0000 형식으로 입력하세요.";
        validationResult.style.color = "red";
    }
}
</script>

    <p>약관에 동의합니다.</p>
     <textarea id="termsTextarea" rows="10" cols="93" style="resize: horizontal; width: 100% ;" disabled readonly>
가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
회원가입
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공
- 생성정보 수집 툴을 통한 수집
    </textarea><br/>
    
    <input type="checkbox" name="req"> (필수)전체 약관에 동의<br/>
<hr/>
<!-- 두 개의 체크박스는 기본적으로 비선택 상태 -->
<input type="checkbox" name="req1"> (필수)개인회원 약관에 동의<br/>
<input type="checkbox" name="req2"> (필수)개인정보 수집 및 이용에 동의합니다.<br/><br/>

 <div style="text-align: center;"> <!-- 가운데 정렬 스타일 추가 -->
        <button type="button" value="가입"  id="btn" class="btn btn-success">회원가입</button>
    </div>
<script>


											</script>
										</div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
                </div>
                <!-- 풋터 -->
                <footer class="py-4 bg-light mt-auto">
                    <jsp:include page="../myinfo_nav/include_footer.jsp"></jsp:include>
                </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../../common/js/datatables-simple-demo.js"></script>
    </body>
</html>