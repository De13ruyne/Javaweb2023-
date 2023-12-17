<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


HttpSession session2 = request.getSession(true);

session2.invalidate();

// 获取会话对象，如果不存在则创建新的会话

HttpSession session1 = request.getSession(true);

//session1.setAttribute("username", "");


%>



	<form action="Result.jsp" method="POST">
		<h2>登录:</h2>
		<center>
		<ul>	
		<input type="text" name="_name" placeholder="Username" required>
		<br />
		<input type="text" name="_pw" placeholder="Password" required />
		<br>
		<input type="submit" value="登录" />
		
	</form>
	<br><br>
	<input type="button" onclick="window.location.href='Register.jsp';" value="注册账号">
</div>
</body>
</html>