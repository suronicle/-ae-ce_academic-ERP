package kr.co.dong.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	StudentDAO dao;

	@Override
	public List<StudentDTO> attendance(String userId) {
		// TODO Auto-generated method stub
		return dao.attendance(userId);
	}

	@Override
	public List<StudentDTO> information(String userId) {
		// TODO Auto-generated method stub
		return dao.information(userId);
	}

	@Override
	public int inforRegister(StudentDTO dto) {
		// TODO Auto-generated method stub
		return dao.inforRegister(dto);
	}

	@Transactional
	@Override
	public int sAttendRegister(StudentDTO dto) {
		return dao.sAttendRegister(dto);
	}


	@Override
	public StudentDTO sDetail(int lectureNum) {
		// TODO Auto-generated method stub
		return dao.sDetail(lectureNum);
	}

	@Override
	public List<StudentDTO> sAttendRegisterForm(String userId) {
		// TODO Auto-generated method stub
		return dao.sAttendRegisterForm(userId);
	}

	@Override
	public int studentCnt(int lectureNum) {
		// TODO Auto-generated method stub
		return dao.studentCnt(lectureNum);
	}

	@Override
	public StudentDTO sAttendDt(StudentDTO dto) {
		// TODO Auto-generated method stub
		return dao.sAttendDt(dto);
	}

	@Override
	public List<StudentDTO> selectLecture(StudentDTO dto) {
		// TODO Auto-generated method stub
		return dao.selectLecture(dto);
	}

	@Override
	public int con(String userId) {
		// TODO Auto-generated method stub
		return dao.con(userId);
	}

	@Override
	public int notc(String userId) {
		// TODO Auto-generated method stub
		return dao.notc(userId);
	}

	@Override
	public int den(String userId) {
		// TODO Auto-generated method stub
		return dao.den(userId);
	}

	@Override
	public List<StudentDTO> sAttendNotApp(String userId) {
		// TODO Auto-generated method stub
		return dao.sAttendNotApp(userId);
	}

	@Override
	public List<StudentDTO> sAttendApp(String userId) {
		// TODO Auto-generated method stub
		return dao.sAttendApp(userId);
	}

	@Override
	public List<StudentDTO> sAttendRef(String userId) {
		// TODO Auto-generated method stub
		return dao.sAttendRef(userId);
	}

	@Override
	public int att(String userId) {
		// TODO Auto-generated method stub
		return dao.att(userId);
	}

	@Override
	public int late(String userId) {
		// TODO Auto-generated method stub
		return dao.late(userId);
	}

	@Override
	public int ealry(String userId) {
		// TODO Auto-generated method stub
		return dao.ealry(userId);
	}

	@Override
	public int abs(String userId) {
		// TODO Auto-generated method stub
		return dao.abs(userId);
	}
	public List<StudentDTO> attendanceSelect(StudentDTO dto) {
		// TODO Auto-generated method stub
		return dao.attendanceSelect(dto);
	}

}
