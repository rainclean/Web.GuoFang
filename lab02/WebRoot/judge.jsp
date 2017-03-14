<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%
	String user = request.getParameter("username");
	String pwd = request.getParameter("password");
	
	if(user.equals("jsj") && pwd.equals("123")) {
		out.println("登录成功！5s后跳转到success.jsp...");
		String index = "success.jsp?username=" + URLEncoder.encode(user, "UTF-8");       // 地址传参法
		response.addHeader("refresh", "5;URL="+index);           // 定时刷新
		return;
	} else {
		response.sendRedirect("fail.html");                           // 直接重定向到fail.html
        return;        
	}
%>