<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车清单</title>
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

        h1 {
            color: #333;
            text-align: center;
        }

        .cart-item {
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

        .checkout {
            text-align: center;
            margin-top: 20px;
        }

        input[type="button"] {
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>购物车清单</h1>
    <%
        String username = request.getParameter("username");
        String ss2 = "DeleteGood.jsp?username=" + username + "&goodname=";
        int allvalue = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/db02";
            String Username = "root";
            String Password = "123456";
            Connection conn = DriverManager.getConnection(url, Username, Password);

            String sql = "select * from buy_table;";
            Statement stmt = conn.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                if (rs.getString("username").equals(username)) {
                    stmt = conn.createStatement();
                    String goodName = rs.getString("goodname");
                    int buyNum = rs.getInt("buynum");

                    out.println("<div class='cart-item'>");
                    out.println("<strong>商品名:</strong> " + goodName + "<br/>");
                    out.println("<strong>购买数量:</strong> " + buyNum + "<br/>");

                    String sql2 = "Select goodvalue from good_table where goodname = '" + goodName + "'";
                    ResultSet rs2 = stmt.executeQuery(sql2);
                    rs2.next();
                    int value = rs2.getInt("goodvalue");
                    allvalue += value * buyNum;

                    out.println("<strong>商品价值:</strong> " + value + "<br/>");
                    String ss3 = ss2 + goodName;
                    %>

                    <button class='button' onclick="window.location.href='<%=ss3 %>';">移除当前商品</button>

                    <br><br>
                    </div>
                    <%
                }
            }

            if (allvalue > 0) {
                String ss1 = "Purchase.jsp?username=" + username + "&allvalue=" + Integer.toString(allvalue);
    %>

                <div class='checkout'>
                    <strong>合计：</strong> <%=allvalue %><br>
                    <input type='button' onclick="window.location.href='<%=ss1 %>';" value='结算购物车'>
                </div>

    <%
            }
            conn.close();
        } catch (Exception e) {
            out.print("数据库连接失败！");
            out.print("错误信息：" + e.toString());
        }
    %>
</div>

</body>
</html>
