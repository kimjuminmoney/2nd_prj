<%@page import="ra.data_input.food.FoodInputDAO"%>
<%@page import="ra.data_input.food.FoodInputVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RestArea</title>
<link rel="icon" href="http://192.168.10.151/common/main/favicon.ico">
<!-- boost -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>

<script type="text/javascript">
$(function(){
var rac = null; // 초기값을 null로 설정
    
    var select = document.getElementById("mySelect");
    var currentIndex = 0;
    var options = select.getElementsByTagName("option");
    var intervalId = null;

    function changeOption() {
        options[currentIndex].selected = false;
        currentIndex = (currentIndex + 1) % options.length;
        options[currentIndex].selected = true;
        changeOptionInput()
    }

    function startOptionChange() {
        if (intervalId === null) {
            intervalId = setInterval(changeOption, 500);
        }
    }

    function stopOptionChange() {
        if (intervalId !== null) {
            clearInterval(intervalId);
            intervalId = null;
        }
    }
    
    $("#autoBtn").click(function(){
    	
    	startOptionChange();
    });

    // 버튼 클릭 이벤트 처리
    $("#btn").click(function() {
    	changeOptionInput()
    });
    
    /* //option값 변경실 ajax실행
    $("#mySelect").change(function() {
        var selectedOption = $(this).val(); 
        changeOptionInput()
    });  */
    
    //멈춤버튼
    $("#stopBtn").click(function() {
        stopOptionChange();
    });
    
    function changeOptionInput(){
    	rac = $("select option:selected").val(); // 선택된 옵션의 값을 가져와 rac 변수에 할당
		var paddedNumber = rac.toString().padStart(6, '0');
		foodData(paddedNumber);
    }
    

    function foodData(rac) {
        if (rac) {
            var key = '3332053980';
            var apiUrl = "http://data.ex.co.kr/openapi/restinfo/restBestfoodList?key="
                + key + "&type=json&numOfRows=100&pageNo=1&stdRestCd=" + rac;

            // jQuery를 사용하여 API 요청 보내기
            $.ajax({
                url: apiUrl,
                method: 'GET',
                dataType: 'json',
                success: function(jsonData) {
                    console.log('휴게소음식 : ', jsonData);
                    
                    // 데이터를 HTML 테이블에 나타내기
                    var tableHtml = "<table class='table'>";
                    tableHtml += "<tr><th>번호</th><th>음식명</th><th>가격</th><th>정보</th><th>등록일</th></tr>";

                    for (var i = 0; i < jsonData.list.length; i++) {
                        var food = jsonData.list[i];
                        tableHtml += "<tr>";
                        tableHtml += "<td>" + (i+1) + "</td>";
                        tableHtml += "<td>" + food.foodNm + "</td>";
                        tableHtml += "<td>" + food.foodCost + "</td>";
                        tableHtml += "<td>" + food.etc + "</td>";
                        tableHtml += "<td>" + food.lastDtime + "</td>";
                        tableHtml += "</tr>";
                    }

                    tableHtml += "</table>";
                    $("#table-container").html(tableHtml);

                    // 모든 데이터를 JSON 형식으로 묶기
                    var dataToSend = [];

                    for (var i = 0; i < jsonData.list.length; i++) {
                        var food = jsonData.list[i];
                        var foodData = {
                        		fdetail: food.etc,
                        		fname: food.foodNm,
                        		fprice: food.foodCost,
                        		rano: food.stdRestCd,
                        		fdate: food.lastDtime
                        };
                        dataToSend.push(foodData);
                    }

                        console.log("보낸데이터",dataToSend)
                    // data_ajax.jsp로 데이터 보내기
                   $.ajax({
                        url: 'food_ajax.jsp',
                        type: 'POST', // 또는 'GET'에 따라 필요에 맞게 변경
                        data: JSON.stringify(dataToSend),
                        contentType: 'application/json',
                        success: function(response) {
                            // data_ajax.jsp로 데이터를 보내고 나중에 처리하는 코드 작성
                            console.log('데이터를 성공적으로 전송했습니다.');
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.error('데이터 전송 실패:', errorThrown);
                        }
                    });
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('Request failed:', errorThrown);
                }
            });
        }
    }
});//ready

</script>
</head>
<body>
<c:catch var="e">
	<select id="mySelect">
<%
FoodInputDAO dDAO = FoodInputDAO.getInstance();

List<FoodInputVO> list = dDAO.selectRano();
	for( FoodInputVO dVO : list){
%>

		<option value="<%= dVO.getRano()%>"><%= dVO.getRaname()%>(<%= dVO.getRano()%>)</option>
<%} %>	
	</select>
</c:catch>
<c:if test="${ not empty e }">
<strong>오류방생 : ${ e }</strong>
</c:if>
<br>
	<input type="button" id="btn" class="btn btn-success" value="전송"> 
	<input type="button" id="autoBtn" class="btn btn-success" value="시작"> 
	<input type="button" id="stopBtn" class="btn btn-success" value="멈춤"> 
	
	<div id="table-container"></div>
</body>
</html>