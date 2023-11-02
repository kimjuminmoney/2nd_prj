<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="ra.user.highway.HighwayVO"%>
<%@page import="ra.user.highway.HighwayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");

HighwayDAO hDAO=HighwayDAO.getInstance();

List<HighwayVO> hVOList=hDAO.selectAllHighways();

JSONObject jsonObj=null;
JSONArray jsonArr=new JSONArray();

for(HighwayVO hVO : hVOList){
	jsonObj=new JSONObject();
	
	jsonObj.put("hNo",hVO.gethNo());
	jsonObj.put("hName",hVO.gethName());
	jsonArr.add(jsonObj);
}
out.print(jsonArr.toJSONString());




%>
