<%@page import="java.util.ArrayList"%>
<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 톰캣이 참조할 JNDI를 검색
	InitialContext ic = new InitialContext();
	
	// Resource의 위치 검색
	Context ctx = (Context)ic.lookup("java:comp/env");
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	// Resource에서 얻어낸 정보를 통해서 DB에 연결하기 위한 객체
	Connection conn = dataSource.getConnection();
	
	System.out.println("---DB연결 성공---");
	
	// DB연결 후 dept테이블 조회
	String sql = "select * from dept";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	List<DeptVO> dept_list = new ArrayList<>();
	
	// DB에서 행을 한 줄 씩 검색하여 vo에 저장하고, 
	// 그 값을 dept_list에 add()하자
	while(rs.next()){
		
		DeptVO vo = new DeptVO();
		vo.setDeptno(rs.getInt("deptno"));
		vo.setDname(rs.getString("dname"));
		vo.setLoc(rs.getString("loc"));
		
		dept_list.add(vo);
	}
	
	//DB접근을 위해 만들어진 객체들(pstmt, rs)는 역순으로 닫아준다
	rs.close();
	pstmt.close();
	
	//dbcp를 10으로 잡아놓았기 때문에 close()가 없으면 11번쨰 사용자는 접근이 불가
	//그러므로 conn을 연결하여 사용한 뒤에는 반드시 끝내줘야 다음 사용자가 연결할 수 있다.
	conn.close();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(no) {
				//alert(no);
				let f = document.ff; //name이 ff인 form태그를 가져와라
				
				//alert(f.deptno.value);
				f.deptno.value = no;
				
				f.action = "jdbc_sawon.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form name="ff">
			<table border="1">
				<caption>부서목록</caption>
				
				<tr>
					<th>부서번호</th>
					<th>부서이름</th>
					<th>부서위치</th>
				</tr>
				
				<% 
				for(int i = 0;	i < dept_list.size();	i++){
					DeptVO vo = dept_list.get(i);	
				%>
					<tr align="center">
						<td><%= vo.getDeptno() %></td>
						
						<td>
							<a href="javascript:send('<%= vo.getDeptno()%>');">
								<%= vo.getDname() %>
							</a>
						</td>
						<!-- <td><%= vo.getDname() %></td> -->
						<td><%= vo.getLoc() %></td>
					</tr>
				<%} %>
				
				<!-- 개선된 for문으로 작성한 경우
					<% for(DeptVO vo : dept_list){%>
						<tr align="center">
							<td><%= vo.getDeptno() %></td>
							<td><%= vo.getDname() %></td>
							<td><%= vo.getLoc() %></td>
						</tr>
					<%}%> -->
			</table>
			<input type="hidden" name = "deptno">
		</form>
	</body>
</html>