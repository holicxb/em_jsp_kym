package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/check_id.do")
public class CheckIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//check_id.do?id=aaa
		//아이디로 조회하면 결과로 1개거나 안되거나 중 하나이다
		String id = request.getParameter("id");
		
		//아이디 중복검사(검색이 된 경우 vo는 NULL이 아님)
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String res = "no";
		if(vo == null) {
			//아이디로 가입이 가능한 상태
			res = "yes";
		}
		
		//검색 결과(res)를 가지고 콜백 메서드로 전달
		String resultStr = String.format("[{'result':'%s'}]",res);
		
		//resultStr을 콜백 백서드로 전송
		response.getWriter().print(resultStr);
	}

}
