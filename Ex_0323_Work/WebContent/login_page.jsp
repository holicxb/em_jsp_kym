<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 화면</title>
		
		<link rel="stylesheet" href="css/login_page.css">
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function send(f) {
				let id = f.id.value;
				let pwd = f.pwd.value;

				var url = "login.do";
				var param = "id="+id+"&pwd="+encodeURIComponent(pwd);
				
				sendRequest(url, param, checkLogin, "post");
			}
			
			function checkLogin() {
				if(xhr.readyState == 4 && xhr.status == 200){
					var data = xhr.responseText;
					
					if(data == 'no_id'){
						alert("아이디가 존재하지 않음");
					}else if(data == 'no_pwd'){
						alert("패스워드 불일치");
					}else {
						alert("로그인 성공");
						location.href="main_page.jsp";
					}
				}
			}
		</script>
	</head>
	<body>
		
		<div style="text-align: center;">
			<h1>::: LOGIN PAGE :::</h1>
			<img alt="배너사진" src="img/float.jpg">
		</div>
		<form>
			<table border="1" align="center">
				<tr>
					<th>아이디</th>
					<td><input name="id" class="hid"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password" class="hid"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="로그인" onClick="send(this.form);">
						<input type="button" value="회원가입" name="insert" onClick="location.href='insert_page.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>