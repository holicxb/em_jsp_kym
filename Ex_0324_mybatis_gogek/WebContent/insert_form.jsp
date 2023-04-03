<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f) {
				//파라미터 : name, addr, jumin, godam
				
				//유효성체크 생략
				
				f.action="insert_form.do";
				f.method="post";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input name="name"></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input name="addr"></td>
				</tr>

				<tr>
					<th>주민번호</th>
					<td><input name="jumin"></td>
				</tr>

				<tr>
					<th>담당자</th>
					<td><input name="godam"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onClick="send(this.form);">
						<input type="button" value="취소" onClick="history.go(-1)"> 
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>