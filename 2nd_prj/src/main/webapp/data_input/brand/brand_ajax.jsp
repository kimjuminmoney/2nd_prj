<%@page import="ra.data_input.brand.BrandInputDAO"%>
<%@page import="ra.data_input.brand.BrandInputVO"%>
<%@page import="ra.data_input.brand.BrandItem"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ra.data_input.convi.ConviInputDAO"%>
<%@page import="ra.data_input.convi.ConviInputVO"%>
<%@page import="ra.data_input.convi.ConviItem"%>
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
// Gson 객체 생성
Gson gson = new Gson();

// TypeToken을 사용하여 List<FoodItemVO>로 파싱
Type listType = new TypeToken<List<BrandItem>>() {
}.getType();
List<BrandItem> brandList = gson.fromJson(Strjson, listType);
// 파싱된 데이터 출력
/* for (BrandItem bi : brandList) {
	System.out.println("휴게소번호: " + bi.getStdRestCd());
	System.out.println("브랜드명: " + bi.getBrdName());
	System.out.println("설명: " + bi.getBrdDesc());
	System.out.println("등록일: " + bi.getRedDtime());
	System.out.println("시설코드: " + bi.getBrdCode());
	System.out.println("-------------------");
} */
BrandInputVO biVO = null;
BrandInputDAO biDAO = BrandInputDAO.getInstance();
List<BrandInputVO> list = new ArrayList<BrandInputVO>();
int cnt = 0;

int rano = 0;
int bino = 0;

// 입력된 문자열을 Date 객체로 변환
SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
Date date = null;

// Date 객체를 SQL Date로 변환
java.sql.Date sqlDate = null;
String[] possibleDateFormats = { "yy/MM/dd", "yyyy-MM-dd", "MM/dd/yy", "dd/MM/yyyy" }; // 필요한 형식을 추가할 수 있음
SimpleDateFormat sourceFormat = null;
for (int i = 0; i < brandList.size(); i++) {
	//sqlDate 형으로 변환
	try {
		for (String format : possibleDateFormats) {
	try {
		sourceFormat = new SimpleDateFormat(format);
		date = sourceFormat.parse(brandList.get(i).getRedDtime());
		sqlDate = new java.sql.Date(date.getTime());
		break; // 올바른 형식을 찾았으면 루프를 종료
	} catch (ParseException e) {
		System.out.println("날짜형식 오류 : " +brandList.get(i).toString());
	}//ParseException
		}//end for

		rano = Integer.parseInt(brandList.get(i).getStdRestCd());
		bino = Integer.parseInt(brandList.get(i).getBrdCode());	

		biVO = new BrandInputVO();
		biVO.setRano(String.valueOf(rano));
		biVO.setBdetail(brandList.get(i).getBrdDesc());
		biVO.setBname(brandList.get(i).getBrdName());
		biVO.setSqlDate(sqlDate);
		biVO.setBino(String.valueOf(bino));
		biVO.setBno(i + 1);
		list.add(biVO);
		cnt++;
		biDAO.insertBrand(biVO);
		System.out.println(cnt+"번 성공");
		//System.out.println("휴게소 번호 : " + biVO.getRano()+" [편의시설번호 :"+ biVO.getBno() + "]["+ cnt + "번 성공]");
	} catch (NumberFormatException nfe) {
		nfe.printStackTrace();
		System.out.println("NumberFormatException 발생. dVO 정보: " + biVO.toString());
		System.out.println(cnt+"번 실패");
	} catch (SQLException se) {
		se.printStackTrace();
		System.out.println("SQLException 발생. dVO 정보: " + biVO.toString());
		System.out.println(cnt+"번 실패");
	}//catch
}//end for
%>