<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			a{text-decoration: none;}
		</style>
		
		<script>
			function search() {
				//조회 카테고리 검색
				let search = document.getElementById("search").value;
				//검색어 조회
				let search_text = document.getElementById("search_text").value.trim();
				
				//카테고리가 전체보기(all)로 지정되어 있지 않은 경우라면 반드시 검색어가 입력되어 있어야 한다
				//유효성 체크
				if(search != 'all' && search_text == ""){
					alert("검색어를 입력하세요");
					return;
				}
				
				//검색 카테고리, 검색어, 페이지 정보를 list.do에게 전달
				location.href="list.do?search="+search+"&search_text="+encodeURIComponent(search_text);
			}
		</script>
	</head>
	<body>
		<table border="1" style="margin:0 auto;" width="700">
			<caption>::: 게시판 :::</caption>
			<tr>
				<th width="50">번호</th>
				<th>제목</th>
				<th width="90">작성자</th>
				<th width="150">등록일</th>
				<th width="50">조회수</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<c:if test="${ vo.del_info ne -1 }">
						<td align="center">${ vo.idx }</td>
					</c:if>
					<c:if test="${ vo.del_info eq -1 }">
						<td align="center"></td>
					</c:if>
					
					<td>
						<!-- 댓글 들여쓰기 -->
						<c:forEach begin="1" end="${ vo.depth }">&nbsp;</c:forEach>
						<!-- 댓글 기호표시 -->
						<c:if test="${ vo.depth ne 0 }">└</c:if>
						
						<!-- 제목 -->
						<c:if test="${ vo.del_info ne -1 }">
							<a href="view.do?idx=${ vo.idx }&page=${param.page}&search=${param.search}&search_text=${param.search_text}">${ vo.subject }</a>
						</c:if>
						<!-- 삭제된 글 -->
						<c:if test="${ vo.del_info eq -1 }">
							<font color="gray">삭제된 게시글입니다</font>
						</c:if>
					</td>
					<td align="center">${ vo.name }</td>
					<td align="center">${ vo.regdate }</td>
					<td align="center">${ vo.readhit }</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="5" align="center">
					${ pageMenu }
				</td>
			</tr>
			
			<tr>
				<td colspan="4" align="center">
					<div>
						<!-- 조회 카테고리 -->
						<select id="search">
							<option value="all">전체보기</option>
							<option value="subject">제목</option>
							<option value="name">이름</option>
							<option value="content">내용</option>
							<option value="name_subject_content">이름+제목+내용</option>
						</select>
						
						<!-- 검색어 입력 창 -->
						<input id="search_text">
						<input type="button" value="검색" onClick="search();">
					</div>
				</td>
				
				<!-- 새 글 쓰기 버튼 -->
				<td colspan="5" align="right">
					<img src="img/btn_reg.gif" 
					onClick="location.href='insert_form.jsp'"
					style="cursor:pointer;">
				</td>
			</tr>
			
		</table>
	</body>
</html>