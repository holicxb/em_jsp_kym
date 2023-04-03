<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 현재 페이지와 같이 servlet을 통한 DB조회와 결과 출력을 나눠서 작업하는 구조를 model2(MVC패턴) 구조 -->
<!-- 
	 M (Model) : DAO
	 V (View) : jsp
	 C (Controller) : servlet
 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- Ajax사용을 위한 js를 등록해둔다 -->
		<script src="js/httpRequest.js"></script>
		<script>
			function del(idx) {
				
				//location.href='del.do?idx='+idx
				if(!confirm("정말 삭제하시겠습니까?")){
					return;
				}
				
				//idx를 Ajax를 통해서 서버 측으로 전달
				var url = "delete.do";
				var param = "idx="+idx;
				sendRequest(url, param, resultFn, "GET");
				
			}
			
			function resultFn() {
				//콜백 메서드
				if(xhr.readyState == 4 && xhr.status == 200){
					var data = xhr.responseText;
					//data -> no / yes
					if(data == 'yes'){
						alert("삭제 성공");
						
						//페이지 새로고침 코드들
						//location.href="member_list.do";
						history.go(0);//-1은 이전 페이지, 0은 현재페이지?
					}else{
						alert("삭제 실패");
					}
				}
			}
		</script>
	</head>
	<body>
		<table border="1">
			<caption>::: 회원 목록 :::</caption>
			<tr>
				<td colspan="7">
					<input type="button" value="회원가입" onClick="location.href='member_insert_form.jsp'">
				</td>
			</tr>

			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th colspan="2">주소</th>
			</tr>
			
			<c:forEach var="vo" items="${ list }">
				<tr>
					<td>${ vo.idx }</td>
					<td>${ vo.name }</td>
					<td>${ vo.id }</td>
					<td>${ vo.pwd }</td>
					<td>${ vo.email }</td>
					<td>${ vo.addr }</td>
					
					<td>
						<input type="button" value="삭제" onClick="del(${ vo.idx });">
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>