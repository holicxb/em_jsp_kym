<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
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
				
				//유효성 체크는 했다고 가정
				if(id == ''){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(!b_idCheck){
					alert("아이디 중복체크를 하세요");
				}
				
				f.action = "insert.do";
				f.method = "POST";
				f.submit();
			}
			
			//아이디 중복체크를 위한 함수
			function check_id() {
				let id = document.getElementById("id").value.trim();
				
				if(id == ''){
					alert("아이디를 입력하세요");
					return;
				}
				
				//Ajax를 통해 아이디 중복검사
				var url = "check_id.do";
				var param = "id="+id;
				sendRequest(url, param, resultFun, "GET");
			}
			
			//중복체크 버튼 클릭 수 자동으로 호출되는 콜백 메서드
			function resultFun() {
				if(xhr.readyState == 4 && xhr.status == 200){
					
					let data = xhr.responseText;
					/* 	data = "[{'result':'yes'}]"
						JSON처럼 생겼지만 문자열이다 */
					//alert(data);
					
					//문자열로 넘어온 data를 실제 json구조로 변경
					let json = (new Function('return'+data))();
					if(json[0].result == 'no'){
						alert("이미 사용 중인 아이디입니다");
					}else{
						alert("사용 가능한 아이디입니다");
						b_idCheck = true;
					}
				}
			}
			
			function che() {
				//아이디를 입력받는 창의 값이 변경되면 호출되는 메서드
				b_idCheck = false;
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1">
				<caption>::: 회원 가입 :::</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input name="id" id="id" onchange="che();">
						<input type="button" value="중복체크" onClick="check_id();">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name="name"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name="email"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="addr"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="가입" onClick="send(this.form);">
						<input type="button" value="취소" onClick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>