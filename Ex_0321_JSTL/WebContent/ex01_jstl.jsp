<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL(JSP Standard Tag Library) : jsp에서 for, if와 같은 제어문을 사용 가능하게 해주는 라이브러리 -->

<!-- core : if, choose, forEach와 같은 제어문을 사용할 수 있도록 해주는 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- fmt : 숫자에 대한 출력포멧 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- prefix는 사용할 이름 지정 -->

<%
	Date today = new Date();
	int money = 10000000;
	request.setAttribute("today", today);
	request.setAttribute("money", money);
	
	List<String> sido = new ArrayList<>();
	sido.add("서울");
	sido.add("경기");
	sido.add("인천");
	sido.add("대구");
	sido.add("대전");
	sido.add("부산");
	sido.add("울산");
	
	request.setAttribute("list", sido);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		${ today }<br>
		${ money }<br>
		
		fmt를 통한 날짜 형식 변경 - <fmt:formatDate value="${ today }" 
							pattern="YYYY년MM월dd일"/><br>
							<!-- pattern은 월/일은 대소문자 구분함 -->
		fmt를 통한 숫자 형식 지정 - &#8361;<fmt:formatNumber value="${ money }"/>
		
		<hr>
		
		<!-- choose영역 내부에는 주석을 달 수 없다 -->
		<c:choose>
			<c:when test="${ param.msg eq 10 }">나는 10이다</c:when>
			<c:when test="${ param.msg eq 11 }">나는 11이다</c:when>
			<c:otherwise>모두 아니다</c:otherwise>
		</c:choose>
		
		<hr>
		
		<!-- var : 매 회전 때마다 변화되는 begin의 값을 갱신 변수
			 begin : 시작값
			 end : 끝값
			 step : 증가값 -->
		<c:forEach var="n" begin="1" end="5" step="1">
			<c:if test="${ n mod 2 eq 1 }"><!-- \${n % 2 == 1} -->
				안녕 ${ n }<br>
			</c:if>
			<c:if test="${ n mod 2 eq 0 }"><!-- \${n % 2 == 0} -->
				<font color=green>반가워 ${ n }</font><br>
			</c:if>
		</c:forEach>
		
		<hr>
		
		List에 담긴 내용 출력하기 1
		<!-- 배열 구조는 items를 통해 속성 정보를 가져온다 -->
		<ul>
			<c:forEach var="val" items="${ list }">
				<li>${ val }</li>
			</c:forEach>
		</ul>
		
		List에 담긴 내용 출력하기 1(인덱스 개념)<br>
		<c:forEach var="value" items="${ list }" varStatus="cnt">
			<!-- cnt.count : 순번 (1부터)
				 cnt.index : index번호(0부터) -->
			${ value } / ${ cnt.index } / ${ cnt.count } <br>
		</c:forEach>
		
	</body>
</html>