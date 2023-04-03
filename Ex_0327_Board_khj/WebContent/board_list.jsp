<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

#title>th {
	background-color: #aaf;
}

.subject:hover {
	background-color: #aaf9;
}

#bottom_bar {
	display: flex;
}

#page_bar {
	width: 650px;
}

#search_bar {
	text-align: center;
}

#bottom_bar>div {
	text-align: center;
	margin: 5px 0 0 0;
}

a {
	text-decoration: none;
}

.page_button {
	border: none;
	background-color: transparent;
	font-size: 14px;
}

.page_button_none {
	border: none;
	background-color: transparent;
	font-size: 14px;
	color: gray;
}

.page_button:hover {
	text-shadow: 2px 1px 2px #aaa;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function change(page) {
		if(page < 1){
			page = 1;
		}
		if(page > ${ maxPage }){
			page = ${maxPage};
		}
		location.href="board_list.do?page="+page+"&col=${col}&text=${text}";
	}
	
	function search(f) {
		let ch = f.text.value;
		if(ch == ''){
			alert("검색어를 입력하세요");
			return;
		}
		
		f.action = "board_list.do";
		f.submit();
	}
	
	function cancel(f) {
		f.action = "board_list.do";
		f.submit();
	}
	
</script>
</head>
<body>
	<div id="login" style="width: 700px; margin: 0 auto; text-align: right;">
		<input type="button" value="로그인" onclick="login();" />
	</div>
	<table border="1" style="margin: 0 auto;" width="700">
		<caption>
			<h2>::: 김볼탱 게시판:::</h2>
		</caption>
		<tr id="title">
			<th width="50">번호</th>
			<th>제목</th>
			<th width="90">작성자</th>
			<th width="90">작성일</th>
			<th width="50">조회수</th>
		</tr>

		<c:forEach var="vo" items="${ list }">
			<tr class="subject">
				<td align="center">${ vo.idx }</td>
				<td>
					<a href="view.do?idx=${ vo.idx }&page=${ page }&col=${ col }&text=${ text }"> ${ vo.subject }
					</a>
				</td>
				<td align="center">${ vo.name }</td>
				<td align="center">${ vo.regdate }</td>
				<td align="center">${ vo.readhit }</td>
			</tr>
		</c:forEach>

		<tr>
			<td colspan="5">
				<div id="bottom_bar">
					<div id="page_bar">
						<input class="page_button" type="button" value="<이전" onclick="change(${page - 1});" />
						<c:forEach var="i" begin="${ start }" end="${ end }">
							<c:choose>
								<c:when test="${ i eq page }">
									<input style="color: blue;" class="page_button" type="button" value=" ${ i }"
										onclick="change(${ i });" />
								</c:when>
								<c:otherwise>
									<input class="page_button" type="button" value=" ${ i }"
										onclick="change(${ i });" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<input class="page_button" type="button" value=" 다음>" onclick="change(${page + 1});" />
					</div>
					<div>
						<img src="img/btn_reg.gif" alt="" onclick="location.href='insert_form.jsp'"
							style="cursor: pointer;" />
					</div>
				</div>
				<div id="search_bar">
					<form style="display: inline-block;">
						<SELECT size=1 name="col">
							<OPTION value="subject" selected>제목</OPTION>
							<OPTION value="name">작성자</OPTION>
							<OPTION value="content">내용</OPTION>
						</SELECT>
						<input hidden="hidden" />
						<input type="text" name="text" id="search_box"
							onKeypress="javascript:if(event.keyCode==13){search(this.form);}" />
						<input type="button" value="검색" id="search_click" onclick="search(this.form);" />
					</form>
					<form style="display: inline-block;">
						<c:if test="${ text ne null }">
							<input type="button" value="취소" onclick="cancel(this.form);" />
						</c:if>
					</form>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>