package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class InsertMember
 */
@WebServlet("/insert.do")
public class InsertMemberAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//정보를 가져온다
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		//가져온 정보를 vo에 저장한다
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setAddr(addr);
		
		//회원을 추가해달라고 내용을 전송해준다
		MemberDAO.getInstance().insert(vo);
		
		RequestDispatcher rd = request.getRequestDispatcher("login_page.jsp");
		
		rd.forward(request, response);
	}

}
