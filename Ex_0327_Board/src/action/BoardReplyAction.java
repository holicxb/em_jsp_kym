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

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//댓글처리 서블릿
		//System.out.println("aaa");
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.valueOf(request.getParameter("idx"));
		//System.out.println(idx);
		
		//페이지 정보 수신
		String page = request.getParameter("page");
		//System.out.println(page);
		
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		
		String name = request.getParameter("name");
		//System.out.println(name);
		String subject = request.getParameter("subject");
		//System.out.println(subject);
		String content = request.getParameter("content");
		//System.out.println(content);
		String pwd = request.getParameter("pwd");
		//System.out.println(pwd);
		String ip = request.getRemoteAddr();
		//System.out.println(ip);
		
		BoardDAO dao = BoardDAO.getInstance();
		//기준글 idx를 통해 댓글을 달고 싶은 원본 글의 정보를 얻어온다
		BoardVO baseVO = dao.selectOne(idx);
		//기준글(baseVO)의 step보다 큰 값들을 모두 step = step+1 처리 해 줌
		dao.update_step(baseVO);
		
		//댓글 정보를 vo에 저장
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		//댓글이 들어갈 위치 선정
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep()+1);
		vo.setDepth(baseVO.getDepth()+1);
		
		dao.reply(vo);
		response.sendRedirect("list.do?page="+page);
		//+"&search="+search+"&search_text="+search_text
	}

}
