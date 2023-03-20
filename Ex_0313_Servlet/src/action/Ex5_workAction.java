package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jumin.do")
public class Ex5_workAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jumin = request.getParameter("juminNum");
		String month = jumin.substring(2, 4);
		String jumin_first = jumin.substring(7,8);
		String season = "";
		String sex = "";
		switch (month) {
		case "01": case "02": case "12": 
			season = "겨울";
			break;
		case "03": case "04": case "05": 
			season = "봄";
			break;
		case "06": case "07": case "08": 
			season = "여름";
			break;
		case "09": case "10": case "11": 
			season = "가을";
			break;
		}
		
		switch (jumin_first) {
		case "1": case "3": 
			sex = "남성";
			break;
		case "2": case "4":
			sex = "여성";
			break;
		}
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
			out.print("<body>");
				out.print("<table border='1'>");
					out.print("<tr>");
						out.print("<td>주민번호 </td>");
						out.printf("<td>%s</td>", jumin);
					out.print("<tr>");
					
					out.print("<tr>");
						out.print("<td>성별 </td>");
						out.printf("<td>%s</td>", sex);
					out.print("<tr>");
					
					out.print("<tr>");
						out.print("<td>계절 </td>");
						out.printf("<td>%s</td>", season);
					out.print("<tr>");
				out.print("</table>");
			out.print("</body>");
		out.print("</html>");
	}

}
