<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程信息</title>
<link href="css/mycss.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<jsp:useBean id="courseDb" class="cn.simo.DBHelper" />
	
	<h1>课程信息</h1>
	<div id="showInfo">
	<table border="1" cellspacing="3" cellpadding="10">
	<tr><th>课程编号</th><th>课程名称</th><th>学分</th><th>可用操作</th></tr>
	<%
		Connection conn = courseDb.getConnection();
		String sql = "select * from course order by 课程编号";
		Statement stmt = courseDb.getStatement();
		ResultSet rs = stmt.executeQuery(sql);
		String id, courseName, credit;
		
		while(rs.next())
		{
			id = rs.getString("课程编号");
			courseName = rs.getString("课程名");
			credit = rs.getString("学分");
			out.println("<tr><td>" + id + "</td><td>" + courseName + "</td><td>" + credit + "</td><td><a href=updateCourse.jsp?num=" + id + ">修改</a>&nbsp;<a href=removeCourse.jsp?num=" + id + ">删除</a></td></tr>");
		}
		
		rs.close();
		conn.close();
	%>
	</table>
	</div>
	<div id="button"><a href=addCourse.jsp><button>添加课程</button></a></div>
</body>
</html>