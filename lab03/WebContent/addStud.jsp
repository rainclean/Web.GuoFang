<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
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
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
	System.out.println(num + "','"+ name + "','"+sex + "','"+birth + "','"+address);
	String sql = "insert into Student(学号,姓名,性别,出生年月,住址) values('" + num + "','"+ name + "','"+sex + "','"+birth + "','"+address+"')";
	int n = statement.executeUpdate(sql);
	if(n == 1){
		out.print("添加成功！3 秒后将自动返回学生信息界面！"); 
	}else{
		out.print("添加失败！");
	}
	statement.close();
	conn.close();
	response.setHeader("refresh" , "3;url = students.jsp");
%>
</body>
</html>