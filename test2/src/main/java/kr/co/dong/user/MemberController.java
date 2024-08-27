package kr.co.dong.user;




import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.board.BoardDTO;
import kr.co.dong.teacher.TeacherDTO;


@Controller
public class MemberController {

	@Autowired
	MemberService service;




	@RequestMapping(value = "/project/main", method = RequestMethod.GET)
	public ModelAndView main(@RequestParam(value="userId", required=false)String userId, MemberDTO memberDTO , TeacherDTO teacherDTO, Model model) throws Exception{

		ModelAndView mav = new ModelAndView();
		if (userId == null || userId.trim().isEmpty()) {

		}
		else {

			MemberDTO info = service.userInfo(userId);
			System.out.println(userId);
			mav.addObject("info", info);

			if(info.userAdmin.equals("002")) {

				System.out.println(info.userAdmin);

				int c = service.cCount(userId);
				int n= service.nCount(userId);	

				mav.addObject("con", c);
				mav.addObject("notc", n);



				List<MemberDTO> attend=service.GoOutAll(userId);
				mav.addObject("GoOut",attend);


			}

			else if(info.userAdmin.equals("001")){

				System.out.println(info.userAdmin);

				//학생
				List<MemberDTO> mainAttend = service.mainAttend(userId);
				mav.addObject("mainAttend",mainAttend);

				List<MemberDTO> lectureInfo = service.lectureInfo(userId);
				mav.addObject("lectureInfo",lectureInfo);


				int att = service.att(userId);
				mav.addObject("att",att);

				int late = service.late(userId);
				mav.addObject("late",late);

				int early = service.ealry(userId);
				mav.addObject("early",early);

				int abs = service.abs(userId);
				mav.addObject("abs",abs);



			}


			List<BoardDTO> boardN = service.boardList();
			mav.addObject("boardN", boardN);

		}
		mav.setViewName("main");
		return mav;
	}


	@RequestMapping(value = "/project/mMain", method = RequestMethod.GET)
	public String mMain() throws Exception{
		return "mMain";
	}


	@RequestMapping(value="/tGoOut",method = RequestMethod.POST)
	public String tGoOut(@RequestParam("userId")String userId,@RequestParam("aDate")String aDate,Model model,MemberDTO memberDTO) throws Exception{


		System.out.println(userId);
		System.out.println(aDate);
		int check = service.tGoCheck(memberDTO);

		//출근
		if(check==0) {
			service.tGo(userId);
			MemberDTO info1= service.tGoInfo(memberDTO);
			model.addAttribute("go",info1);
			model.addAttribute("msg", "출근하였습니다.");
			model.addAttribute("url", "/project/main?userId="+userId);
		}

		//퇴근
		else if(check==1){
			service.tOut(userId);
			MemberDTO info2= service.tOutInfo(memberDTO);
			model.addAttribute("out",info2);
			model.addAttribute("msg", "퇴근하였습니다.");
			model.addAttribute("url", "/project/main?userId="+userId);
		}
		else if(check>1) {
			model.addAttribute("msg", "이미 출퇴근 완료하였습니다. 관리자에게 문의 바랍니다.");
			model.addAttribute("url", "/project/main?userId="+userId);
		}

		return "alert";
	}

