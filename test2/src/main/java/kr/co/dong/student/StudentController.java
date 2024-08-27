package kr.co.dong.student;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class StudentController {


	@Autowired
	StudentService service;


	//전체출결확인
	@RequestMapping(value = "project/sAttendance" , method = RequestMethod.GET)
	public ModelAndView sAttendance(@RequestParam("userId")String userId,
			@RequestParam(value  = "aNum", required = false)Integer aNum,
			StudentDTO dto,Model model) throws Exception {


		ModelAndView mav = new ModelAndView();

		System.out.println(aNum);

		if (aNum == null || aNum == 500) {
			List<StudentDTO> attendance = service.attendance(userId);
			mav.addObject("attendance",attendance);
			mav.setViewName("sAttendance");
		}else {
			if(aNum !=null) {
				List<StudentDTO> attendanceSelect = service.attendanceSelect(dto);
				mav.addObject("attendance",attendanceSelect);
				mav.setViewName("sAttendance");
			}
		}

		int con = service.con(userId);
		int notc = service.notc(userId);
		int den = service.den(userId);

		int abs = service.abs(userId);
		int late  = service.late(userId);
		int early = service.ealry(userId);

		model.addAttribute("abs",abs);
		model.addAttribute("late",late);
		model.addAttribute("ealry",early);

		model.addAttribute("con",con);
		model.addAttribute("notc",notc);
		model.addAttribute("den",den);

		return mav;
	}


	//강의정보
	@RequestMapping(value = "project/sInformation" , method = RequestMethod.GET)
	public ModelAndView sInformation(@RequestParam("userId")String userId,Model model) throws Exception{

		ModelAndView mav = new ModelAndView();

		List<StudentDTO> information = service.information(userId);
		mav.addObject("information",information);
		mav.setViewName("sInformation");


		return mav;
	}
	//강의 등록
	@RequestMapping(value = "project/sInforRegister", method = RequestMethod.GET)
	public ModelAndView sInforRegister(@RequestParam("userId")String userId) throws Exception{

		StudentDTO dto = new StudentDTO();
		List<StudentDTO> sInforRegister =service.selectLecture(dto);
		ModelAndView mav = new ModelAndView();

		mav.addObject("sInforRegister",sInforRegister);
		mav.setViewName("sInforRegister");
		return mav;
	}

	@RequestMapping(value = "/sInforRegister" ,method = RequestMethod.POST)
	public String sInforRegister(@RequestParam(name = "lectureNum", required = false)int[] lectureNums,
			@RequestParam(name = "userId") String userId,HttpServletRequest req)  throws Exception{


		List<StudentDTO> selectedLectures = service.information(userId);

		if (lectureNums == null) {
			req.setAttribute("msg", "선택된 강의가 없습니다.");
			req.setAttribute("url","project/sInforRegister?userId=" + userId);
			return "alert";
		}

		List<Integer> selectedUlNums = new ArrayList<>();

		for (StudentDTO lecture : selectedLectures) {
			selectedUlNums.add(lecture.getUlNum());
		}


		if (lectureNums != null) {
			for (int lectureNum : lectureNums) {
				StudentDTO dto = new StudentDTO();
				dto.setLectureNum(lectureNum);
				dto.setuId(userId);

				for(int i=0;i<lectureNums.length;i++) {
					if(lectureNum == lectureNums[i]) {
						dto.setUlNum(lectureNum);
						req.setAttribute("msg","강의가 등록되었습니다.");
						req.setAttribute("url", "project/sInformation?userId=" + userId);
					}
				}

				if (selectedUlNums.contains(dto.getUlNum())) {
					// 중복이 발생하면 알림을 띄움.
					req.setAttribute("msg", "중복된 강의가 선택되었습니다.");
					req.setAttribute("url","project/sInforRegister?userId=" + userId);
					return "alert";
				}

				service.inforRegister(dto);
			}


		}

		return "alert";
	}
	//근태 등록
	@RequestMapping(value = "/project/sAttendRegister", method = RequestMethod.GET)
	public ModelAndView sAttendRegisterFrom(@RequestParam("userId")String userId,StudentDTO dto,
			@RequestParam("aDate")String aDate,
			@RequestParam(value  = "aNum", required = false)Integer aNum,
			Model model)throws Exception{


		ModelAndView mav1 = new ModelAndView();

		if (aNum == null || aNum == 500) {
			List<StudentDTO> sAttendRegisterForm = service.sAttendRegisterForm(userId);
			mav1.addObject("sAttendRegisterForm",sAttendRegisterForm);
			mav1.setViewName("sAttendRegister");
		}else {
			if(aNum !=null) {
				List<StudentDTO> attendanceSelect = service.attendanceSelect(dto);
				mav1.addObject("sAttendRegisterForm",attendanceSelect);
				mav1.setViewName("sAttendRegister");
			}
		}



		dto = service.sAttendDt(dto);
		model.addAttribute("dto",dto);

		int con = service.con(userId);
		int notc = service.notc(userId);
		int den = service.den(userId);

		model.addAttribute("con",con);
		model.addAttribute("notc",notc);
		model.addAttribute("den",den);

		int abs = service.abs(userId);
		int late  = service.late(userId);
		int early = service.ealry(userId);

		model.addAttribute("abs",abs);
		model.addAttribute("late",late);
		model.addAttribute("ealry",early);
		

		return mav1;
	}
	@RequestMapping(value = "/sAttendRegister", method = RequestMethod.POST)
	public String sAttndRegister(@RequestParam("userId") String userId, StudentDTO dto, 
			@RequestParam("aDate") String aDate, 
			@RequestParam(value="file" ,required = false) MultipartFile file, 
			HttpServletRequest req, 
			MultipartHttpServletRequest files) throws Exception {



		service.sAttendRegister(dto);
		String uploadFolder = "/springworkspace/test2/src/main/webapp/resources/dist/img";
		File uploadDir = new File(uploadFolder);

		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		List<MultipartFile> list = files.getFiles("file");
		StringBuilder fileNames = new StringBuilder();

		System.out.println(fileNames);

		for (MultipartFile multipartFile : list) {
			String fileRealName = multipartFile.getOriginalFilename();
			long size = multipartFile.getSize();

			dto.setRealFileName(fileRealName.toString());

			System.out.println("파일명 :" + fileRealName);
			System.out.println("사이즈 :" + size);

			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
			UUID uuid = UUID.randomUUID();
			String uniqueName = uuid.toString().split("-")[0];

			System.out.println("생성된 고유문자열" + uniqueName);
			System.out.println("확장자명" + fileExtension);

			File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);
			multipartFile.transferTo(saveFile);

			if (fileNames.length() > 0) {
				fileNames.append(",");
			}
			fileNames.append(uniqueName + fileExtension);
		}

		dto.setRanFileName(fileNames.toString());
		service.sAttendRegister(dto);

		System.out.println(dto.ranFileName);

		req.setAttribute("msg", "변경되었습니다.");
		req.setAttribute("url", "project/sAttendance?userId=" + userId);

		return "alert";
	}

	//강의 상세보기
	@RequestMapping(value = "/project/sDetail" ,method = RequestMethod.GET)
	public String sDetail(@RequestParam("lectureNum")int lectureNum,Model model) {


		//강사 정보
		StudentDTO dto = service.sDetail(lectureNum);
		//학생수 정보
		int sCnt = service.studentCnt(lectureNum);

		model.addAttribute("sDetail",dto);
		model.addAttribute("studentCnt",sCnt);

		return "sDetail";
	}

	@RequestMapping(value = "/project/sInforRegiDetail" ,method = RequestMethod.GET)
	public ModelAndView sInforRegiDetail(@RequestParam("lectureNum")int lectureNum,
			@RequestParam("userId")String userId,Model model) {


		StudentDTO dto = new StudentDTO();
		List<StudentDTO> sInforRegister =service.selectLecture(dto);
		ModelAndView mav = new ModelAndView();

		mav.addObject("sInformation",sInforRegister);
		mav.setViewName("sInforRegiDetail");

		//강사 정보
		dto = service.sDetail(lectureNum);
		//학생수 정보
		int sCnt = service.studentCnt(lectureNum);

		model.addAttribute("sInforRegiDetail",dto);
		model.addAttribute("studentCnt",sCnt);

		return mav;
	}


	//승인,미승인,반려 리스트 보기
	@RequestMapping(value = "/project/sAttendList", method = RequestMethod.GET)
	public ModelAndView sAttendList(@RequestParam("userId")String userId,@RequestParam("aConfirm")String aConfirm)throws Exception{

		ModelAndView mav = new ModelAndView();

		if (aConfirm.equals("100")) {
			List<StudentDTO> sAttendNotApp = service.sAttendNotApp(userId);
			mav.addObject("sAttendList",sAttendNotApp);

		}
		if (aConfirm.equals("101")) {
			List<StudentDTO> sAttendApp = service.sAttendApp(userId);
			mav.addObject("sAttendList",sAttendApp);

		}
		if (aConfirm.equals("102")) {
			List<StudentDTO> sAttendRef = service.sAttendRef(userId);
			mav.addObject("sAttendList",sAttendRef);

		}

		mav.setViewName("sAttendList");
		return mav;
	}

}