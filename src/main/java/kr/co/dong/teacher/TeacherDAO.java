package kr.co.dong.teacher;

import java.util.List;
import java.util.Map;



public interface TeacherDAO {

	//강의 목록
	public List<TeacherDTO> lectureList(String userId);
		
	//강의별 학생 목록
	public List<TeacherDTO> studentList(TeacherDTO teacherDTO);
	
	//학원생 관리
	public List<TeacherDTO> studentManage(int lectureNum); 
	
	//학원생 삭제
	public int studentDelete(TeacherDTO teacherDTO);
	
	//강사 정보 출력
	public TeacherDTO userTeacher(String userId);
	
	//강의명만 출력
	public String lectureName(int lectureNum);
	
	//직책 번호
	public String adminNumber(String userId);
	
	//학생 전체 정보 한개씩
	public List<TeacherDTO> studentListOne(int lectureNum);
	
	//학생 한명의 전체 정보
	public TeacherDTO studentInfo(TeacherDTO teacherDTO);
	
	//학생수
	public int studentCount(int lectureNum);
	
	
	//강사 근태 신청
	public int tAttendRegister(TeacherDTO teacherDTO);


	//강사 근태 리스트
	public List<TeacherDTO> tAttendList(String userId);
	
	
	//연차 조회
	public int annCount(String userId);
	
	//반차 조회
	public int halfCount(String userId);
		
	//미승인 조회
	public int cCount(String userId);
	
	//승인 조회
	public int dCount(String userId);
	
	//반려 조회
	public int nCount(String userId);
	
	//연차, 반차 상세 조회
	public TeacherDTO attendOne(TeacherDTO teacherDTO);
	
	//연차, 반차 수정
	public int attendSet(TeacherDTO teacherDTO);
	
	//연차, 반차 삭제
	public int attendDel(TeacherDTO teacherDTO);
	
	//날짜별 검색
	public List<TeacherDTO> sSearchDateList(TeacherDTO teacherDTO);
	
	//날짜 중복 여부 체크
	public TeacherDTO aDateCheck(TeacherDTO teacherDTO);
	
	

	//근태 조회(승인, 미승인, 반려 ) 
	public List<TeacherDTO> tAttendLists(TeacherDTO  teacherDTO);
	
	
	//근태 명 별 조회
	public List<TeacherDTO> tAttendSearch(TeacherDTO teacherDTO);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
