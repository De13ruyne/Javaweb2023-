<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
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
.container h2 {
      color: #333;
    }
        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
        }

        .product {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .button {
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #45a049;
        }

        form {
            margin-top: 20px;
            text-align: center;
        }

        input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>





</head>
<body>


<div class = "container">


<%

HttpSession session1 = request.getSession(false);
//String session_username = (String) session1.getAttribute("username");
if(session1 != null && session1.getAttribute("username") != null && "root".equals((String) session1.getAttribute("username")) == true) {
%>



<%

	String goodname = request.getParameter("goodname");
	String goodvalue = request.getParameter("goodvalue");
	String goodnum = request.getParameter("goodnum");
	
	%>
	<form action="AdminAddGood02.jsp"  method="POST">
	<h2>添加商品</h2>
	<center>
	<ul>	
	<input type="text" name="new_goodname" placeholder="goodname" required>
	<br />
	<input type="text" name="new_goodnum" placeholder="goodnum" required />
	<br>
	<input type="text" name="new_goodvalue" placeholder="goodvalue" required>
	<br>
	<input type="submit" value="添加" />
	
</form>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); //显示声明将数据库驱动程序注册到jdbc的驱动管理器中
		String url = "jdbc:mysql://localhost:3306/db02"; //数据库名称为text（需要提前在MySQL里面建立text数据库）
		String Username = "root"; //数据库用户名
		String Password = "123456"; //数据库密码	
		Connection conn = DriverManager.getConnection(url, Username, Password); //连接数据库
		//out.print("数据库连接成功！");
		/* conn.close(); */
		String sql = "select *from good_table;";
		Statement stmt = conn.createStatement();
		ResultSet rs = null;/* 
		re = stmt.executeUse("use db02;"); */
		rs = stmt.executeQuery(sql);
		int boo = 0;
		while(rs.next()) {
			if(rs.getString("goodname").equals(goodname)) {
				boo = 1;
			}
		}
		if(boo == 0) {//不存在同名商品
			
			%>
			
			<h2>添加商品</h2>
			
			
			
			
			<%
			
		}
		
		else {
			%>
			<h2>商品已存在</h2>
			
			<%
		}
	
		 conn.close(); 
	} catch (Exception e) {
		out.print("数据库连接失败！");
		out.print("错误信息：" + e.toString());
	}









%>




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