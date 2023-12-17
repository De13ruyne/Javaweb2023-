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
	
	
	%>
	<form action="AdminEditProduct02.jsp?goodname=" + "<%=goodname %>" method="POST">
		<h2>修改</h2>
		<center>
		<ul>	
		<input type="text" name="new_goodname" value = "<%=goodname%>">
		<br />
		<input type="text" name="new_goodnum" value = "<%=goodnum%>" />
		<br>
		<input type="text" name="new_goodvalue" value = "<%=goodvalue%>">
		<br>
		<input type="submit" value="修改" />
		
	</form>
	<br><br>
	<input type="button" onclick="window.location.href='AdminWindow.jsp';" value="返回">
	
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