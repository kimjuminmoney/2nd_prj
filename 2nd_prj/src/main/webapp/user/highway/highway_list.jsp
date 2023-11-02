<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script type="text/javascript">
$(function(){

	$("#highway-tab").click(function(){
		var jsonObj ={};
		$.ajax({
			url:"highway/Highway_open_process.jsp",
			type:"post",
			data:jsonObj,
			dataType:"json",
			error:function(xhr){
				console.log(xhr.status);
			},
			success:function( tempArr ){
				var output="";
					output+="<table>"
				$.each(tempArr, function(i, json ){
					output+="<tr class='row'><td><div value='"+tempArr[i].hNo+"' onclick='raList("+tempArr[i].hNo+")'>"+tempArr[i].hName+"</div></td></tr>"

					});//end each
					output+="</table>"
				$("#hList").html(output);			
				}//success 
			});//ajax
	})//click
	
})//ready

function raList( hNo ){
	var jsonObj ={ "hNo" : hNo };
	$.ajax({
		url:"highway/Restarea_open_process.jsp",
		type:"post",
		data:jsonObj,
		dataType:"json",
		error:function(xhr){
			console.log(xhr.status);
		},
		success:function( tempArr ){
			var output="";
			output+="<table>"
		$.each(tempArr, function(i, json ){
			output+="<tr class='row'><td><div value='"+tempArr[i].raNo+"' onclick='moveRA("+tempArr[i].raNo+")'>"+tempArr[i].raName+"</div>";
			output+="<input type='hidden' id='raName"+tempArr[i].raNo+"' value='"+tempArr[i].raName+"'>";
			output+="<input type='hidden' id='raX"+tempArr[i].raNo+"' value='"+tempArr[i].raX+"'>";
			output+="<input type='hidden' id='raY"+tempArr[i].raNo+"' value='"+tempArr[i].raY+"'>";
			output+="</td></tr>";

			});//end each
			output+="</table>";
			$("#raList").html(output);
			}//success
		});//ajax
}//raList
function moveRA( rano ){

	//휴게소 이름
	var raName=$("#raName"+rano).val();

	var marker = null;
	//x,y좌표값 설정
	var rax=$("#raX"+rano).val();
	var ray=$("#raY"+rano).val();
	
	var markerPosition  = new kakao.maps.LatLng(rax, ray); 
	//배치
	marker = new kakao.maps.Marker({
	    position: markerPosition,
	    clickable: true
	});
	
	marker.setMap(map);

	var iwContent = "<div style='padding:5px;'><a href='ra_page/restarea_page.jsp?rano='"+rano+"'>"+raName+"</a></div>"
	var iwRemoveable = true; 
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : iwRemoveable
	});
	
	kakao.maps.event.addListener(marker, 'click', function() {
		 infowindow.open(map, marker);  
	});
	
	map.setCenter(markerPosition);
    
}//moveRA

 </script>