	   @RequestMapping(value = "/sGoOut",method = RequestMethod.POST)
	   public String sGoOut(@RequestParam("userId")String userId,
	                  @RequestParam("aDate")String aDate,
	                  @RequestParam("lectureNum")int lectureNum,
	                  MemberDTO dto,HttpServletRequest req) throws Exception{
	    
	      System.out.println(lectureNum);
	      if(lectureNum == 500) {
	         req.setAttribute("msg","과목을 선택해주세요.");
	         req.setAttribute("url","project/main?userId="+userId);
	         return "alert";
	      }
	      
	      DateTimeFormatter formatter= DateTimeFormatter.ofPattern("HH:mm:ss");
	      LocalTime nowTime = LocalTime.now(ZoneId.of("Asia/Seoul"));
	     
	      LocalTime startTime = LocalTime.parse("09:30:00",formatter);
	      LocalTime endTime = LocalTime.parse("18:00:00", formatter);
	        
	        int dateCount = service.dateCount(dto);
	      
	      if(dateCount == 0) {
	         
	         if(nowTime.isBefore(startTime)) {
	            dto.setaAttend(1);
	            
	            int regiAttend = service.regiAttend(dto);
	            int attPl = service.attPl(userId);
	            
	            req.setAttribute("msg","등원");
	            req.setAttribute("url","project/main?userId="+userId);
	            
	         }else if(nowTime.isAfter(endTime)){
	            dto.setaAttend(6);
	            
	            int regiAttend = service.regiAttend(dto);
	            int absPl = service.absPl(userId);
	            
	            req.setAttribute("msg","결석");
	            req.setAttribute("url","project/main?userId="+userId);
	            
	         }else {
	            dto.setaAttend(2);
	            
	            int regiAttend = service.regiAttend(dto);
	            int latePl = service.latePl(userId);
	            
	            int ealry = service.ealry(userId);
	            int late = service.late(userId);
	            int latePlEalry = ealry+late;
	            
	            System.out.println(latePlEalry);
	            
	            if(latePlEalry%3 == 0) {
	               int absPl1 = service.absPl(userId);
	            }
	            
	            
	            req.setAttribute("msg","지각");
	            req.setAttribute("url","project/main?userId="+userId);
	            
	         }
	         
	      }else if (dateCount == 1) {
	         if(nowTime.isAfter(endTime)) {
	            dto.setaAttend(0);
	            
	            int regiAttend1 = service.regiAttend(dto);
	            
	            req.setAttribute("msg","하원");
	            req.setAttribute("url","project/main?userId="+userId);
	         
	         }else if (nowTime.isAfter(startTime) && nowTime.isBefore(endTime)) {
	            dto.setaAttend(3);
	            
	            int regiAttend1 = service.regiAttend(dto);
	            int ealryPl = service.ealryPl(userId);
	            
	            int ealry = service.ealry(userId);
	            int late = service.late(userId);
	            int latePlEalry = ealry+late;
	            
	            System.out.println(latePlEalry);
	            
	            if(latePlEalry%3 == 0) {
	               int absPl1 = service.absPl(userId);
	            }
	            
	            
	            req.setAttribute("msg","조퇴");
	            req.setAttribute("url","project/main?userId="+userId);
	         }
	      }else if(dateCount>1){
	         req.setAttribute("msg","등 하원을 모두 완료하셧습니다. 관리자에게 문의해주세요.");
	         req.setAttribute("url","project/main?userId="+userId);
	      }
	      System.out.println(aDate);
	      System.out.println(userId);
	      return "alert";
	   }
	   
	

			@GetMapping(value = "/project/logOut")
			public String logOut(HttpSession session, Model model) {
				session.invalidate();
				model.addAttribute("msg", "로그아웃 되었습니다. 메인으로 돌아갑니다.");
				model.addAttribute("url", "/project/main?userId=");
				return "alert";
			}





			//가입

			@RequestMapping(value = "/project/join", method = RequestMethod.GET)
			public String join() throws Exception{
				return "join";
			}


			@RequestMapping(value = "/join", method = RequestMethod.POST)
			public String join(MemberDTO memberDTO, Model model) throws Exception{

				int r=service.join(memberDTO);
				System.out.println("가입 성공");
				String admin=memberDTO.getUserAdmin();
				String userId=memberDTO.getUserId();
				System.out.println("가입된 아이디 : " +userId);


				if(admin.equals("001")) {
					int s = service.sAttendCount(userId);
					System.out.println("학생 가입");
				}
				else if(admin.equals("002")) {
					int t = service.tAttendCount(userId);
					System.out.println("강사 가입");
				}

				model.addAttribute("msg", "가입이 완료되었습니다. 승인 후에 로그인 가능합니다.");
				model.addAttribute("url", "/project/login");
				return "alert";
			}




