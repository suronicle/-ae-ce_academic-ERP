package kr.co.dong.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;

	@Override
	public List<BoardDTO> boardList() {

		return boardDAO.boardList();
	}

	@Override
	public BoardDTO boardDetail(int boardNum) {

		return boardDAO.boardDetail(boardNum);
	}

	@Override
	public List<BoardDTO> boardTeaList() {

		return boardDAO.boardTeaList();
	}

	@Override
	public BoardDTO registerUser(String userId) {

		return boardDAO.registerUser(userId);
	}

	@Override
	public int boardRegister(BoardDTO boardDTO) {

		return boardDAO.boardRegister(boardDTO);
	}

	@Override
	public int updateCount(int boardNum) {

		return boardDAO.updateCount(boardNum);
	}

	@Override
	public BoardDTO selectOne(int boardNum) {

		return boardDAO.selectOne(boardNum);
	}

	@Override
	public int editBoard(BoardDTO boardDTO) {

		return boardDAO.editBoard(boardDTO);
	}

	@Override
	public int delBoard(int boardNum) {

		return boardDAO.delBoard(boardNum);
	}

	@Override
	public List<BoardDTO> boardStuList() {

		return boardDAO.boardStuList();
	}




	/////////////////////////////////관리자 

	// board 미리보기
		public List<BoardDTO> board() throws Exception {
			return boardDAO.board();
		}
		// nBoard 리스트
		public List<BoardDTO> mNBoard() throws Exception {
			return boardDAO.mNBoard();
		}
		// mTBoards 리스트
		public List<BoardDTO> mTBoard() throws Exception {
			return boardDAO.mTBoard();
		}
		// mSBoard 리스트
		public List<BoardDTO> mSBoard() throws Exception {
			return boardDAO.mSBoard();
		}
		// mBoardRecycle 리스트
		public List<BoardDTO> mBoardRecycle() throws Exception {
			return boardDAO.mBoardRecycle();
		}
		// mBoardDetail 상세보기
		public BoardDTO mBoardDetail(int bno) throws Exception {
			return boardDAO.mBoardDetail(bno);
		}
		// mBoardRegister 신규작성
		public int mBoardRegister(BoardDTO dto) throws Exception {
			return boardDAO.mBoardRegister(dto);
		}
		// board user 값 가져오기
		public BoardDTO boardUser(String userId) throws Exception {
			return boardDAO.boardUser(userId);
		}
		// mBoardEdit 수정
		public int mBoardEdit(BoardDTO dto) throws Exception {
			return boardDAO.mBoardEdit(dto);
		}
		// board 삭제
		public int mBoardDelete(int bno) throws Exception {
			return boardDAO.mBoardDelete(bno);
		}
		// board 삭제
		public int mBoardRecycleDelete(int bno) throws Exception {
			return boardDAO.mBoardRecycleDelete(bno);
		}
		// board 조회수증가
		public int boardCount(int bno) throws Exception {
			return boardDAO.boardCount(bno);
		}
		// board 휴지통 복구
		public int mBoardRestore(int bno) throws Exception {
			return boardDAO.mBoardRestore(bno);
		}
		// board A.I 초기화 
		public int aiRefresh() throws Exception { 
			return boardDAO.aiRefresh(); 
		} 




	////////////////////////////////학생









}
