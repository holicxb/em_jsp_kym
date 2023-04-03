<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send() {
				let f = document.f;
				
				let subject = f.subject.value;
				
				//유효성 체크
				if(subject == ''){
					alert("제목은 필수입니다");
					return;
				}
				
				f.submit();
			}
		</script>
	</head>
	<body>
		<form method="post" action="insert_form.do" name="f">
			<table border="1" style="margin:0 auto;"  width="700">
				<caption>::: 새 글 작성 :::</caption>
				<tr>
					<th width="90">제목</th>
					<td><input name="subject" style="border: none;" size="80"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input name="name" style="border: none;" size="80"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" rows="25" cols="85" style="resize: none;"></textarea></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" name="pwd"  style="border: none;" size="80"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<img src="img/btn_reg.gif" onClick="send();" style="cursor: pointer;">
						<img src="img/btn_back.gif" onClick="history.go(-1);" style="cursor: pointer;">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>