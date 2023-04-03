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
				
				f.submit();
				//alert("gggg");
			}
		</script>
	</head>
	<body>
		<form method="post" action="modify.do" name="f">
			<input type="hidden" name="idx" value="${param.idx}">
			<table border="1" style="margin:0 auto;"  width="700">
				<caption>::: 게시글 수정 :::</caption>
				<tr>
					<th>내용</th>
					<td><textarea name="content" rows="25" cols="85" style="resize: none;">${ vo.content }</textarea></td>
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