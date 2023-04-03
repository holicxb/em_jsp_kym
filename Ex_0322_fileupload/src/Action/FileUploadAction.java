package Action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/upload.do")
public class FileUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//웹컨텐트 안에 만든 upload 폴더는 개발할 때 필요한 이미지만 넣음/ 상대경로
		//절대경로에 같은 이름의 폴더가 어떤 위치에 자동으로 만들어짐
		//상대경로에 이미지를 넣으면 절대 경로에 포함이 되고, 절대 경로에 이미지를 넣으면 상대경로에는 들어가지 않는다
		
		//임시로 저장 위치 정해주기
		//String path = "c:/upload";
		
		//프로젝트 목록에서 WebContent에서 upload 폴더를 만듦
		//이로써 상대경로와 절대경로가 생성됨
		String web_path = "/upload/";//상대경로
		
		//현재 프로젝트(WebApplication)를 관리하는 객체
		ServletContext app = request.getServletContext();
		
		//데이터를 상대경로 -> 절대경로로 변환
		String path = app.getRealPath(web_path);//절대경로
		
		//콘솔창에서 위치 출력해서 파악 필요
		//System.out.println("절대 경로 : "+path);
		//출력된 절대경로를 파일 탐색기에 입력하면 저장되는 것이 보임
		//상대경로에서 절대경로의 이미지를 불러오는 것이 가능하다
		
		int max_size = 1024 * 1024* 100; //최대 업로드 용량
		
		//파일을 포함한 업로드를 처리하기 위한 객체(cos.jar파일에 들어있는 클래스)
		MultipartRequest mr = new MultipartRequest(//파라미터 처리만 위임
				request, 
				path, //저장경로
				max_size, //최대 업로드 용량
				"utf-8", 
				new DefaultFileRenamePolicy() //동일 파일 명 정책
		);
		
		//업로드된 파일정보 얻어오기
		String filename = "no_file";
		File f = mr.getFile("photo");//넘어온 파라미터 입력
		if(f != null) {
			filename = f.getName();//업로드된 파일의 이름
		}
		
		//파일형식이 아닌 일반 파라미터 수신
		//String title = request.getParameter("title"); X
		String title = mr.getParameter("title");//파일형태로 묶여서 넘어왔기 때문에 이렇게 받아야함
		
		//파일 이름과 제목 바인딩 작업은 request가 진행함
		request.setAttribute("title", title);
		request.setAttribute("filename", filename);
		
		//포워딩
		RequestDispatcher disp = request.getRequestDispatcher("result.jsp");
		disp.forward(request, response);
	}

}
