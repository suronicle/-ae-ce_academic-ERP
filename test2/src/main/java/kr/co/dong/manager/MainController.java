package kr.co.dong.manager;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;





@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired MainService service;
	 

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "mhome";
	}
	

	@RequestMapping(value = "/attenList", method = RequestMethod.GET)
	public ModelAndView attenList() throws Exception {

		ModelAndView mav = new ModelAndView();
		List<MainDTO> attenList = service.attenList();
		mav.addObject("mattenList", attenList);
		mav.setViewName("mattenList");
		return mav;
		 
	}

	@RequestMapping(value = "/lesson", method = RequestMethod.GET)
	public ModelAndView lesson() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		List<MainDTO> lessonList = service.lessonList();
		mav.addObject("mlessonList", lessonList);
		mav.setViewName("mlessonList");
		return mav;
	}
	
	@RequestMapping(value = "/lessonDetail", method = RequestMethod.GET)
	public String lessonDetail(@RequestParam("lectureNum") int bno, @RequestParam Map<String, Object> map, Model model) throws Exception {
		MainDTO lessonDetail = service.lessonDetail(bno);
		model.addAttribute("mlessonDetail", lessonDetail);
		return "mlessonDetail";
	}
	
	@RequestMapping(value = "/lessonUpdate", method = RequestMethod.GET)
	public String lessonUpdate(@RequestParam("lectureNum") int bno,  Model model) throws Exception {
		MainDTO dto = service.lessonDetail(bno);
		List<MainDTO> teacherFind = service.teacherFind();
		model.addAttribute("teacherFind", teacherFind);
		model.addAttribute("mlessonUpdate", dto);
		return "mlessonUpdate";
		
	}
	
	@RequestMapping(value = "/lessonUpdate", method = RequestMethod.POST)
	public String update(MainDTO dto, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("utf-8");
		
		if(req.getParameter("lectureName").equals("")) {
			rttr.addFlashAttribute("msg", "등록을 실패했습니다. 강의 명을 입력해주세요.");
			return "redirect:lessonUpdate?lectureNum=" + dto.getLectureNum();
		} 
		else if(req.getParameter("lectureDateStart").equals("")) {
			rttr.addFlashAttribute("msg", "등록을 실패했습니다. 개강 날짜를 입력해주세요.");
			return "redirect:lessonUpdate?lectureNum=" + dto.getLectureNum();
		}
		else if(req.getParameter("lectureDateEnd").equals("")) {
			rttr.addFlashAttribute("msg", "등록을 실패했습니다. 종강 날짜를 입력해주세요.");
			return "redirect:lessonUpdate?lectureNum=" + dto.getLectureNum();
		} 
		else if(req.getParameter("lectureContent").equals("")) {
			rttr.addFlashAttribute("msg", "등록을 실패했습니다. 강의 내용을 입력해주세요.");
			return "redirect:lessonUpdate?lectureNum=" + dto.getLectureNum();
		}
		System.out.println(req.getParameter("userId") + "!!!!!!!!!!!!!!");
		int r = service.lessonUpdate(dto);
		if(r>0) {
			rttr.addFlashAttribute("msg", "수정이 완료되었습니다.");
			return "redirect:lesson";
		}
		rttr.addFlashAttribute("msg", "수정을 실패했습니다. 담당 강사를 확인해주세요.");
		return "redirect:lessonUpdate?lectureNum=" + dto.getLectureNum();
	}
	
	
	@RequestMapping(value = "/lessonInsert", method = RequestMethod.GET)
	public ModelAndView insert() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		List<MainDTO> teacherFind = service.teacherFind();
		mav.addObject("teacherFind", teacherFind);
		mav.setViewName("mlessonInsert");
		return mav;

	}
	
	
	@RequestMapping(value = "/lessonInsert", method = RequestMethod.POST)
	public String insert(MainDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		req.setCharacterEncoding("utf-8");
		
		if(req.getParameter("lectureName").equals("")) {
			rttr.addFlashAttribute("msg", "등록을 실패했습니다. 강의 명을 입력해주세요.");
			return "redirect:lessonInsert";
		} 
		else if(req.getParameter("lectureDateStart").equals("")) {
			rttr.addFlashAttribute("msg", "등록을 실패했습니다. 개강 날짜를 입력해주세요.");
			return "redirect:lessonInsert";
		}
		else if(req.getParameter("lectureDateEnd").equals("")) {
			rttr.addFlashAttribute("msg", "등록을 실패했습니다. 종강 날짜를 입력해주세요.");
			return "redirect:lessonInsert";
		} 
		else if(req.getParameter("lectureContent").equals("")) {
			rttr.addFlashAttribute("msg", "등록을 실패했습니다. 강의 내용을 입력해주세요.");
			return "redirect:lessonInsert";
		}
		int n = service.lessonDetail2(req.getParameter("lectureNum"));
		if(n == 0) {
			int r = service.lessonInsert(dto);
			if(r>0) {

				/* service.lessonTeacher(dto); */
				rttr.addFlashAttribute("msg", "등록이 완료되었습니다.");
				service.lessonInsert2(dto);
				return "redirect:lesson";
			}
			
			rttr.addFlashAttribute("msg", "등록을 실패했습니다. 다시 시도해주세요.");
			return "redirect:lesson";
			
		} else {
			rttr.addFlashAttribute("msg", "등록을 실패했습니다. 중복된 강의 번호입니다.");
			return "redirect:lessonInsert";
		}
		

	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("lectureNum") int bno, RedirectAttributes rttr) throws Exception {
		int r = service.lessonDelete(bno);

		if(r>0) {
			rttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
			return "redirect:lesson";
		}
		return "redirect:lessonUpdate?lectureNum=" + bno;
	}
	
	
	@RequestMapping(value = "/attenDetail", method = RequestMethod.GET)
	public String attenDetail(@RequestParam("aId") String bno, @RequestParam("aDate") String bno2, @RequestParam Map<String, Object> map, Model model) throws Exception {
		MainDTO dto = service.attenDetail(bno, bno2);
		
		model.addAttribute("mattenDetail", dto);
		return "mattenDetail";
	}
	
	@RequestMapping(value = "/attenUpdate", method = RequestMethod.GET)
	public String allow(MainDTO dto, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
		
		req.setCharacterEncoding("utf-8");

		int r = service.attenUpdate(dto);
		
		if(r>0) {
			rttr.addFlashAttribute("msg", "승인이 완료되었습니다.");
			service.attenDbUpdate(dto);
			service.attenAbsCheck(dto);
			service.attenAnnUpdate(dto);
			return "redirect:attenList";
		}
		
		return "redirect:attenDetail?aId=" + dto.getaId() + "&aDate=" + dto.getaDate();	
	}
	
	@RequestMapping(value = "/attenDeny", method = RequestMethod.GET)
	public String attenDeny(@RequestParam("aId") String bno, @RequestParam("aDate") String bno2, @RequestParam Map<String, Object> map, Model model) throws Exception {
		MainDTO dto = service.attenDetail(bno, bno2);
		model.addAttribute("mattenDeny", dto);
		return "mattenDeny";

	}
	
	@RequestMapping(value = "/attenDeny", method = RequestMethod.POST)
	public String attenDeny(MainDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		req.setCharacterEncoding("utf-8");
		int r = service.attenDeny(dto);
		if(r>0) {
			rttr.addFlashAttribute("msg", "반려가 완료되었습니다.");
			return "redirect:attenList";
		}
		
		rttr.addFlashAttribute("msg", "반려를 실패했습니다. 다시 시도해주세요.");
		return "redirect:attenList";
		
	}
	
	@RequestMapping(value = "/serchList", method = RequestMethod.GET)
	public ModelAndView serchList(Model model,  @RequestParam(value = "serachField",required = false, defaultValue = "") String serachField,
		    @RequestParam(value = "serachText",required = false, defaultValue = "") String serachText) throws Exception {
		
		switch (serachText) {
		
		case "미출석": serachText = "0";
		break;
		
		case "출석": serachText = "1";
		break;
		
		case "지각": serachText = "2";
			break;
			
		case "조퇴": serachText = "3";
		break;
		
		case "연차": serachText = "4";
		break;
		
		case "반차": serachText = "5";
		break;
		
		case "결석": serachText = "6";
		break;
		
		case "미승인": serachText = "100";
		break;
		
		case "승인": serachText = "101";
		break;
		
		case "반려" : serachText = "102";
		break;

		default:
			break;
		}
		
		List<MainDTO> list = service.serchList(serachField, serachText);
		ModelAndView mav = new ModelAndView();
		mav.addObject("serchList", list);
		mav.setViewName("serchList");
		return mav;
	}
	
	@RequestMapping(value = "/mlessonRecycleList", method = RequestMethod.GET)
	public ModelAndView mlessonrecycleList() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		List<MainDTO> mlessonRecycleList = service.mlessonRecycleList();
		mav.addObject("mlessonRecycleList", mlessonRecycleList);
		mav.setViewName("mlessonRecycleList");
		return mav;
	}
	
	@RequestMapping(value = "/recycleDelete", method = RequestMethod.GET)
	public String recycleDelete(@RequestParam("lectureNum") int bno, RedirectAttributes rttr) throws Exception {
		int r = service.recycleDelete(bno);

		if(r>0) {
			rttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
			return "redirect:mlessonRecycleList";
		}
		return "redirect:mlessonDetail?lectureNum=" + bno;
	}
	
	@RequestMapping(value = "/recycleDelete2", method = RequestMethod.POST)
	public String recycleDelete2(@RequestParam("RowCheck") int[] rc, RedirectAttributes rttr) throws Exception {
		
		for(int i = 0; i < rc.length; i++) {
			service.recycleDelete(rc[i]);
		}
		rttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
		return "redirect:mlessonRecycleList";
		
	}	
	
	 @RequestMapping(value = "/lessonRestore", method = RequestMethod.GET)
		public String lessonRestore(@RequestParam("lectureNum") int bno, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
			req.setCharacterEncoding("utf-8");
			
			int r = service.lessonRestore(bno);
			
			if(r>0) {
				rttr.addFlashAttribute("msg", "복구가 완료되었습니다.");
					return "redirect:/mlessonRecycleList";
			} 
				
			 else {
				rttr.addFlashAttribute("msg", "복구를 실패했습니다.");
				return "redirect:/mlessonDetail?lectureNum=" + bno;
				}
		}
}
