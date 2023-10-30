<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="myPage.MyReviewDAO"%>
<%@page import="myPage.MyReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); 

MyReviewVO mrVO = new MyReviewVO();
MyReviewDAO mrDAO = MyReviewDAO.getInstance();

String id=request.getParameter("id");
id="HJS";
int rvNo=Integer.parseInt(request.getParameter("rvNo"));

JSONObject jsonObj=new JSONObject();

int cnt=0;
try{
cnt = mrDAO.deleteReview(id, rvNo);
}catch(SQLException se){
	se.printStackTrace();
}
jsonObj.put("rvNo",rvNo);
jsonObj.put("cnt",cnt);

out.print(jsonObj.toJSONString());

%>
