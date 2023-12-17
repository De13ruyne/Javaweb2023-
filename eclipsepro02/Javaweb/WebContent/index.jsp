	<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverAction"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content:"text/html" charset="UTF-8">
<title>MySQL</title>
</head>
<body>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); //显示声明将数据库驱动程序注册到jdbc的驱动管理器中
		String url = "jdbc:mysql://localhost:3306"; //数据库名称为text（需要提前在MySQL里面建立text数据库）
		String username = "root"; //数据库用户名
		String password = "123456"; //数据库密码	
		Connection conn = DriverManager.getConnection(url, username, password); //连接数据库
		out.print("数据库连接成功！");
		conn.close();
	} catch (Exception e) {
		out.print("数据库连接失败！");
		out.print("错误信息：" + e.toString());
	}
	%>
 
</body>
</html>