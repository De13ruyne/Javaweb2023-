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
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
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

<div class = "container">

<%

String username = request.getParameter("username");
HttpSession session1 = request.getSession(false);
//String session_username = (String) session1.getAttribute("username");
if(session1 != null && session1.getAttribute("username") != null && username.equals((String) session1.getAttribute("username")) == true) {
%>








<h1>本次消费信息</h1>

<%

	//String username = request.getParameter("username");
	String allvalue = request.getParameter("allvalue");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); //显示声明将数据库驱动程序注册到jdbc的驱动管理器中
		String url = "jdbc:mysql://localhost:3306/db02"; //数据库名称为text（需要提前在MySQL里面建立text数据库）
		String Username = "root"; //数据库用户名
		String Password = "123456"; //数据库密码	
		Connection conn = DriverManager.getConnection(url, Username, Password); //连接数据库
		//out.print("数据库连接成功！");
		/* conn.close(); */
		String sql = "select *from buy_table;";
		Statement stmt = conn.createStatement();
		ResultSet rs = null;
		rs = stmt.executeQuery(sql);
		int boo = 0;
		while(rs.next()) {
			if(rs.getString("username").equals(username)) {
				String goodname = rs.getString("goodname");
				int num = rs.getInt("buynum");
			  	stmt = conn.createStatement();
			  	String sql3 = "select goodnum from good_table where goodname="+"'"+goodname+"'";
			  	ResultSet rs3 = null;
				rs3 = stmt.executeQuery(sql3);
				rs3.next();
				int goodnum = rs3.getInt("goodnum");
			  	stmt = conn.createStatement();
			  	String sql2= "UPDATE good_table SET goodnum="+Integer.toString(goodnum - num)+" WHERE goodname = '"+goodname + "'" ;
			  	int result = stmt.executeUpdate(sql2);
				boo = 1;
				
				stmt = conn.createStatement();
			  	String sql4 = "insert into buy_table03 (username, goodname, buynum) values ('"+ username + "','" + goodname + "','" +Integer.toString(num) + "');";
			  	
			  	int result4 = stmt.executeUpdate(sql4);
			

				stmt = conn.createStatement();
				String sql5 = "delete from buy_table where username=" +"'"+ username + "'" + "and goodname=" + "'" + goodname + "'";
				boolean result5 = stmt.execute(sql5);
				
				out.println("<div class='product'>");
                out.println("<br>");
                out.println("<strong>商品名:</strong> " + goodname);
                out.println("<strong>商品数量:</strong> " + Integer.toString(num) + "<br/>");
                
                %>
                <br>
                
                </div>
                
                
				<%
				
				
				
				
				
			}
		}
		

        out.println("<strong>商品价值:</strong> " + allvalue + "<br/>");
		
		
		if(boo == 0) {
			//Statement stmt2 = conn.createStatement();

		}
	
		 conn.close(); 
	} catch (Exception e) {
		out.print("数据库连接失败！");
		out.print("错误信息：" + e.toString());
	}





%>
<center>
<button class='button' onclick="window.location.href='Mainpage.jsp?username=' + '<%=username%>';">返回</button>


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