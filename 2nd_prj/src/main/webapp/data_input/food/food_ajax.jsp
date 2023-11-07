<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ra.data_input.food.FoodInputDAO"%>
<%@page import="ra.data_input.food.FoodInputVO"%>
<%@page import="ra.data_input.food.FoodItem"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Type"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info="   "%>
<%
BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
StringBuilder jsonData = new StringBuilder();
String line;
while ((line = reader.readLine()) != null) {
	jsonData.append(line);
}
// JSON 데이터 예시
String Strjson = jsonData.toString();
System.out.println(Strjson);
// Gson 객체 생성
Gson gson = new Gson();
//System.out.print(Strjson);
// TypeToken을 사용하여 List<FoodItemVO>로 파싱
Type listType = new TypeToken<List<FoodItem>>() {
}.getType();
List<FoodItem> foodList = gson.fromJson(Strjson, listType);
// 파싱된 데이터 출력

for (FoodItem fVO : foodList) {
	System.out.println("음식명: " + fVO.getFname());
	System.out.println("가격: " + fVO.getFprice());
	System.out.println("기타: " + fVO.getFdetail());
	System.out.println("코드: " + fVO.getRano());
	System.out.println("등록날짜: " + fVO.getFdate());
	System.out.println("-------------------");
}
FoodInputVO dVO = null;
List<FoodInputVO> list = new ArrayList<FoodInputVO>();
FoodInputDAO dDAO = FoodInputDAO.getInstance();
int cnt = 0;

int number = 0;

// 입력된 문자열을 Date 객체로 변환
SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
Date date = null;

// Date 객체를 SQL Date로 변환
java.sql.Date sqlDate = null;
String[] possibleDateFormats = { "yy/MM/dd", "yyyy-MM-dd", "MM/dd/yy", "dd/MM/yyyy" }; // 필요한 형식을 추가할 수 있음
SimpleDateFormat sourceFormat = null;
for (int i = 0; i < foodList.size(); i++) {
	try {

		/*  date = dateFormat.parse(foodList.get(i).getFdate());
	sqlDate = new java.sql.Date(date.getTime());
	*/
		for (String format : possibleDateFormats) {
	try {
		sourceFormat = new SimpleDateFormat(format);
		date = sourceFormat.parse(foodList.get(i).getFdate());
		sqlDate = new java.sql.Date(date.getTime());
		break; // 올바른 형식을 찾았으면 루프를 종료
	} catch (ParseException e) {
		e.printStackTrace();
		System.out.println("ParseException 발생. dVO 정보: " + foodList.get(i).toString());
	}
		}
		number = Integer.parseInt(foodList.get(i).getRano());

		dVO = new FoodInputVO();
		dVO.setFdetail(foodList.get(i).getFdetail());
		dVO.setFname(foodList.get(i).getFname());
		dVO.setFprice(Integer.parseInt(foodList.get(i).getFprice()));
		dVO.setRano(String.valueOf(number));
		dVO.setFdate(foodList.get(i).getFdate());
		dVO.setSqlDate(sqlDate);
		dVO.setFno(i + 1);
		list.add(dVO);
		cnt += dDAO.insertFood(dVO);
		//System.out.println( "푸드넘버"+dVO.getFno() + "번 성공 /" +cnt + "번째 " );
	} catch (NumberFormatException nfe) {
		nfe.printStackTrace();
		System.out.println("NumberFormatException 발생. dVO 정보: " + dVO.toString());
	} catch (SQLException se) {
		se.printStackTrace();
		System.out.println("SQLException 발생. dVO 정보: " + dVO.toString());
	}
}
%>