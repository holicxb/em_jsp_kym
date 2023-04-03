package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardModAction
 */
@WebServlet("/modify.do")
public class BoardModAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
		
		//입력한 정보 가져오기
		int idx = Integer.valueOf(request.getParameter("idx"));
		//System.out.println(idx);
		
		String content = request.getParameter("content");
		//System.out.println(content);
		String ip = request.getRemoteAddr();
		//System.out.println(ip);
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.selectOne(idx);
		
		//수정 내용 vo에 저장
		vo.setContent(content);
		vo.setIp(ip);
		dao.modify(vo);
		
		request.setAttribute("vo", vo);
		RequestDispatcher disp = request.getRequestDispatcher("board_view.jsp?idx="+idx);
		disp.forward(request, response);
		
	}

}
