package kr.co.dong.user;

import java.util.List;
import java.util.Map;

import kr.co.dong.board.BoardDTO;

public interface MemberService {

	//이메일 중복체크
	public int emailCheck(String userEmail);

	//가입, 로그인
	public int join(MemberDTO memberDTO);
	public Map login(Map<String, Object> map);

	//로그인 시 직책
	public String getAdmin(Map<String, Object> map);

	//비밀번호 찾기
	public Map findPass(Map<String, Object> map);

	// 비밀번호 변경
	public int changePass(MemberDTO memberDTO);

	//전화번호 변경
	public int changeMob(MemberDTO memberDTO);

	//id 중복체크
	public int idCheck(String userId);

	//미승인 가입자 리스트
	public List<MemberDTO> managerConfirm();

	//미승인 한명 선택
	public MemberDTO confirmOne(String userId);

	//미승인->승인
	public int confirm(String userId);

	//학생 attendCount
	public int sAttendCount(String userId);

	//강사 attendCount
	public int tAttendCount(String userId);

	//미승인 직책
	public String role(String userId);

	//승인, 미승인 
	public String confirmName(String userId);

	//거절 사유
	public int refusal(MemberDTO memberDTO);




	//아이디로 불러오는 모든 정보
	public MemberDTO userInfo(String userId);


	//연차 반차 미승인 조회
	public int cCount(String userId);

	//승인 조회
	public int nCount(String userId);

	//공지사항 게시판 리스트
	public List<BoardDTO> boardList();

	//출근
	public int tGo(String userId);

	//퇴근
	public int tOut(String userId);

	//출근 체크
	public int tGoCheck(MemberDTO memberDTO);

	//출근 정보
	public MemberDTO tGoInfo(MemberDTO memberDTO);


	//퇴근 정보
	public MemberDTO tOutInfo(MemberDTO memberDTO);


	//출퇴근 기록 all
	public List<MemberDTO> GoOutAll(String userId);





	//메일ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ
	public List<MemberDTO> mailList(String userId);

	//안읽은 메일
	public int mailCount(String userId);

	// 메일 상세보기
	public MemberDTO mailSelect(MemberDTO memberDTO);

	//주소록
	public List<MemberDTO> emailAddress(String userId);

	//이메일 쓰기
	public int emailRegister(MemberDTO memberDTO);

	//메일 읽기
	public int updateMail(int mailNum);	


	//메일 발신 리스트
	public List<MemberDTO> sendMail(String userId);

	//메일 삭제 리스트
	public List<MemberDTO> mailDelList(String userId);

	//메일 유저 정보
	public MemberDTO mailUserInfo(String userId);

	//메일 삭제
	public int mailDelete(int mailNum);



	//학생

	//츨석
	public int att(String userId);

	//지각
	public int late(String userId);

	//조퇴
	public int ealry(String userId);

	//결석
	public int abs(String userId);

	//출석+1
	public int attPl(String userId);

	//지각+1
	public int latePl(String userId);

	//조퇴+1
	public int ealryPl(String userId);

	//결석+1
	public int absPl(String userId);

	//지각 + 조퇴
	public int latePlEalry(String userId);

	//메인 출결 리스트
	public List<MemberDTO> mainAttend(String userId);

	//하루에 출석찍은 횟수
	public int dateCount(MemberDTO dto);
		
	//출석등록
	public int regiAttend(MemberDTO dto);
	
	//과목정보
	public List<MemberDTO> lectureInfo(String userId);




}
