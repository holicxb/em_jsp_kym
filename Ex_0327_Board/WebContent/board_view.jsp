<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			/* 댓글 form */
			function reply() {
				location.href="reply_form.jsp?idx=${vo.idx}&page=${param.page}&search=${param.search}&search_text=${param.search_text}"
			}
			
			/* 삭제  */
			function del() {
				/* 삭제를 위해 입력한 비밀번호 */
				let pwd = document.getElementById("c_pwd").value;
				/* 원본 비밀번호 */
				let ori_pwd = ${vo.pwd};
				
				//alert(pwd + " / " + ori_pwd);
				
				if(pwd != ori_pwd){
					alert("비밀번호 불일치");
					return;
				}
				
				if(!confirm("삭제하시겠습니까?")){
					return;
				}else{
					var url = "del.do";
					var param = "idx=${vo.idx}";
					sendRequest(url, param, resultFn, "POST");
				}
			}
			
			function resultFn() {
				if(xhr.readyState == 4 && xhr.status == 200){
					var data = xhr.responseText;
					
					if(data == 1){
						alert("삭제성공");
					}else{
						alert("삭제실패");
					}
					
					location.href = "list.do?page=${param.page}";
				}
			}
			
			/* 게시글 수정 */
			function mod() {
				/* 입력한 비밀번호 */
				let pwd = document.getElementById("c_pwd").value;
				/* 원본 비밀번호 */
				let ori_pwd = ${vo.pwd};
				
				if(pwd != ori_pwd){
					alert("비밀번호 불일치");
					return;
				}
				
				location.href="mod_form.jsp?idx=${vo.idx}&page=${param.page}";
			}
		</script>
	</head>
	<body>
		<form name="f">
			<table border="1" style="margin: 0 auto;" width="700">
				<tr>
					<th width="120">제목</th>
					<td>${ vo.subject }</td>
				</tr>
				<tr>
					<th width="120">작성자</th>
					<td>${ vo.name }</td>
				</tr>
				<tr>
					<th width="120">작성일</th>
					<td>${ vo.regdate }</td>
				</tr>
				<tr>
					<th width="120">ip</th>
					<td>${ vo.ip }</td>
				</tr>
				<tr>
					<th width="120">내용</th>
					<td><pre>${ vo.content }</pre></td>
				</tr>
				<tr>
					<th width="120">비밀번호</th>
					<td><input type="password" id="c_pwd"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<!-- 목록으로 돌아가기 -->
						<img src="img/btn_list.gif" onClick="location.href='list.do?page=${param.page}&search=${ param.search }&search_text=${ param.search_text }'">
						
						<!-- 댓글 -->
						<c:if test="${ vo.depth lt 1 }">
							<img alt="" src="img/btn_reply.gif" onClick="reply();">
						</c:if>
						
						<!-- 수정하기 -->
						<img alt="" src="img/btn_modify.gif" onClick="mod();">

						<!-- 글삭제 -->
						<img alt="" src="img/btn_delete.gif" onClick="del();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>