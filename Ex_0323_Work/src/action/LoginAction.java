package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String param = "clear";
		
		//아이디 존재 확인
		if(vo == null) {
			param = "no_id";
			response.getWriter().print(param);
			return;
		}
		
		//패스워드 일치 여부 확인
		if(!vo.getPwd().equals(pwd)) {
			param = "no_pwd";
			response.getWriter().print(param);
			return;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("user", vo);
		response.getWriter().print(param);
	}

}
