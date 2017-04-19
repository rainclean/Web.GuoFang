<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改课程</title>
<link href="css/mycss.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function isValiDate(form)
	{
		if(form.num.value == '' || form.courseName.value == '' || form.credit.value == '')
		{
			alert('内容不能为空！');
			return false;
		}
		else
		{
			return true;
		}
	}
</script>
</head>
<body>
<jsp:useBean id="courseDb" class="cn.simo.DBHelper"/> 
<% 
	String num = request.getParameter("num");
	String courseName = "", credit = "";
	Connection conn = courseDb.getConnection();
	Statement stmt = courseDb.getStatement();
	String sql = "select * from course where 课程编号='" + num + "'";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next())
	{
		courseName = rs.getString("课程名");
		credit = rs.getString("学分");
	}
	conn.close();
	rs.close();
%>
<h1>修改课程</h1>
<form id="form1" action="updateSuccess.jsp" onsubmit='return isValiDate(form1)'>
<table border='1' cellpadding='10' cellspacing='3'>
<tr><th>课程编号：</th><td><input name="num" type="text" value="<%=num %>"></td></tr>
<tr><th>课程名称：</th><td><input name="courseName" type="text" value="<%=courseName %>"></td></tr>
<tr><th>课程学分：</th><td><input name="credit" type="text" value="<%=credit %>"></td></tr>
<tr><td><a href="showAllCourse.jsp"><input type="button" value="取消"></a></td><td><input type="submit" value="确认"></td></tr>
</table>
<input name="oldNum" type="hidden" value="<%=num %>">
</form>
</body>
</html>