package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/greet.do")
public class Ex2_GreetAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 파라미터로 넘어오는 모든 데이터는 문자열 구조로 전달된다
		// greet.do?nation=kor&age=20
		// request.getParameter("nation"); --> kor
		// request.getParameter("age"); --> 20
		
		// 클라이언트가 보내준 파라미터 정보를 받아야한다
		String msg = request.getParameter("nation");
		
		// 잘못된 파라미터 전달의 예시
		// 1) greet.do?nation --> ""인 상태(isEmpty())
		// 2) greet.do?		  --> null인 상태
		String result = "";
		if(msg == null || msg.isEmpty()) {
			result = "안녕하세요";
		}
		if(msg.equals("kor")) {
			result = "안녕하세요";
		}else if(msg.equals("eng")) {
			result = "Hello";
		}
		System.out.println(result);
		
		// 파라미터에 따라 동적으로 변하는 응답처리 객체
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
			out.print("<head>");
			out.print("</head>");
			out.print("<body>");
				out.print(result);
			out.print("</body>");
		out.print("</html>");
		
	}

}
