<%@page import="vo.SjVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//성적정보 가져오기
	SjDAO dao = SjDAO.getInstance();
	List<SjVO> sj_list = dao.selectList();
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function del( no ){
				
				if( !confirm("정말 삭제하시겠어요?") ){
					return;
				}
				
				location.href="sung_del.jsp?no="+no;
				
			}
		
			function modify(no, name, kor, eng, mat){
				
				location.href='sung_update.jsp?no='+no+"&name="+name+"&kor="+kor+"&eng="+eng+"&mat="+mat;
				
			}
			
		</script>
	</head>
	
	<body>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>총점</th>
				<th>평균</th>
				<th>순위</th>
				<th colspan="2">비고</th>
			</tr>
			
			<% for( SjVO vo : sj_list ){ %>
			<tr>
				<td id=""><%= vo.getNo() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getKor() %></td>
				<td><%= vo.getEng() %></td>
				<td><%= vo.getMat() %></td>
				<td><%= vo.getTot() %></td>
				<td><%= vo.getAvg() %></td>
				<td><%= vo.getRank() %></td>
				
				
				<td>
					<input type="button" value="삭제" onclick="del('<%= vo.getNo() %>');">
					<input type="button" value="수정" 
					       onclick="modify('<%= vo.getNo()%>', 
					                       '<%= vo.getName() %>', 
					                       '<%= vo.getKor()%>', 
					                       '<%= vo.getEng()%>', 
					                       '<%= vo.getMat()%>');">
				</td>
			</tr>
			
			<%} %><!-- for -->
	
			<%-- <form>
					... onclick="modify(this.form)">
					<input type="hidden" value="<%=vo.getNo() %>" name="no">
			     </form> --%>
	
			<tr>
				<td colspan="9">
					<input type="button" value="학생정보 추가" onclick="location.href='sung_input.jsp'">
				</td>
			</tr>
			
		</table>
	</body>
</html>














