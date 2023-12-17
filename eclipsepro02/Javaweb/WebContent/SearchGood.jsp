<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
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
        input[type="button"] {
              width: 100%;
		      padding: 10px;
		      background-color: #4caf50;
		      color: #fff;
		      border: none;
		      border-radius: 4px;
		      cursor: pointer;
		      font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>


</head>
<body>
<div class = "container">

<%

String username = request.getParameter("username");
HttpSession session1 = request.getSession(false);
//String session_username = (String) session1.getAttribute("username");
if(session1 != null && session1.getAttribute("username") != null && username.equals((String) session1.getAttribute("username")) == true) {
%>

<%
	String sname = request.getParameter("good_name");
	out.print(sname);
	//String username = request.getParameter("username");
	out.print(username);
	String ss5 = "Mainpage.jsp?username=" + username;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); //显示声明将数据库驱动程序注册到jdbc的驱动管理器中
		String url = "jdbc:mysql://localhost:3306/db02"; //数据库名称为text（需要提前在MySQL里面建立text数据库）
		String Username = "root"; //数据库用户名
		String Password = "123456"; //数据库密码	
		Connection conn = DriverManager.getConnection(url, Username, Password); //连接数据库
		//out.print("数据库连接成功！");
		String sql = "select *from good_table;";
		Statement stmt = conn.createStatement();
		ResultSet rs = null;
		rs = stmt.executeQuery(sql);
		int boo = 0;
		%>
		<br>
		<%
		while(rs.next()) {
			if(rs.getString("goodname").equals(sname)) {
				//out.println("有这个商品");
				/* out.println(rs.getString("goodname"));
				out.println(rs.getString("goodnum"));
				out.println(rs.getString("goodvalue")); */
				out.println("<strong>商品名:</strong> " + rs.getString("goodname") + "<br/>");
                out.println("<strong>商品数量:</strong> " + rs.getString("goodnum") + "<br/>");
                out.println("<strong>商品价值:</strong> " + rs.getString("goodvalue") + "<br/>");
				boo = 1;
				String ss1 ="AddIntoShoppingCart.jsp?goodname=" + rs.getString("goodname") + "&username=" + username;
				//ss1 = "http://localhost:8080/Javaweb/AddIntoShoppingCart.jsp";
				%>
				
				

		<button class='button' onclick="window.location.href='<%=ss1 %>';">添加至购物车</button>
		
				<br><br>
				<button class='button' onclick="window.location.href='<%=ss5%>';">返回</button>
				
		
				
				<%
				
				
				
				
				
			}
		}
		
		if(boo == 0) {
			out.println("not fount");
			
			%>
			<button class='button' onclick="window.location.href='<%=ss5%>';">返回</button>
			<%
			
		}
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