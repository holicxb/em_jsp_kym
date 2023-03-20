<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String[] fruit = {"사과","배","오렌지","참외","복숭아"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
<% for(int i = 0;	i < fruit.length;	i++){%>
	<li><%= fruit[i] %></li>
<%} %>
</ul>
</body>
</html>