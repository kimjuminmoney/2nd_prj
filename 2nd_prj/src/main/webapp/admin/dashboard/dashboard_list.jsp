<%@page import="ra.admin.dashboard.DashboardVO"%>
<%@page import="ra.admin.dashboard.DashboardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.list0, .list1, .list2, .list3, .list4, .list5, .list6, .list7, .list8, .list9, 
.list10,.list11, .list12, .list13, .list14, .list15, .list16{
	clear:both; margin-top: 200px; margin-left: 150px;
}

.list0 { position: relative; z-index: 1; top: -35px; left: -5px; } 
.list1 { position: absolute; z-index: 1; top: 260px; left: 20px; }
.list2 { position: absolute; z-index: 2; top: 215px; left: 52px; } 
.list3 { position: absolute; z-index: 3; top: 232px; left: 115px; } 
.list4 { position: absolute; z-index: 4; top: 050px; left: 88px; } 
.list5 { position: absolute; z-index: 5; top: 154px; left: 35px; } 
.list6 { position: absolute; z-index: 6; top: 074px; left: 63px; } 
.list7 { position: absolute; z-index: 7; top: 143px; left: 98px; } 
.list8 { position: absolute; z-index: 8; top: 147px; left: 128px; } 
.list9 { position: absolute; z-index: 9; top: 368px; left: 40px; } 
.list10 {position: absolute; z-index: 10; top: 112px; left: 72px; } 
.list11 { position: absolute; z-index: 11; top: 101px; left: 39px; } 
.list12 { position: absolute; z-index: 12; top: 192px; left: 96px; } 
.list13 { position: absolute; z-index: 13; top: 275px; left: 62px; } 
.list14 { position: absolute; z-index: 14; top: 223px; left: 157px; } 
.list15 { position: absolute; z-index: 15; top: 242px; left: 189px; } 
.list16 { position: absolute; z-index: 16; top: 263px; left: 179px; }
</style>

<!-- 지역별 지도 조각 -->




<body>
<div style="clear:both; position: relative; z-index: 1; top: -35px; left: 25; ">


<!-- 수도권: 서울, 인천, 경기 -->
<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus10') onmouseout=mus_off('mus10') onclick=smenu_click('서울')>
<input type="hidden" value="서울" id="seoul">
<img src='loc/map/m02.gif' alt='' border='0' name='mus10' class='list10' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus11') onmouseout=mus_off('mus11') onclick=smenu_click('인천')>
<input type="hidden" value="인천" id="InCheon">
<img src='loc/map/m032.gif' alt='' border='0' name='mus11' class='list11' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus6') onmouseout=mus_off('mus6') onclick=smenu_click('경기')>
<input type="hidden" value="경기" id="gyeongGiDo">
<img src='loc/map/m031.gif' alt='' border='0' name='mus6' class='list6' ></a>


<!-- 강원 -->
<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus4') onmouseout=mus_off('mus4') onclick=smenu_click('강원')>
<input type="hidden" value="강원"id="gangWon">
<img src='loc/map/m033.gif' alt='' border='0' name='mus4' class='list4' ></a>


<!-- 충청: 충남, 충북, 대전 -->
<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus5') onmouseout=mus_off('mus5') onclick=smenu_click('충남')>
<input type="hidden" value="충남" id="chungNam">
<img src='loc/map/m041.gif' alt='' border='0' name='mus5' class='list5' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus7') onmouseout=mus_off('mus7') onclick=smenu_click('충북')>
<input type="hidden" value="충북" id="chungBug">
<img src='loc/map/m043.gif' alt='' border='0' name='mus7' class='list7' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus12') onmouseout=mus_off('mus12') onclick=smenu_click('대전')>
<input type="hidden" value="대전" id="daeJeon">
<img src='loc/map/m042.gif' alt='' border='0' name='mus12' class='list12' ></a>


<!-- 호남: 전남, 전북, 광주 -->
<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus1') onmouseout=mus_off('mus1') onclick=smenu_click('전남')>
<input type="hidden" value="전남" id="jeonNam">
<img src='loc/map/m061.gif' alt='' border='0' name='mus1' class='list1' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus2') onmouseout=mus_off('mus2') onclick=smenu_click('전북')>
<input type="hidden" value="전북" id="jeonBug">
<img src='loc/map/m063.gif' alt='' border='0' name='mus2' class='list2' ></a>

