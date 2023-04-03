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
		//login.do?id=hong&pwd=1111
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//id가 있다 없다를 판단하는 것은 vo가 null인지 아닌지로 판단하면 된다
		//id검색에 성공했다면 현재 vo에는 name, pwd등의 정보가 포함되어있는 상태
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String param = "clear";
		
		if(vo == null) {
			//DB에 아이디가 존재하지 않는 경우
			param = "no_id";
			response.getWriter().print(param);
			return;
		}
		
		//비밀번호 일치 여부 확인
		if(!vo.getPwd().equals(pwd)) {
			param = "no_pwd";
			response.getWriter().print(param);
			return;
		}
		
		//id와 pwd에 문제가 없다면, vo의 정보를 session영역에 저장
		//session은 어디서나 사용 가능
		//session 스코프에 바인딩 함 / 저장되는 위치가 다름
		HttpSession session = request.getSession();//세션객체 생성
		
		//세션은 서버의 메모리(ram)를 사용하기 때문에 많이 사용할 수록 브라우저를 느리게 만든다
		session.setAttribute("user", vo);
		
		//세션의 유지시간은 30분으로 기본세팅 되어 있다
		//setMaxInactiveInterval()을 통해 초 단위로 유지시간을 변경해줄 수 있다.
		//session.setMaxInactiveInterval(3600);//초 단위
		
		response.getWriter().print(param);
	}

}
