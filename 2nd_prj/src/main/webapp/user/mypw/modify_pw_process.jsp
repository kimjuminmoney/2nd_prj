<%@page import="org.json.simple.JSONObject"%>
<%@page import="ra.user.pw.ModifyPwDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");

String id=request.getParameter("sesId");
id="test";
String pw=request.getParameter("pw");

DataEncrypt de=new DataEncrypt("a12345678901234567");

pw=de.encryption(pw);

ModifyPwDAO mpDAO= ModifyPwDAO.getInstance();
int cnt=mpDAO.ModifyPW(id, pw);
JSONObject jsonObj=new JSONObject();

jsonObj.put("cnt",cnt);

out.println(jsonObj.toJSONString());


%>