<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#post_box {
	width: 700px;
	margin: 0 auto;
}

#info {
	width: 100%;
	display: flex;
}

#info>* {
	text-align: center;
}

#info_left {
	width: 20%;
	text-align: left;
}

#info_center {
	width: 60%;
}

#info_right {
	width: 20%;
}

#title {
	width: 100%;
	text-align: center;
	margin: 0 auto;
	border: 1px solid black;
}

#content {
	width: 100%;
	text-align: left;
	margin: 0 auto;
	border: 1px solid black;
}

pre {
	white-space: pre-wrap;
}

#link {
	width: 700px;
	margin: 0 auto;
}

.comment_box {
	width: 700px;
	margin: 5px auto;
	border: 1px solid red;
	display: flex;
}

#comment_box2 {
	width: 700px;
	margin: 5px auto;
	border: 1px solid red;
}

.comment {
	width: 100%;
	border: 1px solid black;
}

table {
	width: 100%;
	margin: 0 auto;
	border-collapse: collapse;
}

.del:hover {
	cursor: pointer;
	color: #aaf;
}
</style>
<script type="text/javascript">
	function post_sub(idx) {
		let parent = document.getElementById(idx).children;
		let a = parent[0];
		let div = parent[2];

		if (a.style.display == 'inline') {
			let t = document.getElementById(idx + 'title');
			let c = document.getElementById(idx + 'content');
			t.value = "";
			c.value = "";
			a.style.display = 'none';
		} else {
			a.style.display = 'inline';
		}
		if (div.style.display == 'none') {
			div.style.display = 'block';
		} else {
			div.style.display = 'none';
		}
	}

	function reply(f) {
		console.log(f);
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

		f.action = "reply.do";
		f.method = "POST";
		f.submit();
	}

	function cancel(f) {
		f.subject.value = "";
		f.content.value = "";
		f.name.value = "";
		f.pwd.value = "";
	}

	function move_comment() {
		var target = document.getElementById("comment_box2");
		var moveY = window.pageYOffset + target.getBoundingClientRect().top;
		window.scrollTo(0, moveY);

	}

	function del(f) {
		if (!confirm("삭제하시겠습니까?")) {
			return;
		}
		if(f.pwd.value != f.type_pwd.value){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		f.action = "del.do";
		f.submit();
	}
</script>
</head>
<body>
	<div id="post_box">
		<div id="info">
			<div id="info_left">
				<div>${ list_main.name }</div>
			</div>
			<div id="info_center">
				<div>${ list_main.regdate }</div>
			</div>
			<div id="info_right">
				<div>조회수: ${ list_main.readhit }</div>
			</div>
		</div>
		<div id="title">
			<h1>${ list_main.subject }</h1>
		</div>
		<div id="content">
			<pre>${ list_main.content }</pre>
		</div>
	</div>
	<div id="link">
		<a href="board_list.do?page=${ page }&col=${ col }&text=${ text }">|목록|</a>
		<a href="javascript:move_comment();">|댓글|</a>
	</div>
	<c:forEach var="vo" items="${ list_sub }">
		<div class="comment_box">
			<c:if test="${vo.depth eq 2 }">
				<div>┖</div>
			</c:if>
			<div class="comment">
				<div>${ vo.name }(${ vo.regdate })</div>
				<div>제목: ${ vo.subject }</div>
				<div>내용: ${ vo.content }</div>
				<div id="${ vo.idx }">
					<c:if test="${vo.depth lt 2 }">
						<a href="javascript:post_sub(${ vo.idx });" style="display: inline;">답글</a>
					</c:if>
					<form style="display: inline-block; float: right;">
						<input type="hidden" name="idx" value="${ vo.idx }" />
						<input type="hidden" name="pwd" value="${ vo.pwd }" />
						<input type="text" name="type_pwd" />
						<input type="button" value="삭제" onclick="del(this.form);" class="del"
							style="background-color: transparent; border: none;" />
					</form>
					<div style="display: none">
						<!-- form1 start -->
						<form>
							<input type="hidden" name="idx" value="${ list_main.idx }" />
							<input type="hidden" name="step" value="${ vo.step }" />
							<input type="hidden" name="depth" value="${ vo.depth }" />
							<table border="1" class="tt">
								<tr>
									<td colspan="2">
										<input id="${ vo.idx }title" type="text" name="subject" placeholder="제목:"
											style="width: 98%; margin: 0 auto; display: inline-block;" />
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<textarea id="${ vo.idx }content" cols="30" rows="10" name="content"
											placeholder="내용:" style="width: 99%; margin: 0 auto; display: inline-block;"></textarea>
									</td>
								</tr>
								<tr>
									<td align="left">
										<input type="text" name="name" placeholder="이름:" />
										<input type="text" name="pwd" placeholder="비밀번호" />
									</td>
									<td align="right">
										<input type="button" value="작성" onclick="reply(this.form);" />
										<input type="button" value="취소" onclick="post_sub(${ vo.idx })" />
									</td>
								</tr>
							</table>
						</form>
						<!-- form1 end -->
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- 메인글에 댓글  -->
	<div id="comment_box2">
		<form>
			<input type="hidden" name="idx" value="${ list_main.idx }" />
			<input type="hidden" name="step" value="${ list_main.step }" />
			<input type="hidden" name="depth" value="${ list_main.depth }" />
			<table border="1" class="tt">
				<tr>
					<td colspan="2">
						<input id="title" type="text" name="subject" placeholder="제목:"
							style="width: 98%; margin: 0 auto; display: inline-block; text-align: left" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea id="content" cols="30" rows="10" name="content" placeholder="내용:"
							style="width: 99%; margin: 0 auto; display: inline-block;"></textarea>
					</td>
				</tr>
				<tr>
					<td align="left">
						<input type="text" name="name" placeholder="이름:" />
						<input type="text" name="pwd" placeholder="비밀번호" />
					</td>
					<td align="right">
						<input type="button" value="작성" onclick="reply(this.form);" />
						<input type="button" value="취소" onclick="cancel(this.form);" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>