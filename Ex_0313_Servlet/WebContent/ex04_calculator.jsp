<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>calculator</title>
		
		<script>
			function cal(f) {
				let num1 = f.num1.value;
				let num2 = f.num2.value;
				
				let number_format = /^[0-9]+$/;
				if(!number_format.test(num1) || !number_format.test(num2)){
					alert("정수로 입력하세요");
					return;
				}
				
				f.submit();
			}
		</script>
	</head>
	<body>
		<form action="calc.do">
			수1 : <input name = "num1"><br>
			수2 : <input name = "num2"><br>
			<input type="button" value="확인" onClick="cal(this.form);">
		</form>
	</body>
</html>