package kr.co.dong.teacher;

import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class TeacherController {


	@Autowired
	TeacherService service;



	@RequestMapping(value = "/project/tPInfo", method = RequestMethod.GET)
	public ModelAndView tPInfo(@RequestParam("userId") String userId) throws Exception{
		ModelAndView mav = new ModelAndView();

		List<TeacherDTO> teacher = service.lectureList(userId);
		mav.addObject("lecture", teacher);
		mav.setViewName("tPInfo");
		System.out.println(mav);
		return mav;
	}


	@RequestMapping(value = "/project/tSInfo", method = RequestMethod.GET)
	public ModelAndView tSInfo(@RequestParam("lectureNum") int lectureNum, @RequestParam("userId") String userId, TeacherDTO teacherDTO ,@RequestParam(value = "aDate", required = false) String aDate, Model model) throws Exception{

		ModelAndView mav = new ModelAndView();

		List<TeacherDTO> student = service.studentList(teacherDTO);

		TeacherDTO teacher = service.userTeacher(userId);

		//강의번호
		String lecture =service.lectureName(lectureNum);

		//강의별 학생 리스트
		List<TeacherDTO> studentOne=service.studentListOne(lectureNum);

		//학생수
		int r = service.studentCount(lectureNum);

		//직책 번호
		String admin = service.adminNumber(userId);

		mav.addObject("admin",admin);

		mav.addObject("student", student);


		//강사 정보
		mav.addObject("teacher", teacher);

		//강의 정보
		mav.addObject("lecture",lecture);

		//강의별 학생 리스트
		mav.addObject("studentOne",studentOne);

		//학생수
		mav.addObject("studentCount",r);

		mav.setViewName("tSInfo");
		if (aDate == null || aDate.trim().isEmpty()) {
			System.out.println("날짜 값이 없어");
		} else {
			System.out.println("값이 있긴 해");
			System.out.println(aDate);
			List<TeacherDTO> search = service.sSearchDateList(teacherDTO);
			mav.addObject("student", search);
		}


		System.out.println(mav);
		return mav;
	}







	@RequestMapping(value="/project/tAttend",method = RequestMethod.GET)
	public ModelAndView tAttend(@RequestParam("userId") String userId, @RequestParam(value = "aDate", required = false) String aDate,@RequestParam(value = "aAttend", required = false) String aAttend, TeacherDTO teacherDTO, Model model) throws Exception {

		ModelAndView mav = new ModelAndView();

		List<TeacherDTO> attendlist = service.tAttendList(userId);
		int a = service.annCount(userId);
		int h = service.halfCount(userId);

		mav.addObject("ann", a);
		mav.addObject("half", h);
		mav.addObject("attendlist", attendlist);
		System.out.println(aAttend);
		
		if (aDate == null || aDate.trim().isEmpty()) {

		} else {

			teacherDTO.setaDate(aDate);
			TeacherDTO attend = service.attendOne(teacherDTO);
			mav.addObject("attend", attend);
			
			
		}

		if (aAttend == null || aAttend.trim().isEmpty()) {

		} else {
			System.out.println(aAttend);
		
			List<TeacherDTO> attendSearch = service.tAttendSearch(teacherDTO);
			mav.addObject("attendlist", attendSearch);
			
		}
		int c = service.cCount(userId);
		int d= service.dCount(userId);
		int n= service.nCount(userId);

		mav.addObject("con", c);
		mav.addObject("den", d);
		mav.addObject("notc", n);

		mav.setViewName("tAttend");
		return mav;
	}


	@RequestMapping(value="/attendTrash", method = RequestMethod.POST)
	public String attendTrash(@RequestParam("userId")String userId,TeacherDTO teacherDTO, HttpServletRequest req, Model model) throws Exception{
		
		String buttonId = req.getParameter("btnA");
		//버튼 value값
		System.out.println(buttonId);
		System.out.println(userId);
		
		
		model.addAttribute("msg", "개발중");
		model.addAttribute("url", "/project/tAttend?userId="+userId);
		
		return "alert";
	}

	
	
	@RequestMapping(value="/project/tAttendList", method=RequestMethod.GET)
	public ModelAndView aAttendList(@RequestParam("userId")String userId,@RequestParam("pId")String pId,TeacherDTO teacherDTO )throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<TeacherDTO> attendlists = service.tAttendLists(teacherDTO);
		mav.addObject("attendlists", attendlists);
		mav.setViewName("tAttendList");
		
		return mav;
	}
	

	@RequestMapping(value="/tAttendRegister", method = RequestMethod.POST)
	public String aAttendRegister(TeacherDTO teacherDTO, Model model, HttpServletRequest req) throws Exception{



		String userId = teacherDTO.getaId();
		int attendNum = teacherDTO.getaAttend();

		String buttonId = req.getParameter("btn");
		String pName = req.getParameter("confirmName");

		System.out.println(userId);
		//버튼 value값
		System.out.println(buttonId);



		TeacherDTO attendDate = service.aDateCheck(teacherDTO);

		//연차 반차 수정
		if(buttonId.equals("write")) {
			if(!pName.equals("승인")) {
				int r = service.attendSet(teacherDTO);
				model.addAttribute("msg",  "수정 완료되었습니다. 근태수량은 관리자에게 문의하세요.");
				model.addAttribute("url", "/project/tAttend?userId="+userId);
				return "alert";
			}
			else {
				model.addAttribute("msg",  "이미 승인 처리되어있습니다. 수정 불가합니다.");
				model.addAttribute("url", "/project/tAttend?userId="+userId);
				return "alert";
			}
		}
		else if(buttonId.equals("save")) {
			if(attendDate!=null) {
				model.addAttribute("msg", "이미 등록된 날짜입니다. 다른 날짜를 선택해주세요.");
				model.addAttribute("url", "/project/tAttend?userId="+userId);

				return "alert";
			}
			else {
				//연차일때
				if(attendNum==4) {
					System.out.println("연차");
					//연차수가 0일때

					if(service.annCount(userId)==0) {
						model.addAttribute("msg", "사용할 수 있는 연차가 없습니다.");
						model.addAttribute("url", "/project/tAttend?userId="+userId);
						return "alert";
					}
					else {

						// 연차가 있으니까 등록
						int r = service.tAttendRegister(teacherDTO);

					}

				}

				//반차일때
				else if(attendNum==5) {
					System.out.println("반차");

					if(service.halfCount(userId)==0) {
						model.addAttribute("msg", "사용할 수 있는 반차가 없습니다.");
						model.addAttribute("url", "/project/tAttend?userId="+userId);
						return "alert";
					}
					else {
						//반차 남음
						// 등록

						int r = service.tAttendRegister(teacherDTO);



					}	

				} //조건문 끝 (반차, 연차 카운트)
			}


			model.addAttribute("msg", "제출 완료되었습니다.");
			model.addAttribute("url", "/project/tAttend?userId="+userId);

			return "alert";
		}

		else if(buttonId.equals("delete")) {
			int del = service.attendDel(teacherDTO);
			System.out.println("삭제");
			model.addAttribute("msg", "삭제되었습니다. 근태 수량은 관리자에게 문의하세요");
			model.addAttribute("url", "/project/tAttend?userId="+userId);
			return "alert";

		}



		return "redirect:/project/tAttend?userId="+userId;
	}


	@RequestMapping(value = "/project/tStudentManagement", method = RequestMethod.GET)
	public String tStudentManagement(@RequestParam("lectureNum")int lectureNum, @RequestParam("userId")String userId, TeacherDTO teacherDTO, Model model,HttpServletRequest req)throws Exception{


		TeacherDTO student = service.studentInfo(teacherDTO);
		model.addAttribute("student", student);


		return "tStudentManagement";
	}

	@RequestMapping(value = "/tStudentDelete", method = RequestMethod.POST)
	public String tStudentManagement(TeacherDTO teacherDTO,HttpServletRequest req, Model model)throws Exception{

		String buttonId = req.getParameter("btn");
		String userId = teacherDTO.getUserId();
		int lectureNum = teacherDTO.getLectureNum();

		System.out.println(userId);
		System.out.println(lectureNum);
		if(buttonId.equals("cancel")) {
			int r = service.studentDelete(teacherDTO);
			model.addAttribute("msg", "취소되었습니다.");

		}

		return "alert";
	}


	@RequestMapping(value="/project/tCalendar", method = RequestMethod.GET)
	public String tCalendar() throws Exception{
		return "tCalendar";
	}


	@RequestMapping(value="/project/calendar", method = RequestMethod.GET)
	public String calendar() throws Exception{
		return "calendar";
	}


}
