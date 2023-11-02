<%@page import="ra.user.search.SearchDAO"%>
<%@page import="ra.user.search.SearchVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setHeader("Access-Control-Allow-Origin", "http://localhost");
	// 클라이언트에서 전송한 JSON 데이터 수신
	BufferedReader reader = request.getReader();
	StringBuilder data = new StringBuilder();
	String line = "";
	while ((line = reader.readLine()) != null) {
	  data.append(line);
	}//end while
	// 대괄호와 쌍따옴표를 제거
	data.deleteCharAt(0);
	data.deleteCharAt(data.length() - 1);
	String redata = data.toString().replace("\"", "").replace("휴게소", "");

	String[] parts = redata.split(",");
	/* for (String part : parts) {
	    System.out.println(part);
	} */
		
		SearchVO sVO = null;
	// JSON 데이터를 ArrayList<VO>로 변환
	SearchDAO sDAO = SearchDAO.getInstance();
	List<SearchVO> resultList = new ArrayList<SearchVO>();
	List<SearchVO> list = null;
	for(int i =0; i < parts.length;i++){
		list = sDAO.selectra(parts[i]);
		for(int j =0; j < list.size();j++){
		resultList.add(list.get(j));
		}//end for
	}//end for
	
	
	
	// 여기에서 "휴게소" 제거 및 VO 객체 생성 및 리스트에 추가하는 작업을 수행
	// ...
	
	// ArrayList<VO>를 JSON 문자열로 변환
	String jsonResponse = new Gson().toJson(resultList);
	
	// JSON 응답 보내기
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	response.getWriter().write(jsonResponse);
%>