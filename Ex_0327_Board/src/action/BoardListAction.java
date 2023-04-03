package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import util.Common;
import util.Paging;
import vo.BoardVO;

/**
 * Servlet implementation class BoardListAction
 */
@WebServlet("/list.do")
public class BoardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//list.do?
		//list.do?page=2
		//list.do?page=
		int nowPage = 1; //1로 첫페이지 번호를 가정
		String page = request.getParameter("page");//기본자료형은 null값을 판단하지 못함
		if(page != null && !page.isEmpty()) {//올바른 값을 받았다면
			nowPage = Integer.parseInt(page);
		}
		
		//한페이지에 표시될 게시물의 시작과 끝 번호를 계산
		//1page : 1 ~ 5 번 랭크의 게시글을 보여줘야함
		//2page : 6 ~ 10 번 랭크의 게시글을 보여줘야함
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = nowPage * Common.Board.BLOCKLIST;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		//검색관련 내용
		String search = request.getParameter("search");//카테고리
		String search_text = request.getParameter("search_text");//검색어
		
		//검색어가 입력되어 있는 경우
		if(search != null && !search.equalsIgnoreCase("all")) {
			switch (search) {
			case "name_subject_content":
				map.put("name", search_text);
				map.put("subject", search_text);
				map.put("content", search_text);
				break;
			case "name":
				map.put("name", search_text);
				break;
			case "subject":
				map.put("subject", search_text);
				break;
			case "content":
				map.put("content", search_text);
				break;

			default:
				break;
			}//switch
		}
		
		//전체 목록 조회
		List<BoardVO> list = null;
		BoardDAO dao = BoardDAO.getInstance();
		
		list = dao.selectList(map);
		
		//페이지 메뉴 생성
		int row_total = dao.getRowTotal(map);
		
		String search_param = String.format("search=%s&search_text=%s", search, search_text);
		
		//하단 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("list.do", 
											nowPage, // 현재페이지
											row_total, // 전체 게시글 수
											search_param, 
											Common.Board.BLOCKLIST, // 한 페이지에 보여줄 게시글 수
											Common.Board.BLOCKPAGE); //페이지 메뉴의 수
		
		//pageMenu를 바인딩
		request.setAttribute("pageMenu", pageMenu);
		
		//바인딩
		request.setAttribute("list", list);
		
		//세션에 기록되어 있는 check정보를 삭제
		request.getSession().removeAttribute("check");
		
		//포워딩
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);
	}

}
