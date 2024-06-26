package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	

	///////////////////////////////////////////////게시판
	
	@RequestMapping(value = "/project/board", method = RequestMethod.GET)
	public ModelAndView board(@RequestParam("userId")String userId)throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<BoardDTO> boardN = service.boardList();
		mav.addObject("boardN", boardN);
		
		List<BoardDTO> boardT = service.boardTeaList();
		mav.addObject("boardT",boardT);
		
		List<BoardDTO> boardS = service.boardStuList();
		mav.addObject("boardS",boardS);
		
		//로그인 되어있는 user정보
		BoardDTO user = service.registerUser(userId);
		mav.addObject("user", user);
		
		mav.setViewName("board");
		
		return mav;
	}
	

	@RequestMapping(value = "/project/tBoard", method = RequestMethod.GET)
	public ModelAndView tBoard(@RequestParam("userId")String userId)throws Exception{
		ModelAndView mav = new ModelAndView();
		

		List<BoardDTO> boardT = service.boardTeaList();
		mav.addObject("boardT",boardT);
		
		BoardDTO user = service.registerUser(userId);
		mav.addObject("user", user);
		
		mav.setViewName("tBoard");
		
		return mav;
	}
	
	@RequestMapping(value = "/project/nBoard", method = RequestMethod.GET)
	public ModelAndView nBoard(@RequestParam("userId")String userId)throws Exception{
		ModelAndView mav = new ModelAndView();
		

		List<BoardDTO> boardN = service.boardList();
		mav.addObject("boardN",boardN);
		
		BoardDTO user = service.registerUser(userId);
		mav.addObject("user", user);
		
		mav.setViewName("nBoard");
		
		return mav;
	}

	

	@RequestMapping(value = "/project/boardDetail", method = RequestMethod.GET)
	public String boardDetail(@RequestParam("boardNum")int boardNum,@RequestParam("userId")String userId,Model model,BoardDTO boardDTO)throws Exception{

		BoardDTO board = service.boardDetail(boardNum);
		model.addAttribute("board", board);
		int r = service.updateCount(boardNum);
		return "boardDetail";
	}
	
	
	@RequestMapping(value = "/project/boardRegister", method = RequestMethod.GET)
	public ModelAndView boardRegister(@RequestParam("userId")String userId)throws Exception{
		ModelAndView mav = new ModelAndView();
		
		BoardDTO user = service.registerUser(userId);
		mav.addObject("user", user);
		
		mav.setViewName("boardRegister");
		
		return mav;
	}


	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@RequestParam("boardUserId")String boardUserId, BoardDTO boardDTO, Model model)throws Exception{
		
	
		int r = service.boardRegister(boardDTO);
		
		model.addAttribute("msg", "등록되었습니다.");
		model.addAttribute("url","project/board?userId="+boardUserId);
		
		return "alert";
	}
	
	
	@RequestMapping(value = "/project/boardEdit", method = RequestMethod.GET)
	public ModelAndView boardEdit(@RequestParam("boardNum")int boardNum,@RequestParam("userId")String userId, Model model,BoardDTO boardDTO)throws Exception{
		ModelAndView mav = new ModelAndView();

		BoardDTO board = service.selectOne(boardNum);
		mav.addObject("board",board);
		mav.setViewName("boardEdit");
		
		return mav;
	}
	
	@RequestMapping(value = "/boardEdit", method = RequestMethod.POST)
	public String boardEdit(Model model,BoardDTO boardDTO)throws Exception{
		

		int r = service.editBoard(boardDTO);
		int boardNum=boardDTO.getBoardNum();
		String userId = boardDTO.getBoardUserId();
		model.addAttribute("msg","수정 완료되었습니다.");
		model.addAttribute("url", "/project/boardDetail?boardNum="+boardNum+"&userId="+userId);
		
		
		return "alert";
	}
	
	
	@RequestMapping(value = "/boardDel", method = RequestMethod.POST)
	public String boardDel(Model model,BoardDTO boardDTO)throws Exception{
		int boardNum=boardDTO.getBoardNum();
		String userId = boardDTO.getBoardUserId();
		
		int r = service.delBoard(boardNum);
		model.addAttribute("msg","삭제되었습니다.");
		model.addAttribute("url", "/project/board?userId="+userId);
		
		return "alert";
	}
	
	
	
	/////////////////////////////////관리자 게시판
	@RequestMapping(value = "/mBoard", method = RequestMethod.GET)
	public ModelAndView mBoard() throws Exception {

		ModelAndView mav = new ModelAndView();
		List<BoardDTO> nBoard = service.mNBoard();
		List<BoardDTO> sBoard = service.mSBoard();
		List<BoardDTO> tBoard = service.mTBoard();
		mav.addObject("nBoard", nBoard);
		mav.addObject("sBoard", sBoard);
		mav.addObject("tBoard", tBoard);
		mav.setViewName("mBoard");
		return mav;
		 
	}
	
	@RequestMapping(value = "/mNBoard", method = RequestMethod.GET)
	public ModelAndView mNBoard() throws Exception {

		ModelAndView mav = new ModelAndView();
		List<BoardDTO> boardN = service.mNBoard();
		mav.addObject("boardN", boardN);
		mav.setViewName("mNBoard");
		return mav;
		 
	}
	
	@RequestMapping(value = "/mTBoard", method = RequestMethod.GET)
	public ModelAndView mTBoard() throws Exception {

		ModelAndView mav = new ModelAndView();
		List<BoardDTO> boardT = service.mTBoard();
		mav.addObject("boardT", boardT);
		mav.setViewName("mTBoard");
		return mav;
		 
	}
	
	@RequestMapping(value = "/mSBoard", method = RequestMethod.GET)
	public ModelAndView mSBoard() throws Exception {

		ModelAndView mav = new ModelAndView();
		List<BoardDTO> mSBoard = service.mSBoard();
		mav.addObject("mSBoard", mSBoard);
		mav.setViewName("mSBoard");
		return mav;
		 
	}
	
	@RequestMapping(value = "/mBoardRecycle", method = RequestMethod.GET)
	public ModelAndView mBoardRecycle() throws Exception {

		ModelAndView mav = new ModelAndView();
		List<BoardDTO> mBoardRecycle = service.mBoardRecycle();
		mav.addObject("mBoardRecycle", mBoardRecycle);
		mav.setViewName("mBoardRecycle");
		return mav;
		 
	}
	
	
	@RequestMapping(value = "/mBoardDetail", method = RequestMethod.GET)
	public String mBoardDetail(@RequestParam("boardNum") int bno, @RequestParam Map<String, Object> map, Model model) throws Exception {
		BoardDTO boardDetail = service.mBoardDetail(bno);
		service.boardCount(bno);
		model.addAttribute("boardDetail", boardDetail);
		return "mBoardDetail";
	}
	
	 @RequestMapping(value = "/mBoardRegister", method = RequestMethod.GET) 
	  public ModelAndView boardUser(@RequestParam("userId")String userId) throws Exception {
	  
	  ModelAndView mav = new ModelAndView(); 
	  BoardDTO boardUser = service.boardUser(userId);
	  mav.addObject("boardUser", boardUser);
	  mav.setViewName("mBoardRegister");
	  return mav;
	  
	  }
	 
	 @RequestMapping(value = "/mBoardRegister", method = RequestMethod.POST)
		public String mBoardRegister(BoardDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
			req.setCharacterEncoding("utf-8");
			int r = service.mBoardRegister(dto);
			if(r>0) {
				rttr.addFlashAttribute("msg", "작성이 완료되었습니다.");
				return "redirect:/mNBoard?userId=" + dto.getBoardUserId();
			} else {
				return "redirect:/mBoardRegister?userId=" + dto.getBoardUserId();
			}
			
		}
	 
	 @RequestMapping(value = "/mBoardEdit", method = RequestMethod.GET)
		public String mBoardEdit(@RequestParam("boardNum") int bno, @RequestParam Map<String, Object> map, Model model) throws Exception {
			BoardDTO boardEdit = service.mBoardDetail(bno);
			model.addAttribute("boardEdit", boardEdit);
			return "mBoardEdit";
		}
	 
	 @RequestMapping(value = "/mBoardEdit", method = RequestMethod.POST)
		public String mBoardEdit(BoardDTO dto, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
			req.setCharacterEncoding("utf-8");
			System.out.println(req.getParameter("boardId"));

			
			if(!((req.getParameter("idCheck")).equals(req.getParameter("boardUserId")))) {
				rttr.addFlashAttribute("msg", "작성자가 아니면 수정 할 수 없습니다.");
				return "redirect:/mBoardEdit?boardNum=" + dto.getBoardNum();
			} else if(req.getParameter("idCheck").equals(req.getParameter("boardUserId"))) {
			
			int r = service.mBoardEdit(dto);
			
			if(r>0) {
				rttr.addFlashAttribute("msg", "수정이 완료되었습니다.");
				if(req.getParameter("boardId").equals("공지사항")) {
					return "redirect:/mNBoard?userId=" + dto.getBoardUserId();
				} else if(req.getParameter("boardId").equals("강사용")) {
					return "redirect:/mTBoard?userId=" + dto.getBoardUserId();
				} else if(req.getParameter("boardId").equals("학생용")) {
					return "redirect:/mSBoard?userId=" + dto.getBoardUserId();
				}
				
			} 
				
			} else {
				
				return "redirect:/mBoardEdit?boardNum=" + dto.getBoardNum();
			}
			return null; 

		}
	 
	 @RequestMapping(value = "/mBoardDelete", method = RequestMethod.GET)
		public String boardDelete(@RequestParam("boardNum") int bno, @RequestParam("userId") String userId, @RequestParam("boardId") String boardId, RedirectAttributes rttr) throws Exception {
			
		 	int r = service.mBoardDelete(bno);
		 	

			if(r>0) {
				rttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
				if(boardId.equals("203")) {
					return "redirect:/mNBoard?userId=" + userId;
				} else if(boardId.equals("202")) {
					return "redirect:/mTBoard?userId=" + userId;
				} else if(boardId.equals("201")) {
					return "redirect:/mSBoard?userId=" + userId;
				}
				
			}
			return "redirect:/mBoard?userId=" + userId;
		}
	 
	 @RequestMapping(value = "/mBoardRecycleDelete", method = RequestMethod.GET)
		public String mBoardRecycleDelete(@RequestParam("boardNum") int bno, @RequestParam("userId") String userId, @RequestParam("boardId") String boardId, RedirectAttributes rttr) throws Exception {
			
		 	int r = service.mBoardRecycleDelete(bno);

			if(r>0) {
				rttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
				service.aiRefresh();
				return "redirect:/mBoardRecycle?userId=" + userId;
			}
			return "redirect:/mBoard?userId=" + userId;
		}
	 
	 @RequestMapping(value = "/mBoardRestore", method = RequestMethod.GET)
		public String mBoardRestore(@RequestParam("boardNum") int bno, @RequestParam("userId") String userId, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
			req.setCharacterEncoding("utf-8");
			
			int r = service.mBoardRestore(bno);
			
			if(r>0) {
				rttr.addFlashAttribute("msg", "복구가 완료되었습니다.");
					return "redirect:/mBoardRecycle?userId=" + userId;
			} 
				
			 else {
				rttr.addFlashAttribute("msg", "복구를 실패했습니다.");
				return "redirect:/mBoardDetail?boardNum=" + bno + "&userId=" + userId;
				}
		}
	 
	 @RequestMapping(value = "/mBoardRecycleDelete2", method = RequestMethod.POST)
		public String mBoardRecycleDelete2(@RequestParam("RowCheck") int[] rc, @RequestParam("userId") String userId, RedirectAttributes rttr) throws Exception {
			for(int i = 0; i < rc.length; i++) {
		 	service.mBoardRecycleDelete(rc[i]);
			}
				rttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
				service.aiRefresh();
				return "redirect:/mBoardRecycle?userId=" + userId;
		}



	
	
	////////////////////////////////학생
	
	
	 //학생게시판 리스트
	 @RequestMapping(value = "project/sBoard", method = RequestMethod.GET)
	 public ModelAndView sBoard(@RequestParam("userId")String userId) throws Exception{

		 ModelAndView mav = new ModelAndView();

		 List<BoardDTO> boardS = service.boardStuList();
		 mav.addObject("boardS",boardS);
		 mav.setViewName("sBoard");
		 
		 return mav;
	 }

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
