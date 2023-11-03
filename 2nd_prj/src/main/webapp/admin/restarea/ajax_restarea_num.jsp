<%@page import="ra.user.restarea.FoodVO"%>
<%@page import="ra.user.restarea.RestDAO"%>
<%@page import="ra.admin.restarea.ManageFoodDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ManageFoodDAO mfDAO = ManageFoodDAO.getInstance();
String raname = request.getParameter("restareaname");


RestDAO rDAO = RestDAO.getInstance();

String raNum = rDAO.selectRestAreaNum(raname);
List<FoodVO> foodList = rDAO.selectFood(raNum);

for(int i=0; i<foodList.size(); i++){
	FoodVO fVO = foodList.get(i);
}//end for

//response.sendRedirect("manageFood.jsp?raNum="+raNum);


JSONObject jo=new JSONObject();
jo.put("raNum", raNum);
out.println(jo.toJSONString());

%>