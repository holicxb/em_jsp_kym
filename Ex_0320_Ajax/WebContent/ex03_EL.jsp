<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- EL표기법 : jsp에서 사용되는 표현식을 더 간결하게 사용할 수 있도록 해 주는 표현 형태
	 EL(Expression Language)
	  - EL로 값을 표현하려면 jsp의 관리하에 있는 4개의 영역에서만 사용을 할 수 있다
	 1) page 영역 : 단 하나의 페이지(현재 페이지)에서만 값을 저장하고 공유할 수 있다
	 2) request 영역(가장 많이 쓰임) : 지역개념으로 페이지가 닫히면 영역도 종료가 된다
	 	최대 두 개의 페이지에서 값을 저장하거나 공유할 수 있다.
	 3) session 영역 : 전역 개념으로 브라우저가 완전히 종료되기 전까지는 영역이 살아있다
	  	같은 웹브라우저 내에서 요청되는 페이지들에게 값을 공유
	 4) application 영역 : 한 프로젝트에서 요청되는 페이지들간 값의 공유 
	 
	 EL의 접근형식 : 달러표시{영역.변수} -->
	 
	 <%
	 	String msg = "안녕";
	 	//pageScope에 값을 저장
	 	pageContext.setAttribute("msg", "page영역입니다.");
	 
	 	//requestScope에 값을 저장
	 	request.setAttribute("msg", "request 영역입니다.");
	 	request.setAttribute("hi", "안녕하세요");
	 	
	 	//sessionScope에 값을 저장
	 	session.setAttribute("msg", "session 영역입니다.");
	 	
	 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	일반 jsp 표현식 : <%= msg %> <br>
	EL표현식(생략) : ${msg}<br>
	EL표현식(생략) : ${hi}<br>
	EL표현식(생략x) : ${requestScope.msg}<br>
	EL표현식(생략x) : ${sessionScope.msg}<br>
	<!-- 주소창 뒤에 ?age=30 넣으면 출력될 것 -->
	EL표현식(파라미터) : ${param.age}<br>
	
	<!-- 생략식을 사용했을 때 영역의 참조 순서
		 1. pageScope
		 2. requestScope
		 3. sessionScope
		 4. applicationScope -->
		 
	<hr>
	EL표기법의 연산자<br>
	\${ 1 + 1 }<br>
	\${ 2 + 2 } = ${ 2 + 2 }<br>
	${ 10 / 3 }<br>
	${ 10 % 3 }<br>
	
	<hr>
	
	비교연산자<br>
	\${ 3 > 2 } = ${ 3 > 2 } or ${ 3 gt 2 }<br>
	\${ 3 < 2 } = ${ 3 < 2 } or ${ 3 lt 2 }<br>
	\${ 3 >= 2 } = ${ 3 >= 2 } or ${ 3 ge 2 }<br>
	\${ 3 <= 2 } = ${ 3 <= 2 } or ${ 3 le 2 }<br>
	\${ 3 == 2 } = ${ 3 == 2 } or ${ 3 eq 2 }<br>
	\${ 3 != 2 } = ${ 3 != 2 } or ${ 3 ne 2 }<br>
	
	<hr>
	
	<!-- ?age=30&msg=100 -->
	삼항연산자<br>
	파라미터 값 : ${ param.msg == null ? '값 없음' : param.msg }<br>
	파라미터 값 : ${ empty param.msg ? '값 없음' : param.msg }<br>
	
	<hr>
	
	논리연산자<br>
	\${ 10 gt 3 && 5 eq 5 } = ${ 10 gt 3 && 5 eq 5 }<br>
	\${ 10 gt 3 and 5 eq 5 } = ${ 10 gt 3 and 5 eq 5 }<br>
</body>
</html>