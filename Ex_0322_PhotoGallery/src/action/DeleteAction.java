package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;
import vo.PhotoVO;

/**
 * Servlet implementation class DeleteAction
 */
@WebServlet("/photo_del.do")
public class DeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		PhotoVO vo = PhotoDAO.getInstance().selectOne(idx);
		
		String web_path = "/upload/";
		ServletContext app = request.getServletContext();
		
		//상대경로 -> 절대경로
		String path = app.getRealPath(web_path);
		
		//DB로 접근하여 idx에 해당하는 게시글을 삭제
		int res = PhotoDAO.getInstance().delete(idx);
		//res가 0이 아니라면 그때 절대 경로에 있는 내용을 지운다
		if(res > 0) {
			//DB에서 데이터를 삭제하는데 성공했다면, 절대 경로의 이미지도 함께 삭제
			File f = new File(path, vo.getFilename());
			//(,)표시는 그 경로 내부로 들어가는 것, path경로에 들어가서 해당 파일의 이름을 찾아라
			if(f.exists()) {
				f.delete();//파일 제거
			}
		}
		
		//최종결과를 콜백 메서드로 전달
		response.getWriter().print(res);
	}

}
