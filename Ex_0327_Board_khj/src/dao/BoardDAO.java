package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVO;

public class BoardDAO {
	// single-ton pattern:
	// 객체1개만생성해서 지속적으로 서비스하자
	static BoardDAO single = null;
	SqlSessionFactory factory = null;

	public BoardDAO() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSessionFactory();
	}

	public static BoardDAO getInstance() {
		// 생성되지 않았으면 생성
		if (single == null)
			single = new BoardDAO();
		// 생성된 객체정보를 반환
		return single;
	}

	public List<BoardVO> selectList(HashMap<String, Object> map) {
		SqlSession sqlSession = factory.openSession();

		List<BoardVO> vo = sqlSession.selectList("b.board_list_condition", map);
		sqlSession.close();

		return vo;
	}

	public List<BoardVO> selectList_subPost(int idx) {
		SqlSession sqlSession = factory.openSession();

		List<BoardVO> vo = sqlSession.selectList("b.board_list_subPost", idx);
		sqlSession.close();

		return vo;
	}

	public BoardVO selectList_mainPost(int idx) {
		SqlSession sqlSession = factory.openSession();

		BoardVO vo = sqlSession.selectOne("b.board_list_mainPost", idx);
		sqlSession.close();

		return vo;
	}

	// 해당 컬럼명에서 내가 검색한 내용이 포함된 데이터 검색
	public List<BoardVO> selectList_serach(HashMap<String, Object> map) {
		SqlSession sqlSession = factory.openSession();

		List<BoardVO> vo = sqlSession.selectList("b.board_list_search", map);
		sqlSession.close();

		return vo;
	}

	// 전체 글 크기 조회

	public int select_count(HashMap<String, Object> map) {
		SqlSession sqlSession = factory.openSession();

		int count = sqlSession.selectOne("b.board_list_count", map);
		sqlSession.close();

		return count;
	}

	// 메인글 등록
	public int uploadMainPost(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);

		int res = sqlSession.insert("b.insert_post_main", vo);
		sqlSession.close();

		return res;
	}

	// 조회수 증가
	public int update_readhit(int idx) {
		SqlSession sqlSession = factory.openSession(true);

		int res = sqlSession.update("b.board_update_mainReadhit", idx);
		sqlSession.close();

		return res;
	}

	// 댓글처리를 위해 step값 증가
	public int update_step(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.update("b.board_update_step", vo);
		sqlSession.close();

		return res;
	}

	// 댓글삽입
	public int insert_reply(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);

		int res = sqlSession.insert("b.insert_reply", vo);
		sqlSession.close();

		return res;
	}
}
