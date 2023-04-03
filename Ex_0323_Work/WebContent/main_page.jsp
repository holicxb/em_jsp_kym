<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<jsp:include page="check_login.jsp"/>
		
		${ user.name }님 환영합니다<br>
		<input type="button" value="로그아웃" onClick="location.href='logout.do'">
		
		<input type="button" value="회원 탈퇴" onClick="">
		
	</body>
</html>