<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	//t_param.jsp?name=홍길동&age=30&tel=01011112222
	
	//post방식으로 파라미터가 전달 되었을 떄, 값에 한글이 섞여 있다면 꺠져서 표기한다
	//이를 해결하기 위해 request를 통해 메서드를 정의해 줘야한다
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	int age = Integer.parseInt(request.getParameter("age"));
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<tr>
				<td>이름</td>
				<td><%= name %></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><%= age %></td>
			</tr>
			<tr>
				<td>전화</td>
				<td><%= tel %></td>
			</tr>
		</table>
	</body>
</html>