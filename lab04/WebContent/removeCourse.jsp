<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除课程</title>
<link href="css/mycss.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:useBean id="courseDb" class="cn.simo.DBHelper"/> 
<%
	String num = request.getParameter("num");
	String sql = "delete from course where 课程编号='" + num + "'";
	Connection conn = courseDb.getConnection();
	int flag = courseDb.ExecSql(sql);
	if(flag > 0)
	{
		out.println("删除成功！3秒后返回...");
	}
	else
	{
		out.println("删除成功！3秒后返回...");
	}
	conn.close();
	response.setHeader("refresh", "3;url=showAllCourse.jsp");
%>
</body>
</html>