			//로그인

			@RequestMapping(value = "/project/login", method = RequestMethod.GET)
			public String login() throws Exception{
				return "login";
			}

			@RequestMapping(value = "/login", method = RequestMethod.POST)
			public String login(@RequestParam Map map, HttpSession session, HttpServletRequest req, Model model) throws Exception{


				Map user = service.login(map);
				String admin = service.getAdmin(map);

				System.out.println(user);

				if(user!=null) {
					session.setAttribute("user", user);
					Object userId = user.get("userId");

					//메일 수
					String Id=String.valueOf(userId);
					int mailNum = service.mailCount(Id);
					session.setAttribute("mailNum", mailNum);


					System.out.println(user);
					if(admin.equals("관리자")) {
						System.out.println(admin);
						model.addAttribute("msg", admin+"님 환영합니다.");
						model.addAttribute("url", "/project/mMain");

					}
					else {
						System.out.println(admin);
						model.addAttribute("msg", admin+"님 환영합니다.");
						model.addAttribute("url", "/project/main?userId="+userId);

					}

				}else {
					model.addAttribute("msg", "가입이 되어있지 않거나, 관리자의 승인이 안된 계정입니다. 가입창으로 이동합니다.");
					model.addAttribute("url", "/project/join");

				}



				return "alert";
			}


			//비밀번호 찾기

			@RequestMapping(value= "/project/findpassword", method=RequestMethod.GET)
			public String findpassword()throws Exception{

				return "findpassword";
			}


			@RequestMapping(value="/findpassword",method=RequestMethod.POST)
			public String findpassword(@RequestParam Map map, Model model)throws Exception{

				Map pass = service.findPass(map);
				System.out.println(pass);


				if(pass!=null) {
					String userId=(String)pass.get("userId");
					model.addAttribute("msg", "가입시 입력했던 정보를 로드합니다.");
					model.addAttribute("url", "/project/showInfo?userId="+userId);
				}
				else {
					model.addAttribute("msg", "입력된 정보가 틀렸습니다. 다시한번 확인해보세요.");
					model.addAttribute("url", "/project/findpassword");

				}



				return "alert";
			}



			//가입 정보 보여주기
			@RequestMapping(value= "/project/showInfo", method=RequestMethod.GET)
			public ModelAndView showInfo(@RequestParam("userId")String userId)throws Exception{
				ModelAndView mav = new ModelAndView();
				MemberDTO memberDTO = service.confirmOne(userId);
				memberDTO.setpName(service.role(userId));

				mav.addObject("user", memberDTO);
				mav.setViewName("showInfo");

				return mav;
			}


			//비밀번호 변경

			@RequestMapping(value= "/project/changepassword", method=RequestMethod.GET)
			public String changepassword()throws Exception{

				return "changepassword";
			}

			@RequestMapping(value= "/changepassword", method=RequestMethod.POST)
			public String changepassword(@RequestParam("userId")String userId, @RequestParam("userPwd")String userPwd, MemberDTO memberDTO, Model model)throws Exception{

				int r = service.changePass(memberDTO);
				System.out.println(r);
				if(r==1) {
					System.out.println("비밀번호 변경 완료");
					model.addAttribute("msg", "변경되었습니다.");
					model.addAttribute("url", "/project/changepassword?userId="+userId);


				}
				else {
					System.out.println("비밀번호 변경 불가합니다");
					model.addAttribute("msg", "다시 변경해주세요.");
					model.addAttribute("url", "/project/changepassword?userId="+userId);

				}

				return "alert";
			}



			//전화번호 변경

			@RequestMapping(value= "/project/changemobile", method=RequestMethod.GET)
			public String changemobile()throws Exception{

				return "changemobile";
			}

