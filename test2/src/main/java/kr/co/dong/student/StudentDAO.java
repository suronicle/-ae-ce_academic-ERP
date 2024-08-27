package kr.co.dong.student;

import java.util.List;

public interface StudentDAO {
	public List<StudentDTO> attendance(String userId);
	public List<StudentDTO> information(String userId);
	public int inforRegister(StudentDTO dto);
	public int sAttendRegister(StudentDTO dto); 
	public StudentDTO sDetail(int lectureNum);
	public List<StudentDTO> sAttendRegisterForm(String userId);
	public int studentCnt(int lectureNum);
	public StudentDTO sAttendDt(StudentDTO dto);
	public List<StudentDTO> selectLecture(StudentDTO dto);
	public int con(String userId);
	public int notc(String userId);
	public int den(String userId);
	public List<StudentDTO> sAttendNotApp(String userId);
	public List<StudentDTO> sAttendApp(String userId);
	public List<StudentDTO> sAttendRef(String userId);
	public int att(String userId);
	public int late(String userId);
	public int ealry(String userId);
	public int abs(String userId);
	public List<StudentDTO> attendanceSelect(StudentDTO dto);
	
}
