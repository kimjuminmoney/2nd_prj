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
<%@ page info="   " %>
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
Type listType = new TypeToken<List<ConviItem>>() {}.getType();
List<ConviItem> conviList = gson.fromJson(Strjson, listType);
// 파싱된 데이터 출력
ConviInputVO ciVO = null;
ConviInputDAO ciDAO = ConviInputDAO.getInstance();
List<ConviInputVO> list = new ArrayList<ConviInputVO>();
int cnt = 0;
try{

	int psCode = 0;
	int rano = 0;
	

	// 입력된 문자열을 Date 객체로 변환
    SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
    Date date = null;

    // Date 객체를 SQL Date로 변환
   java.sql.Date sqlDate = null;
	 String[] possibleDateFormats = {"yy/MM/dd", "yyyy-MM-dd", "MM/dd/yy", "dd/MM/yyyy"}; // 필요한 형식을 추가할 수 있음
	 SimpleDateFormat sourceFormat = null;
for(int i=0; i<conviList.size();i++){
	//sqlDate 형으로 변환
		
	for (String format : possibleDateFormats) {
	    try {
	        sourceFormat = new SimpleDateFormat(format);
	        date = sourceFormat.parse(conviList.get(i).getRedDtime());
	        sqlDate = new java.sql.Date(date.getTime());
	        break; // 올바른 형식을 찾았으면 루프를 종료
	    } catch (ParseException e) {
	        // 날짜 형식이 일치하지 않으면 다음 형식 시도
	    }
	}
	
	psCode = Integer.parseInt(conviList.get(i).getPsCode());
	rano = Integer.parseInt(conviList.get(i).getStdRestCd());
	
	ciVO = new ConviInputVO();
	ciVO.setRano(String.valueOf(rano));
	ciVO.setCdetail (conviList.get(i).getPsDesc());
	ciVO.setCname(conviList.get(i).getPsName());
	ciVO.setSqlDate(sqlDate);
	ciVO.setIno(psCode);
	ciVO.setCno(i+1);
	list.add(ciVO);
	cnt += ciDAO.insertConvi(ciVO);
}
}catch (SQLException se){
	se.printStackTrace();
}
%>