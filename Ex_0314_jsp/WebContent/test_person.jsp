<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Model1 구조 : 하나의 jsp파일에서 자바의 연산코드와 html의 디자인 코드를 모두 작성하는 형태 -->
<%
	PersonVO p1 = new PersonVO();
	p1.setName("홍길1");
	p1.setAge(20);
	p1.setTel("010-111-1111");

	PersonVO p2 = new PersonVO();
	p2.setName("홍길2");
	p2.setAge(23);
	p2.setTel("010-222-2222");

	PersonVO p3 = new PersonVO();
	p3.setName("홍길3");
	p3.setAge(30);
	p3.setTel("010-333-2222");
	
	//준비해둔 vo객체들을 ArrayList에 탑재
	List<PersonVO> pList = new ArrayList<>();
	pList.add(p1);
	pList.add(p2);
	pList.add(p3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<caption>개인정보 목록</caption>
		<tr>
			<td>이름</td>
			<td>나이</td>
			<td>전화번호</td>
		</tr>
		<% for(int i = 0;	i < pList.size();	i++){ %>
			<tr>
				<td><%= pList.get(i).getName()%></td>
				<td><%= pList.get(i).getAge()%></td>
				<td><%= pList.get(i).getTel()%></td>
			</tr>
		<%} %>
	</table>
</body>
</html>