<%@page import="org.json.simple.JSONObject"%>
<%@page import="ra.admin.MembershipManagement.MembershipManagementDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="ra.admin.MembershipManagement.MembershipManagementVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String userId = request.getParameter("userId");
String uPw = request.getParameter("uPw");
String huPw = request.getParameter("huPw");
String uNic = request.getParameter("uNic");
String uTel = request.getParameter("uTel");
String uEmail = request.getParameter("uEmail");
String uName = request.getParameter("uName");

MembershipManagementVO mmVO= new MembershipManagementVO();
MembershipManagementDAO mmDAO=MembershipManagementDAO.getInstance();

DataEncrypt de=new DataEncrypt("a12345678901234567");

//암호화
mmVO.setUserId(userId);

if(huPw.equals(uPw)){//비밀번호가 바뀌었다면.
	uPw=DataEncrypt.messageDigest("MD5", huPw);
}
mmVO.setuPw(uPw);
mmVO.setuNic(uNic);
uTel=de.encryption(uTel);
mmVO.setuTel(uTel);
uEmail=de.encryption(uEmail);
mmVO.setuEmail(uEmail);
uName=de.encryption(uName);
mmVO.setuName(uName);

int cnt=0;
cnt=mmDAO.modifyInfo(mmVO);
JSONObject jsonObj = new JSONObject();

jsonObj.put("cnt", cnt);

out.print(jsonObj.toJSONString());


%>