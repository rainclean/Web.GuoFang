<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改结果</title>
<link href="css/mycss.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:useBean id="courseDb" class="cn.simo.DBHelper"/> 
<%
	request.setCharacterEncoding("UTF-8");
	String oldNum = request.getParameter("oldNum");
	String num = request.getParameter("num");
	String courseName = request.getParameter("courseName");
	String credit = request.getParameter("credit");
	Connection conn = courseDb.getConnection();
	String sql = "update course set 课程编号='" + num + "',课程名='" + courseName + "',学分='" + credit + "' where 课程编号='" + oldNum + "'";
	int flag = courseDb.ExecSql(sql);
	if(flag > 0)
	{
		out.println("更改成功！3秒后跳转...");
	}
	else
	{
		out.println("更改失败！3秒后跳转...");
	}
	conn.close();
	response.setHeader("refresh" , "3;url = showAllCourse.jsp");
%>
</body>
</html>