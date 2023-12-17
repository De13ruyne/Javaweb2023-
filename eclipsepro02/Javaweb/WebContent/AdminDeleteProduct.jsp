<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
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

HttpSession session1 = request.getSession(false);
//String session_username = (String) session1.getAttribute("username");
if(session1 != null && session1.getAttribute("username") != null && "root".equals((String) session1.getAttribute("username")) == true) {
%>




	<%
		String goodname = request.getParameter("goodname");
		String goodnum = request.getParameter("goodnum");
		String goodvalue = request.getParameter("goodvalue");
		
		
		
		
		
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); //显示声明将数据库驱动程序注册到jdbc的驱动管理器中
			String url = "jdbc:mysql://localhost:3306/db02"; //数据库名称为text（需要提前在MySQL里面建立text数据库）
			String Username = "root"; //数据库用户名
			String Password = "123456"; //数据库密码	
			Connection conn = DriverManager.getConnection(url, Username, Password); //连接数据库
			out.print("数据库连接成功！");
			/* conn.close(); */
			String sql = "select *from good_table;";
			Statement stmt = conn.createStatement();
			//ResultSet rs = null;
			//rs = stmt.executeQuery(sql);
		
				
			%>
			
			<h2>修改商品</h2>
			<h2>修改成功</h2>
			
			
			
			<%
			//DELETE FROM good_table WHERE goodname = 
			String sql2 = "DELETE FROM good_table WHERE goodname = '" + goodname + "' ;";
			//String sql3 = "UPDATE good_table SET goodnum =  555 , goodvalue = 88 WHERE goodname = 'apple01' ;";
			//stmt.executeUpdate("sql3");
			//stmt.execute("sql3");
			out.print(sql2);
			PreparedStatement preparedStatement = conn.prepareStatement(sql2);
			int rowsAffected = preparedStatement.executeUpdate();
			
			preparedStatement.close();
			conn.close(); 
		} 
		catch (Exception e) {
			out.print("数据库连接失败！");
			out.print("错误信息：" + e.toString());
		}
		
		
		
		
		
	
	
	%>
	
	
	
	
	
	<br><br>
	<input type="button" onclick="window.location.href='AdminWindow.jsp';" value="返回">z
	
	
	<%
}

else {
	%>
	 <p>Error: Invalid username</p>
	<button class='button' onclick="window.location.href='login.jsp';">注销用户</button>
    
	<%
}


%>
	
	
	
</div>


</body>
</html>