<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title> 
</head> 
<body> 
<% 
//判断application对象中有没有保存名为jsj的参数 
//如果没有，在application对象中新增一个名为jsj的参数 
if(application.getAttribute("jsj")==null){ 
application.setAttribute("jsj", new Integer(0)); 
} 
Integer jsj = (Integer)application.getAttribute("jsj"); 
//使用application对象读取jsj参数的值，再在原值基础上累加1 
application.setAttribute("jsj",new Integer(jsj.intValue()+1)); 
%> 
<h2> 
<!-- 输出累加后的jsj参数对应的值 --> 
欢迎您访问，<% out.println(URLDecoder.decode(request.getParameter("username"), "UTF-8")); %>已经登录过 <font color="#ff0000"><%=application.getAttribute("jsj") %></font>次。。。。 
</h2> 
<h2>
<a href="login.html">退出</a>
</h2>
</body> 
</html> 