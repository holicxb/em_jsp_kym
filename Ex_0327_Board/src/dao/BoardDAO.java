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

	public static BoardDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new BoardDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory = null;
	
	public BoardDAO() {
		factory = MyBatisConnector.getInstance().getSessionFactory();
	}
	
	//페이징 처리를 포함한 페이지 별 게시물 조회
	public List<BoardVO> selectList( HashMap<String, Object> map){
		SqlSession sqlSession = factory.openSession();
		
		List<BoardVO> list = sqlSession.selectList("b.board_list_condition", map);
		sqlSession.close();
		
		return list;
	}
	
	//게시물 추가(새 글)
	public int insert(BoardVO vo){
		SqlSession sqlSession = factory.openSession(true);
		
		int res = sqlSession.insert("b.board_ins", vo);
		sqlSession.close();
		
		return res;
	}
	
	//게시글 상세보기
	public BoardVO selectOne(int idx) {
		SqlSession sqlSession = factory.openSession();
		
		BoardVO vo = sqlSession.selectOne("b.board_one", idx);
		
		sqlSession.close();
		return vo;
	};
	
	//조회수 상승(update)
	public int update_readhit(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		
		int res = sqlSession.update("b.board_update_readhit", idx);
		sqlSession.close();
		
		return res;
	}
	
	//댓글 처리를 위한 step 증가
	public int update_step(BoardVO baseVO) {
		SqlSession sqlSession = factory.openSession(true);
		
		int res = sqlSession.update("b.board_update_step", baseVO);
		sqlSession.close();
		
		return res;
	}
	
	//댓글 추가
	public int reply(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		
		int res = sqlSession.update("b.board_reply", vo);
		sqlSession.close();
		
		return res;
	}
	
	//삭제 상태 업뎃
	public int update(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		
		int res = sqlSession.update("b.del_update", idx);
		sqlSession.close();
		
		return res;
	}

	//수정
	public int modify(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		
		int res = sqlSession.update("b.modify", vo);
		sqlSession.close();
		
		return res;
	}
	
	//전체 게시글 수 알아내기
	public int getRowTotal(HashMap<String, Object> map) {
		SqlSession sqlSession = factory.openSession(true);
		
		int res = sqlSession.selectOne("b.board_count", map);
		sqlSession.close();
		
		return res;
	}
}










