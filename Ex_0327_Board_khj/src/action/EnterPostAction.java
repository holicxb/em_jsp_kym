package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class EnterPostAction
 */
@WebServlet("/view.do")
public class EnterPostAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idx = Integer.parseInt(request.getParameter("idx"));
		BoardDAO dao = BoardDAO.getInstance();
		
		int page = Integer.parseInt(request.getParameter("page"));
		String col = request.getParameter("col");
		String text = request.getParameter("text");

		// 조회수 관리를 위한 session영역
		HttpSession session = request.getSession();
		String check = (String) session.getAttribute("check");

		if (check == null) {
			// 조회수 증가
			dao.update_readhit(idx);
			session.setAttribute("check", "");
		}

		// 조회
		List<BoardVO> list_sub = dao.selectList_subPost(idx);
		BoardVO list_main = dao.selectList_mainPost(idx);

		request.setAttribute("list_sub", list_sub);
		request.setAttribute("list_main", list_main);
		request.setAttribute("page", page);
		request.setAttribute("col", col);
		request.setAttribute("text", text);

		request.getRequestDispatcher("enter_post.jsp").forward(request, response);
	}

}
