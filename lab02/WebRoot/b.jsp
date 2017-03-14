<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<% 
	String content = request.getParameter("content");     // 获取参数
	out.println("<center><h2>去<a href=c.jsp>c.jsp</a>显示flag的值。");
	
	session.setAttribute("content", content);
%>