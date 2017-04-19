<%@ page language="java" import="java.sql.*"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改</title>
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
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
	
	String numm = request.getParameter("num1");
	String sql1 = "update Student set 学号="+num+",姓名='"+name+"',性别='"+sex+"',出生年月='"+birth+"',住址='"+address+"' where 学号="+numm+";";
	/* String sql2 = "update Student set 姓名='"+name+"' where 学号="+num;
	String sql3 = "update Student set 性别='"+sex+"' where 学号="+num;
	String sql4 = "update Student set 出生年月='"+birth+"' where 学号="+num;
	String sql5 = "update Student set 住址='"+address+"' where 学号="+num; */
	System.out.println(num);

	/* statement.execute(sql1);
	statement.execute(sql2);
	statement.execute(sql3);
	statement.execute(sql4);
	statement.execute(sql5); */
	int n = statement.executeUpdate(sql1);
	if(n == 1){
		out.print("修改成功！3 秒后将自动返回学生信息界面！"); 
	}else{
		out.print("修改失败！");
	}
	statement.close();
	conn.close();
	response.setHeader("refresh" , "3;url = students.jsp");
%>
</body>
</html>