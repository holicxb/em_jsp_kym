<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주민번호로 정보 알기</title>
		
		<script>
			function jumin(f) {
				let juminNum = f.juminNum.value;
				
				let number_format = /^\d{2}[0-1]\d[0-3]\d-[1-4]\d{6}$/;
				if(!number_format.test(juminNum)){
					alert("000000-0000000 형식으로 입력하세요");
					return;
				}
				
				f.submit();
			}
		</script>
	</head>
	<body>
		<form action="jumin.do">
			주민번호 : <input name = "juminNum">
			<input type="button" value="확인" onClick="jumin(this.form);">
		</form>
	</body>
</html>