<a href="#void" onfocus='this.blur()' onmouseover=mus_on('mus13') onmouseout=mus_off('mus13') onclick=smenu_click('광주')>
<input type="hidden" value="광주" id="gwangJu">
<img src='loc/map/m062.gif' alt='' border='0' name='mus13' class='list13' ></a>


<!-- 영남: 경남, 경북, 대구, 울산, 부산  -->
<a href='#void' onfocus='this.blur()' onmouseover=mus_on('mus3') onmouseout=mus_off('mus3') onclick=smenu_click('경남')>
<input type="hidden" value="경남" id="gyeongNam">
<img src='loc/map/m055.gif' alt='' border='0' name='mus3' class='list3' ></a>

<a href='#void' onfocus='this.blur()' onmouseover=mus_on('mus8') onmouseout=mus_off('mus8') onclick=smenu_click('경북')>
<input type="hidden" value="경북" id="gyeongBug">
<img src='loc/map/m054.gif' alt='' border='0' name='mus8' class='list8' ></a>

<a href='#void' onfocus='this.blur()' onmouseover=mus_on('mus14') onmouseout=mus_off('mus14') onclick=smenu_click('대구')>
<input type="hidden" value="대구" id="daeGu">
<img src='loc/map/m053.gif' alt='' border='0' name='mus14' class='list14' ></a>

<a href='#void' onfocus='this.blur()' onmouseover=mus_on('mus15') onmouseout=mus_off('mus15') onclick=smenu_click('울산')>
<input type="hidden" value="울산" id="ulSan">
<img src='loc/map/m052.gif' alt='' border='0' name='mus15' class='list15' ></a>

<a href='#void' onfocus='this.blur()' onmouseover=mus_on('mus16') onmouseout=mus_off('mus16') onclick=smenu_click('부산')>
<input type="hidden" value="부산" id="buSan">
<img src='loc/map/m051.gif' alt='' border='0' name='mus16' class='list16' ></a>


<!-- 제주 -->
<a href='#void' onfocus='this.blur()' onmouseover="mus_on('mus9')" onmouseout="mus_off('mus9')" onclick="smenu_click('제주는 서비스 불가 지역 입니다.')">
<input type="hidden" value="제주" id="jeJu">
<img src='loc/map/m064.gif' alt='' border='0' name='mus9' class='list9' ></a>



</div>
<form>
<input type="hidden" id="locHid" name="locHid">

</form>

</body>



    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>

</script>

<!-- 하단 테이블  -->
<%
DashboardDAO dbDAO = DashboardDAO.getInstance();
DashboardVO dbVO = new DashboardVO();

try{
int joinDay = dbDAO.selectDailyJoin();
int joinCnt = dbDAO.selectJoinSum();
int reviewDay = dbDAO.selectDailyReview();
int reviewCnt = dbDAO.selectReviewSum1();
int withdrwalDay = dbDAO.selectDailyWithdrwal();
int withdrwalCnt = dbDAO.selectWithdrawalSum();

pageContext.setAttribute("joinDay", joinDay);
pageContext.setAttribute("joinCnt", joinCnt);
pageContext.setAttribute("reviewDay", reviewDay);
pageContext.setAttribute("reviewCnt", reviewCnt);
pageContext.setAttribute("withdrwalDay", withdrwalDay);
pageContext.setAttribute("withdrwalCnt", withdrwalCnt);

}catch(SQLException se){
	se.printStackTrace();
}

%>
<tbody>
	<tr>
		<td><c:out value="${ joinDay }"/></td>
		<td><c:out value="${ joinCnt }"/></td>
		<td><c:out value="${ reviewDay }"/></td>
		<td><c:out value="${ reviewCnt }"/></td>
		<td><c:out value="${ withdrwalDay }"/></td>
		<td><c:out value="${ withdrwalCnt }"/></td>
	</tr>
</tbody>

