package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import util.Common;
import vo.BoardVO;

/**
 * Servlet implementation class BoardListAction
 */
@WebServlet("/board_list.do")
public class BoardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 조회수 관리를 위한 session영역 초기화
		request.getSession().removeAttribute("check");

		int nowPage = 1;
		String page = request.getParameter("page");
		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}

		// 한 페이지에 표시될 게시물의 시작과 끝 번호를 계산
		int start_p = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end_p = nowPage * Common.Board.BLOCKLIST;
		HashMap<String, Object> mapPage = new HashMap<String, Object>();
		mapPage.put("start", start_p);
		mapPage.put("end", end_p);
		List<BoardVO> list = null;
		BoardDAO dao = BoardDAO.getInstance();
		// 검색 필터링
		String text = request.getParameter("text");
		String col = request.getParameter("col");
		if (text == null) {
			list = dao.selectList(mapPage);
		} else {
			mapPage.put("text", text);
			mapPage.put("col", col);
			list = dao.selectList_serach(mapPage);
		}

		// 현재 페이지 블록 단위 계산
		int nowBlock = (nowPage - 1) / Common.Board.BLOCKPAGE;
		int start_b = nowBlock * Common.Board.BLOCKPAGE + 1;
		int end_b = (nowBlock + 1) * Common.Board.BLOCKPAGE;

		// 해당 조건을 만족한 모든 데이터 열
		int count = dao.select_count(mapPage);
		int maxPage = (int) Math.ceil((double) count / Common.Board.BLOCKLIST);
		end_b = Math.min(maxPage, end_b);
		//System.out.println(count);

		request.setAttribute("list", list);
		request.setAttribute("start", start_b);
		request.setAttribute("end", end_b);
		request.setAttribute("page", nowPage);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("text", text);
		request.setAttribute("col", col);
		request.getRequestDispatcher("board_list.jsp").forward(request, response);
	}

}
