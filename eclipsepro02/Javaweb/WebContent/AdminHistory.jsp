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
            padding: 20px;
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
.container h2 {
      color: #333;
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
<div class="login-container">

<%

HttpSession session1 = request.getSession(false);
//String session_username = (String) session1.getAttribute("username");
if(session1 != null && session1.getAttribute("username") != null && "root".equals((String) session1.getAttribute("username")) == true) {
%>


<h2>用户订单</h2>

	<%
		//String goodname = request.getParameter("goodname");
		String new_goodname = request.getParameter("new_goodname");
		String new_goodnum = request.getParameter("new_goodnum");
		String new_goodvalue = request.getParameter("new_goodvalue");
		
		
		
		
		
		
		
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/db02";
            String Username = "root";
            String Password = "123456";
            Connection conn = DriverManager.getConnection(url, Username, Password);

            String sql = "select *from buy_table03;";
            Statement stmt = conn.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(sql);
            int boo = 0;
            
            while (rs.next()) {
	                out.println("<div class='product'>");
	                out.println("<br>");

	                out.println("<strong>用户名:</strong> " + rs.getString("username") + "<br/>");
	                
	                out.println("<strong>商品名:</strong> " + rs.getString("goodname") + "<br/>");
	                out.println("<strong>商品数量:</strong> " + rs.getString("buynum") + "<br/>");
	                out.println("<strong>购买时间:</strong> " + rs.getString("my_timestamp") + "<br/>");
	                //out.println("<strong>商品价值:</strong> " + rs.getString("goodvalue") + "<br/>");
	                
	                %>
	                <br></div>
	                <%
            }
        %>

    
    <%
        conn.close();
    } catch (Exception e) {
        out.print("数据库连接失败！");
        out.print("错误信息：" + e.toString());
    }
    %>
		
		
	
	
	
	<br><br>
	<button class='button' onclick="window.location.href='AdminWindow.jsp';">返回</button>
    
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