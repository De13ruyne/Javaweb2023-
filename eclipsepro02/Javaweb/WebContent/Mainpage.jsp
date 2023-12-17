<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
<head>
    <title>商品列表</title>
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

<div class="container">
<%

String username = request.getParameter("username");
HttpSession session1 = request.getSession(false);
//String session_username = (String) session1.getAttribute("username");
if(session1 != null && session1.getAttribute("username") != null && username.equals((String) session1.getAttribute("username")) == true) {
%>

    <h2>商品列表</h2>
    <%
        String ss3 = "SearchGood.jsp?username=" + username + "&good_name=";
        out.println(username);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/db02";
            String Username = "root";
            String Password = "123456";
            Connection conn = DriverManager.getConnection(url, Username, Password);

            String sql = "select *from good_table;";
            Statement stmt = conn.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(sql);
            int boo = 0;
            while (rs.next()) {
                out.println("<div class='product'>");
                out.println("<br>");
                out.println("<strong>商品名:</strong> " + rs.getString("goodname") + "<br/>");
                out.println("<strong>商品数量:</strong> " + rs.getString("goodnum") + "<br/>");
                out.println("<strong>商品价值:</strong> " + rs.getString("goodvalue") + "<br/>");
                String ss4 = ss3 + rs.getString("goodname");
                %>
                <br>
                <button class="button" onclick="window.location.href='<%=ss4 %>'">查看商品</button>
                </div>
                <%
            }
            String ss1 = "SearchGood.jsp?username=" + username;
            String ss2 = "ViewCart.jsp?username=" + username;
        %>
    <form action="<%=ss1 %>" method="POST">
        <br>
        <br>
        <center>
            <ul>
                商品名: <input type="text" name="good_name"><br />
                <input type="submit" value="查找" />
            </ul>
        </center>
    </form>

    <button class="button" onclick="window.location.href='<%=ss2 %>';">查看购物车</button>
    
    <button class='button' onclick="window.location.href='history.jsp?username='+'<%=username%>';">查看历史订单</button>
    <button class='button' onclick="window.location.href='login.jsp';">注销用户</button>
    
    <%
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
