<%@page import="ra.user.loc.LocalSearchVO"%>
<%@page import="ra.user.loc.LocalRestDAO"%>
<%@page import="ra.user.loc.LatLngVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 페이지 지시자 설정 --%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
	private static Map<String,LatLngVO> map=null;

	static{
	map=new HashMap<String,LatLngVO>();
	
	map.put("서울",new LatLngVO(37.56680618275856, 126.97865226396553));
	map.put("인천",new LatLngVO(37.45541782782637, 126.70486479500002));
	map.put("경기",new LatLngVO(37.288760055752924, 127.05370235949646));
	map.put("강원",new LatLngVO(37.885296007656116, 127.72983667362601));
	map.put("충남",new LatLngVO(36.658823851198, 126.67277789438113));
	map.put("충북",new LatLngVO(36.6353144624646, 127.49146431652277));
	map.put("대전",new LatLngVO(36.35048259471354, 127.38482899946409));
	map.put("전남",new LatLngVO(34.816043439644275, 126.46280006087093));
	map.put("전북",new LatLngVO(35.820195455176155, 127.10898501017087));
	map.put("광주",new LatLngVO(35.16005239546396, 126.85163828080933));
	map.put("경남",new LatLngVO(35.23768689993227, 128.69192143849028));
	map.put("경북",new LatLngVO(36.57597416220703, 128.505798268333));
	map.put("대구",new LatLngVO(35.8713631180291, 128.60180736020476));
	map.put("울산",new LatLngVO(35.53957875859995, 129.31160847733696));
	map.put("부산",new LatLngVO(35.179707926039455, 129.07508354364657));
	}
%>
<%
      
   String loc=request.getParameter("loc");


	JSONObject jsonObj = new JSONObject();
	jsonObj.put("flag", false);
	System.out.print(loc);
		
	if(loc != null ) {

		LocalRestDAO lrDAO = LocalRestDAO.getInstance();
	
	try{
		List<LocalSearchVO> list = lrDAO.selectLoc(loc);
		
		JSONObject jsonTemp=null;
		JSONArray jsonArr=new JSONArray(); //조회결과를 저장한 JSONObject을 저장할 JSONArray
		for(LocalSearchVO lsVO : list){ //조회결과가 있다면 반복시켜
			jsonTemp=new JSONObject();//JSONObject을 생성하고
			jsonTemp.put("localName", lsVO.getLocalName()); //값 을 설정한다.
			jsonTemp.put("x", lsVO.getX());
			jsonTemp.put("y", lsVO.getY());
			
			jsonArr.add( jsonTemp );//값을 추가한다.
			
		}
		jsonObj.put("data", jsonArr); //휴게소데이터
		
		LatLngVO llVO= map.get( loc ) ;
		jsonObj.put("lat", llVO.getLat()); //선택한 지도 중심좌표
		jsonObj.put("lng", llVO.getLng()); //선택한 지도 중심좌표
		
		//선택한 지역의 중심좌표를 얻는다. 
		jsonObj.put("flag", true);
	} catch (SQLException se) {
		se.printStackTrace();
	}
	}//end if
		out.print(jsonObj.toJSONString());
%>

