<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>这是一个商品</h1>
<%
	String sname = request.getParameter("goodname");
	out.println(sname);
	//out.println(session.getAttribute("goodname"));

%>
</body>
</html>