			@RequestMapping(value= "/changemobile", method=RequestMethod.POST)
			public String changemobile(@RequestParam("userId")String userId, @RequestParam("userMobile")String userMobile, MemberDTO memberDTO, Model model)throws Exception{

				int r = service.changeMob(memberDTO);
				System.out.println(r);
				if(r==1) {
					System.out.println("전화번호 변경 완료");
					model.addAttribute("msg", "변경되었습니다.");
					model.addAttribute("url", "/project/changemobile?userId="+userId);


				}
				else {
					System.out.println("비밀번호 변경 불가합니다");
					model.addAttribute("msg", "다시 변경해주세요.");
					model.addAttribute("url", "/project/changemobile?userId="+userId);

				}

				return "alert";
			}










			//아이디 중복체크

			@RequestMapping(value = "/project/idCheck", method = RequestMethod.GET)
			public String idCheck() throws Exception{
				return "idCheck";
			}

			@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
			public String idCheck(@RequestParam("userId")String userId, Model model) throws Exception{

				int r = service.idCheck(userId);
				if(r==1) {
					System.out.println("중복");
					model.addAttribute("msg", "중복된 아이디입니다.");
					model.addAttribute("url", "/project/idCheck");
				}
				else {
					System.out.println("안중복");
					model.addAttribute("msg", "사용가능한 아이디입니다.");
					model.addAttribute("url", "/project/idCheck?userId="+userId);


				}

				return "alert";

			}
















			//이메일 중복체크

			@RequestMapping(value = "/project/emailCheck", method = RequestMethod.GET)
			public String emailCheck() throws Exception{
				return "emailCheck";
			}

			@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
			public String emailCheck(@RequestParam("userEmail")String userEmail, Model model) throws Exception{

				int r = service.emailCheck(userEmail);
				if(r==1) {
					System.out.println("중복");
					model.addAttribute("msg", "중복된 이메일입니다.");
					model.addAttribute("url", "/project/emailCheck");
				}
				else {
					System.out.println("안중복");
					model.addAttribute("msg", "사용가능한 이메일입니다.");
					model.addAttribute("url", "/project/emailCheck?userEmail="+userEmail);


				}

				return "alert";

			}




			//메일

