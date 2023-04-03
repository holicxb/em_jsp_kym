<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- check_login.jsp가 body에서 호출하도록 붙여줌 -->
		<jsp:include page="check_login.jsp"/>
		
		${ user.name }님 환영합니다<br>
		<input type="button" value="로그아웃" onClick="location.href='logout.do'">
		
	</body>
</html>