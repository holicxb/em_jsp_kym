<%@page import="dao.SjDAO"%>
<%@page import="vo.SjVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//sung_update_result.jsp?no=5&name=홍길동22&kor=66&eng=60&mat=77
	
	//업데이트를 위해 넘겨받은 파라미터를 vo로 묶는다
	int no = Integer.parseInt( request.getParameter("no") );
	int kor = Integer.parseInt( request.getParameter("kor") );
	int eng = Integer.parseInt( request.getParameter("eng") );
	int mat = Integer.parseInt( request.getParameter("mat") );
	String name = request.getParameter("name");
	
	SjVO vo = new SjVO();
	vo.setNo(no);
	vo.setKor(kor); 
	vo.setEng(eng);
	vo.setMat(mat);
	vo.setName(name);
	
	//DAO에게 업데이트를 요청
	SjDAO.getInstance().update(vo);
	
	//업데이트가 완료되면 student.jsp로 화면전환
	response.sendRedirect("student.jsp");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>