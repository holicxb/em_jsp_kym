<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		
		<style>
			caption {
				font-size: 30px;
				text-shadow: 5px 3px 5px gray;
			}
			
			.hid{
				border: none;
			}
		</style>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
		//아이디 중복여부 체크
			let b_idCheck = false;
			
			function send(f) {
				let id = f.id.value;
				let pwd = f.pwd.value;
				let name = f.name.value;
				let email = f.email.value;
				let addr = f.addr.value;
				
				//유효성체크
				if(id == '' || pwd == '' || name == '' || email == '' || addr == ''){
					alert("빈칸이 존재합니다");
					return;
				}
				
				if(!b_idCheck){
					alert("아이디 중복체크는 필수입니다");
				}
				
				f.action = "insert.do";
				f.method = "POST";
				f.submit();
			}
			
			function check_id() {
				let id = document.getElementById("id").value.trim();
				
				if(id == ''){
					alert("아이디는 빈칸일 수 없습니다");
					return;
				}
				
				//아이디 중복검사(ajax 사용)
				var url = "check_id.do";
				var param = "id="+id;
				sendRequest(url, param, resultFunc, "GET");
			}
			
			function resultFunc() {
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					
					let json = (new Function('return'+data))();
					if(json[0].result == 'no'){
						alert("이미 사용 중인 아이디입니다");
					}else{
						alert("사용 가능한 아이디입니다");
						b_idCheck = true;
					}
				}
			}
			
			function change() {
				b_idCheck = false;
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1" align="center">
				<caption>::: 회원 가입 :::</caption>
				
				<tr>
					<th>아이디</th>
					<td>
						<input name="id" class="hid" id="id" onchange="change();">
						<input type="button" value="중복체크" onClick="check_id();">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password" class="hid"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name="name" class="hid"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name="email" class="hid"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="addr" class="hid"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="가입" onClick="send(this.form);">
						<input type="button" value="취소" onClick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>