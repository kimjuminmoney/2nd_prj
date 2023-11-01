<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ra.user.cs.raVO"%>
<%@page import="java.util.List"%>
<%@page import="ra.user.cs.myCSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<% 

String loc=request.getParameter("loc");
myCSDAO mcDAO=myCSDAO.getInstance();
List<raVO> raList=mcDAO.selectRA(loc);

JSONObject jsonObj=new JSONObject();
JSONArray jsonArr=new JSONArray();

for(raVO r : raList){
	jsonObj=new JSONObject();
	jsonObj.put("raName",r.getRaName());
	jsonObj.put("raNo",r.getRaNo());
	jsonArr.add(jsonObj);
}
out.print(jsonArr.toJSONString());


%>