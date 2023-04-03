<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f) {
				let title = f.title.value;
				let photo = f.photo.value;
				
				//유효성(무결성) 체크
				if(title == ''){
					alert("제목을 입력하시오");
					return;
				}
				
				if(photo == ''){
					alert("파일을 선택하시오");
					return;
				}
				
				f.action = "upload.do";
				f.submit();
			}
		</script>
	</head>
	<body>
		<!-- http://servlets.com 접속 - 좌측 'COS File Upload Library' 클릭 -
			  제일 아래로 내려서 다운로드 진행 후 압축 풀기 - 
			 lib 안의 cos.jar 파일 WEB-INF의  lib 폴더에 복사해넣는다 -->
		<!-- 파일 업로드를 위해 반드시 지켜야하는 고려사항 
			  반드시 form태그에서 사용해야 하며, 전송방식은 post, enctype이 설정 되어 있어야 한다 -->
		<form method="post" enctype="multipart/form-data">
			제목 : <input name="title"><br>
			첨부 : <input type="file" name="photo"><br>
			<input type="button" value="업로드" onClick="send(this.form);">
		</form>
	</body>
</html>