			@RequestMapping(value = "/project/mail", method = RequestMethod.GET)
			public ModelAndView mail(@RequestParam("userId")String userId,HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();

				List <MemberDTO> mail = service.mailList(userId);
				mav.addObject("mail", mail);

				//안읽은 메일 수
				int mailCount=service.mailCount(userId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				mav.setViewName("mail");

				return mav;
			}


			@RequestMapping(value = "/project/send", method = RequestMethod.GET)
			public ModelAndView send(@RequestParam("userId")String userId,HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();

				List <MemberDTO> mail = service.sendMail(userId);
				mav.addObject("mail", mail);

				//안읽은 메일 수
				int mailCount=service.mailCount(userId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				mav.setViewName("send");

				return mav;
			}




			@RequestMapping(value = "/project/mailSend", method = RequestMethod.GET)
			public ModelAndView mailSend(@RequestParam("userId")String userId,HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();
				//안읽은 메일 수
				int mailCount=service.mailCount(userId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				mav.setViewName("mailSend");
				return mav;
			}


			@RequestMapping(value="/address", method=RequestMethod.POST)
			public String address(HttpServletRequest req, Model model) throws Exception{

				String buttonId = req.getParameter("userEmail");
				System.out.println(buttonId);
				model.addAttribute("msg", "메일을 선택하였습니다.");

				return "alert";
			}

			@RequestMapping(value = "/project/mailDel", method = RequestMethod.GET)
			public ModelAndView mailDel(@RequestParam("userId")String userId,HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();

				List <MemberDTO> mail = service.mailDelList(userId);
				mav.addObject("mail", mail);

				//안읽은 메일 수
				int mailCount=service.mailCount(userId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				mav.setViewName("mailDel");
				return mav;
			}



			@RequestMapping(value = "/project/mailSelect", method = RequestMethod.GET)
			public ModelAndView mailSelect(@RequestParam("receiveId")String receiveId, @RequestParam("mailNum")int mailNum,MemberDTO  memberDTO, HttpServletRequest req,HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();


				//메일 읽기
				int r = service.updateMail(mailNum);

				//안읽은 메일 수
				int mailCount=service.mailCount(receiveId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				MemberDTO mail=service.mailSelect(memberDTO);
				mav.addObject("mail", mail);


				mav.setViewName("mailSelect");
				return mav;
			}

			@RequestMapping(value="/project/mailDelete", method= RequestMethod.GET)
			public String mailDelete(@RequestParam("mailNum") int MailNum,@RequestParam("userId") String userId, Model model)throws Exception{

				int r = service.mailDelete(MailNum);

				model.addAttribute("msg" , "삭제되었습니다. 휴지통에서 확인 가능합니다.");
				model.addAttribute("url", "/project/mail?userId="+userId);


				return "alert";
			}









			@RequestMapping(value = "/project/selectSendmail", method = RequestMethod.GET)
			public ModelAndView selectSendmail(@RequestParam("receiveId")String receiveId,@RequestParam("mailNum")int mailNum,MemberDTO  memberDTO,HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();



				MemberDTO mail=service.mailSelect(memberDTO);
				mav.addObject("mail", mail);

				System.out.println(mail.sendId);
				//안읽은 메일 수
				int mailCount=service.mailCount(mail.sendId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				MemberDTO info = service.mailUserInfo(receiveId);
				mav.addObject("info", info);

				mav.setViewName("selectSendmail");
				return mav;
			}


			@RequestMapping(value = "/project/address", method = RequestMethod.GET)
			public ModelAndView address(@RequestParam("userId")String userId, MemberDTO memberDTO) throws Exception{
				ModelAndView mav = new ModelAndView();

				List<MemberDTO> emailAddress =service.emailAddress(userId);
				mav.addObject("emailAddress",emailAddress);
				mav.setViewName("address");

				return mav;
			}


			@RequestMapping(value = "/mailRegister", method = RequestMethod.POST)
			public String mailRegister(@RequestParam("userId")String userId,MemberDTO memberDTO, Model model,HttpSession session)throws Exception{

				int r = service.emailRegister(memberDTO);
				model.addAttribute("msg", "메일이 발송되었습니다.");
				model.addAttribute("url", "/project/mail?userId="+userId);

				return "alert";
			}








			//관리자 승인처리

			@RequestMapping(value = "/project/mConfirm", method = RequestMethod.GET)
			public ModelAndView managerConfirm() throws Exception{
				ModelAndView mav = new ModelAndView();

				List<MemberDTO> member = service.managerConfirm();

				mav.addObject("member", member);
				mav.setViewName("mConfirm");
				System.out.println(mav);
				return mav;
			}

			@RequestMapping(value="/project/mConfirmOne",method=RequestMethod.GET)
			public ModelAndView confirmOne(@RequestParam("userId") String userId) throws Exception{
				ModelAndView mav = new ModelAndView();
				MemberDTO memberDTO = service.confirmOne(userId);
				String role = service.role(userId);
				mav.addObject("role", role);
				mav.addObject("member",memberDTO);
				mav.setViewName("mConfirmOne");

				return mav;
			}

			@RequestMapping(value = "/project/confirm",method=RequestMethod.GET)
			public String confirm(@RequestParam("userId") String userId, Model model) throws Exception{

				int r = service.confirm(userId);
				System.out.println("승인 완료");
				model.addAttribute("msg", "승인 완료되었습니다.");
				model.addAttribute("url", "/project/mConfirm");
				return "alert";

			}

			@RequestMapping(value = "/project/mConfirmRefusal", method = RequestMethod.GET)
			public String refusal(@RequestParam("userId") String userId, Model model) throws Exception{
				return "mConfirmRefusal";
			}


			@RequestMapping(value = "/mConfirmRefusal", method = RequestMethod.POST)
			public String refusal(@RequestParam("userId") String userId,MemberDTO memberDTO, Model model) throws Exception{

				int r = service.refusal(memberDTO);
				System.out.println("반려 완료");

				model.addAttribute("msg","승인 반려되었습니다.");


				return "alert";
			}




			/////////////////////////관리자 메일

			@RequestMapping(value = "/project/mMail", method = RequestMethod.GET)
			public ModelAndView  mMail(@RequestParam("userId") String userId, HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();

				List <MemberDTO> mail = service.mailList(userId);
				mav.addObject("mail", mail);

				//안읽은 메일 수
				int mailCount=service.mailCount(userId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				mav.setViewName("mMail");
				return mav;
			}


			@RequestMapping(value = "/mMailRegister", method = RequestMethod.POST)
			public String mMailRegister(@RequestParam("userId")String userId,MemberDTO memberDTO, Model model,HttpSession session)throws Exception{

				int r = service.emailRegister(memberDTO);
				model.addAttribute("msg", "메일이 발송되었습니다.");
				model.addAttribute("url", "/project/mMail?userId="+userId);

				return "alert";
			}



			@RequestMapping(value = "/project/mSend", method = RequestMethod.GET)
			public ModelAndView  mSend(@RequestParam("userId")String userId,HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();

				List <MemberDTO> mail = service.sendMail(userId);
				mav.addObject("mail", mail);

				//안읽은 메일 수
				int mailCount=service.mailCount(userId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				mav.setViewName("mSend");

				return mav;
			}

			@RequestMapping(value = "/project/mMailDel", method = RequestMethod.GET)
			public ModelAndView mMailDel(@RequestParam("userId")String userId,HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();

				List <MemberDTO> mail = service.mailDelList(userId);
				mav.addObject("mail", mail);

				//안읽은 메일 수
				int mailCount=service.mailCount(userId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				mav.setViewName("mMailDel");
				return mav;
			}

			@RequestMapping(value = "/project/mMailSelect", method = RequestMethod.GET)
			public ModelAndView  mMailSelect(@RequestParam("receiveId")String receiveId, @RequestParam("mailNum")int mailNum,MemberDTO  memberDTO, HttpServletRequest req,HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();


				//메일 읽기
				int r = service.updateMail(mailNum);

				//안읽은 메일 수
				int mailCount=service.mailCount(receiveId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				MemberDTO mail=service.mailSelect(memberDTO);
				mav.addObject("mail", mail);


				mav.setViewName("mMailSelect");
				return mav;
			}

			@RequestMapping(value = "/project/mMailSend", method = RequestMethod.GET)
			public ModelAndView  mMailSend(@RequestParam("userId")String userId,HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();
				//안읽은 메일 수
				int mailCount=service.mailCount(userId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				mav.setViewName("mMailSend");
				return mav;
			}

			@RequestMapping(value = "/project/mSelectSendMail", method = RequestMethod.GET)
			public ModelAndView mSelectSendMail(@RequestParam("receiveId")String receiveId,@RequestParam("mailNum")int mailNum,MemberDTO  memberDTO,HttpSession session) throws Exception{
				ModelAndView mav = new ModelAndView();


				MemberDTO mail=service.mailSelect(memberDTO);
				mav.addObject("mail", mail);

				System.out.println(mail.sendId);
				//안읽은 메일 수
				int mailCount=service.mailCount(mail.sendId);
				mav.addObject("mailCount",mailCount);

				session.setAttribute("mailNum", mailCount);

				MemberDTO info = service.mailUserInfo(receiveId);
				mav.addObject("info", info);

				mav.setViewName("mSelectSendMail");
				return mav;
			}

			@RequestMapping(value="/project/mMailDelete", method= RequestMethod.GET)
			public String mMailDelete(@RequestParam("mailNum") int MailNum,@RequestParam("userId") String userId, Model model)throws Exception{

				int r = service.mailDelete(MailNum);

				model.addAttribute("msg" , "삭제되었습니다. 휴지통에서 확인 가능합니다.");
				model.addAttribute("url", "/project/mMail?userId="+userId);


				return "alert";
			}






		}
