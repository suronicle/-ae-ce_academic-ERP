package kr.co.dong.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlsession;
	
	private static String namespace = "kr.co.dong.boardMapper";

	@Override
	public List<BoardDTO> boardList() {
		
		return sqlsession.selectList(namespace+".boardList");
	}

	@Override
	public BoardDTO boardDetail(int boardNum) {
		
		return sqlsession.selectOne(namespace+".boardDetail",boardNum);
	}

	@Override
	public List<BoardDTO> boardTeaList() {
		
		return sqlsession.selectList(namespace+".boardTeaList");
	}

	@Override
	public BoardDTO registerUser(String userId) {
		
		return sqlsession.selectOne(namespace+".registerUser",userId);
	}

	@Override
	public int boardRegister(BoardDTO boardDTO) {
	
		return sqlsession.insert(namespace+".boardRegister",boardDTO);
	}

	@Override
	public int updateCount(int boardNum) {
	
		return sqlsession.update(namespace+".updateCount",boardNum);
	}

	@Override
	public BoardDTO selectOne(int boardNum) {

		return sqlsession.selectOne(namespace+".selectOne",boardNum);
	}

	@Override
	public int editBoard(BoardDTO boardDTO) {
	
		return sqlsession.update(namespace+".editBoard",boardDTO);
	}

	@Override
	public int delBoard(int boardNum) {
	
		return sqlsession.delete(namespace+".delBoard",boardNum);
	}

	@Override
	public List<BoardDTO> boardStuList() {
	
		return sqlsession.selectList(namespace+".boardStuList");
	}
	
	
	


	/////////////////////////////////관리자 
	
	
	// board 미리보기
		public List<BoardDTO> board() {
			return sqlsession.selectList(namespace + ".board");
		}
		// mNBoard 리스트
		public List<BoardDTO> mNBoard() throws Exception {
			return sqlsession.selectList(namespace + ".mNBoard"); 
		}
		// mTBoard 리스트
		public List<BoardDTO> mTBoard() throws Exception {
			return sqlsession.selectList(namespace + ".mTBoard"); 
		}
		// mSBoard 리스트
		public List<BoardDTO> mSBoard() throws Exception {
			return sqlsession.selectList(namespace + ".mSBoard");
		}
		// mBoardDetail 상세보기
		public BoardDTO mBoardDetail(int bno) {
			return sqlsession.selectOne(namespace + ".mBoardDetail", bno);
		}
		// mBoardRecycle 리스트
		public List<BoardDTO> mBoardRecycle() {
			return sqlsession.selectList(namespace + ".mBoardRecycle");
		}
		
		// board 신규작성
		public int mBoardRegister(BoardDTO dto) {
			return sqlsession.insert(namespace + ".mBoardRegister", dto);
		}
		// board user 값 가져오기
		public BoardDTO boardUser(String userId) {
			return sqlsession.selectOne(namespace + ".boardUser", userId);
		}
		// mBoardEdit 수정
		public int mBoardEdit(BoardDTO dto) {
			return sqlsession.update(namespace + ".mBoardEdit", dto);
		}
		
		// board 삭제
		public int mBoardDelete(int bno) {
			return sqlsession.delete(namespace + ".mBoardDelete", bno);
		}
		
		public int mBoardRecycleDelete(int bno) {
			return sqlsession.delete(namespace + ".mBoardRecycleDelete", bno);
		}
		
		// board 조회수증가
		public int boardCount(int bno) {
			return sqlsession.update(namespace + ".boardCount", bno);
		}
		
		// board 휴지통 복구
		public int mBoardRestore(int bno) {
			return sqlsession.update(namespace + ".mBoardRestore", bno);
		}
		
		 // board A.I 초기화 
		public int aiRefresh() { 
			return sqlsession.update(namespace + ".aiRefresh"); }

	
	
	////////////////////////////////학생
	

	
	
	
	
	
	
	
	
	
}
