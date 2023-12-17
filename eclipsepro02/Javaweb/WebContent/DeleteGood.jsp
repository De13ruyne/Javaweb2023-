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
	//String username = request.getParameter("username");
String goodname = request.getParameter("goodname");

String ss5 = "ViewCart.jsp?username=" + username;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); //显示声明将数据库驱动程序注册到jdbc的驱动管理器中
		String url = "jdbc:mysql://localhost:3306/db02"; //数据库名称为text（需要提前在MySQL里面建立text数据库）
		String Username = "root"; //数据库用户名
		String Password = "123456"; //数据库密码	
		Connection conn = DriverManager.getConnection(url, Username, Password); //连接数据库
		out.print("数据库连接成功！");
		String sql = "select *from buy_table;";
		Statement stmt = conn.createStatement();
		ResultSet rs = null;
		rs = stmt.executeQuery(sql);
		int boo = 0;
		while(rs.next()) {
			if(rs.getString("username").equals(username)&&rs.getString("goodname").equals(goodname)) {
				stmt = conn.createStatement();
				String sql5 = "delete from buy_table where username=" +"'"+ username + "'" + "and goodname=" + "'" + goodname + "'";
				boolean result5 = stmt.execute(sql5);
				
			}
		}

		 conn.close(); 
	} catch (Exception e) {
		out.print("数据库连接失败！");
		out.print("错误信息：" + e.toString());
	}

%>

<button class='button' onclick="window.location.href='<%=ss5 %>';">返回</button>


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