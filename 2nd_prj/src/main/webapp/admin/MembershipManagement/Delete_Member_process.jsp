<%@page import="org.json.simple.JSONObject"%>
<%@page import="ra.admin.MembershipManagement.MembershipManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//userId, uPw, uName, uNick, uEmail, uTel Date uJoin, uQuit; -->
String userId = request.getParameter("userId");

MembershipManagementDAO mmDAO=MembershipManagementDAO.getInstance();

int cnt=0;
cnt=mmDAO.deleteMember(userId);
JSONObject jsonObj = new JSONObject();

jsonObj.put("cnt", cnt);
System.out.print(cnt);
out.print(jsonObj.toJSONString());

%>