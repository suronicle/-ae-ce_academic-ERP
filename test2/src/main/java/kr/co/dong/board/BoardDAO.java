package kr.co.dong.board;

import java.util.List;



public interface BoardDAO {


	//////////////////////////////////////////////////강사

	//공지사항 게시판 리스트
	public List<BoardDTO> boardList();

	//강사글 게시판 리스트
	public List<BoardDTO> boardTeaList();

	//학생 게시판 리스트
	public List<BoardDTO> boardStuList();

	//게시글 상세
	public BoardDTO boardDetail(int boardNum);	

	//작성자 정보
	public BoardDTO registerUser(String userId);

	//게시판 등록
	public int boardRegister(BoardDTO boardDTO);

	//조회수 증가
	public int updateCount(int boardNum);

	//게시글 한개의 상세조회
	public BoardDTO selectOne(int boardNum);

	//게시글 수정
	public int editBoard(BoardDTO boardDTO);	

	//게시글 삭제
	public int delBoard(int boardNum);



	/////////////////////////////////관리자 

	// board 미리보기
		public List<BoardDTO> board() throws Exception;
		
		// mNBoard 리스트
		public List<BoardDTO> mNBoard() throws Exception;
		
		// mTBoard 리스트
		public List<BoardDTO> mTBoard() throws Exception;
		
		// mSBoard 리스트
		public List<BoardDTO> mSBoard() throws Exception;
		
		// 휴지통 리스트
		public List<BoardDTO> mBoardRecycle() throws Exception;
		
		// mBoardDetail 상세보기
		public BoardDTO mBoardDetail(int bno) throws Exception;
		
		// mBoardRegister 신규작성
		public int mBoardRegister(BoardDTO dto) throws Exception;
		
		// board user 값 가져오기
		public BoardDTO boardUser(String userId) throws Exception;
		
		// mBoardEdit 수정
		public int mBoardEdit(BoardDTO dto) throws Exception;
		
		// board 삭제
		public int mBoardDelete(int bno) throws Exception;
		
		// board db삭제
		public int mBoardRecycleDelete(int bno) throws Exception;
		
		// board 조회수증가
		public int boardCount(int bno) throws Exception;
		
		// board 휴지통 복구
		public int mBoardRestore(int bno) throws Exception;

		//board A.I 초기화
		public int aiRefresh() throws Exception;




	////////////////////////////////학생

	


}
