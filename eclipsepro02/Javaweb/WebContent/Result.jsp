	<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverAction"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"  %>
<%@ page import="javax.servlet.http.HttpSession" %>



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
	<div class="login-container">
	
	<%	
	boolean loginboo = false;
	boolean isAdmin = false;
	
	String s1 = request.getParameter("_name");
	String s2 = request.getParameter("_pw");
	out.println(s1);
	
	if (s1.equals("root") && s2.equals("123456")) {
		isAdmin = true;
	}
	
	if(isAdmin == true) {
	
    // 获取会话对象，如果不存在则创建新的会话
    HttpSession session1 = request.getSession(true);
   
    // 存储数据到会话中
    session1.setAttribute("username", "root");
    

%>
	
		<h2>登录成功</h2>				
		<input type="button" onclick="window.location.href='AdminWindow.jsp';" value="进入管理员系统">
	<%
	}
	
	
	
	
	else if(isAdmin == false){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); //显示声明将数据库驱动程序注册到jdbc的驱动管理器中
			String url = "jdbc:mysql://localhost:3306/db02"; //数据库名称为text（需要提前在MySQL里面建立text数据库）
			String Username = "root"; //数据库用户名
			String Password = "123456"; //数据库密码	
			Connection conn = DriverManager.getConnection(url, Username, Password); //连接数据库
			out.print("数据库连接成功！");
			/* conn.close(); */
			String sql = "select *from user_table;";
			Statement stmt = conn.createStatement();
			ResultSet rs = null;/* 
			re = stmt.executeUse("use db02;"); */
			rs = stmt.executeQuery(sql);
			int boo = 0;
			while(rs.next()) {
				if(rs.getString("username").equals(s1)) {
					if(rs.getString("userpw").equals(s2)) {
						//out.println("登录成功");
						loginboo = true;
						%>
						
						<h2>登录成功</h2>
						
						<%
						boo = 1;
					}
					else {
						//out.println("密码错误");
						%>
						
						<h2>密码错误</h2>
						
						<%
					}
				}
			}
			if(boo == 0) {
				//out.println("登录失败 账号不存在");
				
				%>
				
				<h2>登录失败</h2>
				
				<%
				
			}
	
			 conn.close(); 
		} catch (Exception e) {
			out.print("数据库连接失败！");
			out.print("错误信息：" + e.toString());
		}
		out.println(s1);
		
	    // 获取会话对象，如果不存在则创建新的会话
	    HttpSession session1 = request.getSession(true);
	   
	    // 存储数据到会话中
	    session1.setAttribute("username", s1);
	    
		
		
		
		String ss1 = "Mainpage.jsp?username=" + s1;
		//String ss1 = "Mainpage.jsp";
		
		%>
		
		
		<% if (loginboo == true) { %>
	  <input type="button" onclick="window.location.href='<%= ss1 %>';" value="进入购物系统">
		<% } else { 
			session1.invalidate();
		%>
	  <input type="button" onclick="window.location.href='login.jsp';" value="返回">
		<% }
		
		
		}%>
		
		
	
	
	</div>
	
	
	
	
	
</body>
</html>