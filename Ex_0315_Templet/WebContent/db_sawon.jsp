<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	//SawonDAO dao = SawonDAO.getInstance();
	//List<SawonVO> sawon_list = dao.selectList();
	List<SawonVO> sawon_list = SawonDAO.getInstance().selectList();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<caption>사원목록</caption>
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>부서번호</th>
				<th>직책</th>
				<th>입사일</th>
			</tr>
			<% for(SawonVO vo : sawon_list){%>
			<tr>
				<th><%= vo.getSabun() %></th>
				<th><%= vo.getSaname() %></th>
				<th><%= vo.getDeptno() %></th>
				<th><%= vo.getSajob() %></th>
				<th><%= vo.getSahire() %></th>
			</tr>
			<%} %>
		</table>
	</body>
</html>