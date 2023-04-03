<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function del(f){
				
				f.action = "gogek_del.do?idx="+f.idx.value;
				f.submit();
				
			}
			
			function search() {
				let addr_search = document.getElementById("addr_search").value;
				
				location.href="gogek_search.do?addr="+addr_search;
			}
		</script>
		
	</head>
	
	<body>
		<table border="1">
			<tr>
				<td colspan="6">
					<input type="button" value="등록" onClick="location.href='insert_form.jsp'">
					
					<input placeholder="검색할 지역을 입력하세요" id="addr_search">
					<input type="button" value="검색" onClick="search();">
				</td>
			</tr>
			
			<tr>
				<th>번호</th>
				<th>고객명</th>
				<th>주소</th>
				<th>주민번호</th>
				<th>담당자</th>
				<th>비고</th>
			</tr>
		
			
			<c:forEach var="vo" items="${ list }">
				<form>
					<tr>
						<td>${ vo.gobun }</td>
						<td>${ vo.goname }</td>
						<td>${ vo.goaddr }</td>
						<td>${ vo.gojumin }</td>
						<td>${ vo.godam }</td>
						
						<input type="hidden" name="idx" value="${ vo.gobun }">
						<td><input type="button" value="삭제" onclick="del(this.form);"></td>
					</tr>
				</form>
			</c:forEach>
			
		
		</table>
	</body>
</html>









