<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<% 
	out.println("<center><h2>flag = <font color='red'>" + session.getAttribute("content"));
%>