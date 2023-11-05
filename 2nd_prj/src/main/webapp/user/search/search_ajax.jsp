<%@page import="com.google.gson.JsonObject"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="ra.user.search.SearchName"%>
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
		
	Gson gson = new Gson();
	SearchName myDataList = new SearchName();
	List<String> names = new ArrayList<>();

	// 여기에서 JSON 데이터를 파싱하여 "name" 필드 값을 리스트에 추가합니다.
	JsonParser parser = new JsonParser();
	JsonArray jsonArray = parser.parse(data.toString()).getAsJsonArray();
	for (JsonElement element : jsonArray) {
	    JsonObject jsonObject = element.getAsJsonObject();
	    String name = jsonObject.get("name").getAsString();
	    names.add(name);
	}

	myDataList.setNames(names);
	List<String> nameList = myDataList.getNames();

	List<String> filteredList = nameList.stream()
            .filter(value -> value.contains("휴게소"))
            .map(value -> value.replace("휴게소", "")) // "휴게소"를 빈 문자열로 대체
            .toList();

		
		SearchVO sVO = null;
	// JSON 데이터를 ArrayList<VO>로 변환
	SearchDAO sDAO = SearchDAO.getInstance();
	List<SearchVO> resultList = new ArrayList<SearchVO>();
	List<SearchVO> list = null;
	for(int i =0; i < filteredList.size();i++){
		list = sDAO.selectra(filteredList.get(i));
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