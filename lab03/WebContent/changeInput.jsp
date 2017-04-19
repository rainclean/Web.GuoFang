<%@ page language="java" import="java.sql.*"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改信息</title>
</head>
<body>
<%
String driver = "com.mysql.jdbc.Driver";
//URL指向要访问的数据库名studentmanagement
String url = "jdbc:mysql://127.0.0.1:3306/studentmanagement";
//MySQL配置时的用户名
String user = "root";
//Java连接MySQL配置时的密码
String password = "root";

	//1 加载驱动程序
	Class.forName(driver);
	//2 连接数据库
	Connection conn = DriverManager.getConnection(url, user, password);
	//3 用来执行SQL语句
	Statement statement = conn.createStatement();
	//要执行的SQL语句
	request.setCharacterEncoding("utf-8");
    String num = request.getParameter("num");
	System.out.println(num);
	String sql = "select * from student where 学号="+num;
	
	ResultSet rs = statement.executeQuery(sql);
	String num1="",name="",sex="",birth="",address="";
	while (rs.next()) { 
	num1 = rs.getString("学号"); 
	name = rs.getString("姓名");
	sex = rs.getString("性别");
	birth = rs.getString("出生年月");
	address = rs.getString("住址"); 
	//out.println("<tr><td>"+num1+"</td><td>"+name+"</td><td>"+sex+"</td><td>"+birth+"</td><td>"+address+"</td><td>"); 
	} 
	rs.close();
	conn.close();
	
%>
<center>
<h1>修改信息</h1>
</center>

		<form action="change.jsp" method="post">
		<table align = "center">
		    <tr><td>学号：</td><td><input type="text" name="num" value="<%= num1%>"></td></tr>
			<tr><td>姓名：</td><td><input type="text" name="name" value="<%= name%>"></td></tr>
			<tr><td>性别：</td><td><input type="text" name="sex" value="<%= sex%>"></td></tr>
			<tr><td>出生年月：</td><td><input type="text" name="birth" value="<%= birth%>"></td></tr>
			<tr><td>住址：</td><td><input type="text" name="address" value="<%= address%>"></td></tr>
			<tr align = "center" ><td><a href="students.jsp"><input type="button" value="取消"></a></td><td ><input type="submit" value="提交"></td></tr>
		</table>
		
		<input type="hidden" name="num1" value="<%out.print(num1); %>"> 
		
		
		</form>




</body>
</html>