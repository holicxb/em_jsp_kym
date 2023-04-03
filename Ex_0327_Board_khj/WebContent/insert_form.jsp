<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 500px;
	margin: 0 auto;
	border-collapse: collapse;
}

.input {
	width: 98%;
	margin: 0 auto;
	display: inline-block;
}
</style>
<script type="text/javascript">
	function upload(f) {
		let name = f.name.value;
		let subject = f.subject.value;
		let content = f.content.value;
		let pwd = f.pwd.value;

		if (name == '') {
			alert("이름을 입력해주세요");
			return;
		}
		if (subject == '') {
			alert("제목을 입력해주세요");
			return;
		}
		if (content == '') {
			alert("내용을 입력해주세요");
			return;
		}
		if (pwd == '') {
			alert("비밀번호를 입력해주세요");
			return;
		}

		f.action = "uploadmain.do";
		f.method = "POST";
		f.submit();
	}
</script>
</head>
<body>
	<table border="1" style="margin: 0 auto;">
		<caption>:::글 작성:::</caption>
		<form>
			<tr>
				<td colspan="2">
					<input class="input" type="text" name="subject" placeholder="제목:" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea class="input" cols="30" rows="10" name="content" placeholder="내용:"></textarea>
				</td>
			</tr>
			<tr>
				<td align="left">
					<input type="text" name="name" placeholder="이름:" />
					<input type="text" name="pwd" placeholder="비밀번호" />
				</td>
				<td align="right">
					<input type="button" value="등록" onclick="upload(this.form);" />
					<input type="button" value="취소" onclick="history.go(-1)" />
				</td>
			</tr>
		</form>
	</table>
</body>
</html>