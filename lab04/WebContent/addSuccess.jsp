<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程添加结果</title>
<link href="css/mycss.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:useBean id="courseDb" class="cn.simo.DBHelper"/>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String courseName = request.getParameter("courseName");
	String credit = request.getParameter("credit");
	
	Connection conn = courseDb.getConnection();
	String sql = "insert into course values('" + num + "','" + courseName + "'," + credit + ");";
	int n = courseDb.ExecSql(sql);
	conn.close();
	if(n > 0)
	{
		out.println("添加成功！3秒后跳转。。。");
	}
	else
	{
		out.println("添加失败！3秒后跳转。。。");
	}
	response.setHeader("refresh" , "3;url = showAllCourse.jsp");
%>
</body>
</html>