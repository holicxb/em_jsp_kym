package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.GogekVO;

public class GogekDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static GogekDAO single = null;

	public static GogekDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new GogekDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory = null;
	
	public GogekDAO() {
		factory = MyBatisConnector.getInstance().getSessionFactory();
	}
	
	//고객 목록 가져오기
	public List<GogekVO> selectGogek(){
		//sqlSession을 통해 mapper로 접근
		SqlSession sqlSession = factory.openSession();
		
		List<GogekVO> list = sqlSession.selectList("g.gogek_list");
		sqlSession.close();
		
		return list;
	}
	
	//선택적 고객 목록 가져오기
	public List<GogekVO> selectGogek(String addr){
		//sqlSession을 통해 mapper로 접근
		SqlSession sqlSession = factory.openSession();
		
		List<GogekVO> list = sqlSession.selectList("g.gogek_select", addr);
		sqlSession.close();
		
		return list;
	}
	
	//고객 삭제
	public int delete(int idx) {
		SqlSession sqlSession = factory.openSession(true);//true를 넣으면 auto commit
		
		//sqlSession은 모든 메서드가 파라미터를 반드시 한 개만 가질 수 있다 
		int res = sqlSession.delete("g.gogek_del", idx);
		
		sqlSession.close();
		
		return res;
	}
	
	//고객 추가
	public int insert(GogekVO vo) {
		SqlSession sqlSession = factory.openSession(true);// auto commit
		
		//맵퍼로 전달할 파라미터는 최대 1개
		int res = sqlSession.insert("g.gogek_ins", vo);
		
		sqlSession.close();
		
		return res;
	}
}
