<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Ajax(Asynchronus Javascript & xml) : 비동기통신 
	자바 스크립트를 이용한 백그라운드 통신 기술(하나의 웹페이지 안에서 변경이 발생한 특정 영역에 대해서만 갱신이 가능하다) -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- Ajax 사용을 위해 미리 준비해둔 httpRequest.js를 참조 -->
		<script src="js/httpRequest.js"></script>
		<script>
			function send() {
				let dan = document.getElementById("dan").value;
				
				//유효성체크
				
				//Ajax를 통해 dan을 파라미터로 전달
				let url = "ex01_gugudan_ajax.jsp";
				let param = "dan="+dan;
				
				//						콜백메서드(특정조건이 만족되면 자동으로 호출)
				sendRequest(url, param, resultFn, "GET");
			}
			
			//콜백메서드(Ajax로 요청된 결과를 처리하기 위한 메서드)
			function resultFn() {
				//alert("콜백호출됨");
				//console.log(xhr.readyState + "/" + xhr.status);
				//xhr.readyState
				//- 0 : 초기화 오류
				//- 1,2,3 : 현재 페이지 로드 중
				//- 4 : 로드완료
				
				//xhr.status
				//200 : 이상없음
				//404 : 경로없음, 500 : 서버에러
				
				if(xhr.readyState == 4 && xhr.status == 200){
					//결과를 가지고 돌아온 데이터를 읽어온다
					let data = xhr.responseText;
					//alert(data);
					
					document.getElementById("disp").innerHTML = data;
				}
			}
		</script>
	</head>
	<body>
		단 : <input id="dan">
		<input type="button" value="결과보기" onClick="send();">
		<br>
		<div id="disp"></div>
	</body>
</html>