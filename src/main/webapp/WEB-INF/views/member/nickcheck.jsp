<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ootd.weatherlook.dao.*"%>
<%
request.setCharacterEncoding("utf-8");

String nick = request.getParameter("memnick");
String pass = request.getParameter("mempass");
System.out.println("id=" + nick);
System.out.println("pass=" + pass);

NormalLogDao dao = new NormalLogDao();

int re = dao.nickcheck(nick);
//1이면 중복 -1이면 사용가능 아이디

out.println(re);
%>