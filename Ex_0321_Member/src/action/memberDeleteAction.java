package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("/delete.do")
public class memberDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		int res = MemberDAO.getInstance().delete(idx);
		String param = "no";
		if(res > 0) {
			//삭제 성공 시 param을 yes로 변경
			param = "yes";
		}
		
		//String resultStr = String.format("[{'res':'%s'}]", param);
		
		//콜백 메서드로 복귀
		response.getWriter().print(param);
	}
}
