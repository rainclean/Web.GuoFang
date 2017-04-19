<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生管理系统</title>
</head>
<body>
<center>
	<h1>学生信息</h1>
</center>
<table border = "1" align = "center" method="post">
<tr>
	<th>学号</th>
	<th>姓名</th>
	<th>性别</th>
	<th>出生年月</th>
	<th>住址</th>
	<th>操作</th>
</tr>
<%
String driver = "com.mysql.jdbc.Driver";
//URL指向要访问的数据库名test1
String url = "jdbc:mysql://127.0.0.1:3306/studentmanagement";
//MySQL配置时的用户名
String user = "root";
//Java连接MySQL配置时的密码
String password = "root";
try {
	//1 加载驱动程序
	Class.forName(driver);
	//2 连接数据库
	Connection conn = DriverManager.getConnection(url, user, password);
	//3 用来执行SQL语句
	Statement statement = conn.createStatement();
	//要执行的SQL语句
	String sql = "select * from Student";
	ResultSet rs = statement.executeQuery(sql);
	String num,name,sex,birth,address;
	while (rs.next()) { 
	num = rs.getString("学号"); 
	name = rs.getString("姓名");
	sex = rs.getString("性别");
	birth = rs.getString("出生年月");
	address = rs.getString("住址");
	out.println("<tr><td>"+num+"</td><td>"+name+"</td><td>"+sex+"</td><td>"+birth+"</td><td>"+address+"</td><td>"+"<a href=changeInput.jsp?num="+num+">修改</a>/<a href=dlt.jsp?num="+num+">删除</a>"+"</td><tr>"); 
	} 
	rs.close();
	conn.close();
	} catch (ClassNotFoundException e) {
	System.out.println("Sorry,can`t find the Driver!");
	e.printStackTrace();
	} catch (SQLException e) {
	e.printStackTrace();
	} catch (Exception e) {
	e.printStackTrace();
	}
%>
</table>
<center> 
	<a href=addInput.html>添加</a>
</center>
</body>
</html>