package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GogekDAO;

/**
 * Servlet implementation class GogekDelAction
 */
@WebServlet("/gogek_del.do")
public class GogekDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//gogek_del.do?idx=2
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		int res = GogekDAO.getInstance().delete(idx);
		
		response.sendRedirect("gogeklist.do");
	}

}
