<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-container {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      width: 300px;
      text-align: center;
      padding: 20px;
    }

    .login-container h2 {
      color: #333;
    }

    .login-container input[type = "text"] {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .login-container input[type = "submit"]{
      width: 100%;
      padding: 10px;
      background-color: #4caf50;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }

	.login-container input[type = "button"]{
      width: 100%;
      padding: 10px;
      background-color: #4caf50;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }


    .login-container button:hover {
      background-color: #45a049;
    }
  </style>


</head>
<body>
<div class = "login-container">

 <%
 	String s1 = request.getParameter("new_name");
 	String s2 = request.getParameter("new_pw");
 	//out.println(s1);
 	//out.println(s2);
 
 	Class.forName("com.mysql.cj.jdbc.Driver"); //显示声明将数据库驱动程序注册到jdbc的驱动管理器中
	String url = "jdbc:mysql://localhost:3306/db02"; //数据库名称为text（需要提前在MySQL里面建立text数据库）
	String Username = "root"; //数据库用户名
	String Password = "123456"; //数据库密码	
	Connection conn = DriverManager.getConnection(url, Username, Password); //连接数据库
	out.print("数据库连接成功！");
	
	
	
/* 	String sql1 = "select *from user_table;";
	Statement stmt = conn.createStatement();
	ResultSet rs = null;
	re = stmt.executeUse("use db02;"); 
	rs = stmt.executeQuery(sql1);
	int boo = 0;
	while(rs.next()) {
		if(rs.getString("username").equals(s1)) {
			out.println("该用户名已被使用");
			request.getRequestDispatcher("Regiter.jsp").forward(request, response);
		}
	} */
	
	
	String sql = "select * from user_table;";
    Statement stmt2 = conn.createStatement();
    ResultSet rs2 = null;
    rs2 = stmt2.executeQuery(sql);
    
    boolean boo = true;

    while (rs2.next()) {
        if (rs2.getString("username").equals(s1)) {
        	out.print("该用户已经存在");
            boo = false;
            %>
			
            
		<input type='button' onclick="window.location.href='login.jsp';" value='登录'>
		<br><br>
		<input type='button' onclick="window.location.href='Register.jsp';" value='注册'>
            </div>
            <%
        }
    }
	
	
	
	
	
	
	
	if(boo == true)
	
    {
		Statement stmt = conn.createStatement();
	  	stmt = conn.createStatement();
	  	String sql2 = "insert into user_table (username, userpw) values ('"+ s1 + "','" + s2 + "');";
	  	//sql = "insert into usertable(username, userpw) values ('user01', '01')";
	  	int result = stmt.executeUpdate(sql2);
		if(result != 0) {
			out.println("注册成功");
			
		}
		
		%>
		<input type='button' onclick="window.location.href='login.jsp';" value='登录'>
		<%
    }
  	
 %>


</div>
</body>
</html>