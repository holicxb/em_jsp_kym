package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardReplyAction
 */
@WebServlet("/reply.do")
public class BoardReplyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		int idx = Integer.parseInt(request.getParameter("idx"));
		int step = Integer.parseInt(request.getParameter("step"));
		int depth = Integer.parseInt(request.getParameter("depth"));
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();

		BoardDAO dao = BoardDAO.getInstance();
		// 기준글 idx 해당 댓글 달 step
		BoardVO replyVO = new BoardVO();
		replyVO.setIdx(idx);
		replyVO.setStep(step);

		dao.update_step(replyVO);

		// 댓글정보를 VO에 저장
		BoardVO insertVO = new BoardVO();
		insertVO.setName(name);
		insertVO.setSubject(subject);
		insertVO.setContent(content);
		insertVO.setPwd(pwd);
		insertVO.setIp(ip);
		insertVO.setRef(idx);
		insertVO.setStep(step + 1);
		insertVO.setDepth(depth + 1);

		dao.insert_reply(insertVO);

		response.sendRedirect("view.do?idx=" + idx);

	}

}
