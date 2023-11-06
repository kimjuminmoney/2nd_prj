<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ra.user.myinfo.myPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="수정된 개인정보를 트랜잭션 전송하는 페이지" %>
<%
request.setCharacterEncoding("UTF-8");

DataEncrypt de= new DataEncrypt("a12345678901234567");

String id = request.getParameter("uId");

String uNic=request.getParameter("uNic");

String uTel=request.getParameter("uTel");
uTel=de.encryption(uTel);

String uEmail=request.getParameter("uEmail");
uEmail=de.encryption(uEmail);

myPageDAO mpDAO = myPageDAO.getInstance();

int cnt = mpDAO.modifyInfo(id, uNic, uEmail, uTel);

JSONObject jsonObj=new JSONObject();
jsonObj.put("cnt",cnt);

out.print(jsonObj.toJSONString());


%>



