package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;

/**
 * Servlet implementation class BoardDelAction
 */
@WebServlet("/del.do")
public class BoardDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//del.do?idx=3
		//지워진 것처럼 업데이트 할 것
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int res = BoardDAO.getInstance().update(idx);
		
		//삭제(된 것처럼) 완료되었는지에 대한 결과를 콜백 메서드로 보낸다
		response.getWriter().print(res);
	}

}
