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
.login-container h5 {
      color: #FF00FF; 
      font-style: italic;
      font-weight: lighter;
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

<div class = "login-container">
<center>

<h2>注册</h2>
<form action="Register02.jsp" method="POST">


<input type="text" name="new_name" placeholder="New Username" required>
<br />
<input type="text" name="new_pw" placeholder="New Password" required/>
<br>
<input type="submit" value="Submit" />

</form>
</div>
</body>
</html>