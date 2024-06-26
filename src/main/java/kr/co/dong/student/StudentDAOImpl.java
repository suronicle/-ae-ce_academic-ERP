package kr.co.dong.student;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDAOImpl implements StudentDAO{

	@Autowired
	private SqlSession sqlsession;

	private static final String namespace = "kr.co.dong.StudentMapper";

	@Override
	public List<StudentDTO> attendance(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".attendance",userId);
	}

	@Override
	public List<StudentDTO> information(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".information",userId);
	}

	@Override
	public int inforRegister(StudentDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.insert(namespace + ".inforRegister",dto);
	}

	@Override
	public int sAttendRegister(StudentDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace + ".sAttendRegister",dto);
	}


	@Override
	public StudentDTO sDetail(int lectureNum) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".sDetail",lectureNum);
	}


	@Override
	public List<StudentDTO> sAttendRegisterForm(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".sAttendRegisterForm",userId);
	}

	@Override
	public int studentCnt(int lectureNum) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".studentCnt",lectureNum);
	}

	@Override
	public StudentDTO sAttendDt(StudentDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".sAttendDt",dto);
	}

	@Override
	public List<StudentDTO> selectLecture(StudentDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".selectLecture",dto);
	}

	@Override
	public int con(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".con",userId);
	}

	@Override
	public int notc(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".notc",userId);
	}

	@Override
	public int den(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".den",userId);
	}

	@Override
	public List<StudentDTO> sAttendNotApp(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".sAttendNotApp",userId);
	}

	@Override
	public List<StudentDTO> sAttendApp(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".sAttendApp",userId);
	}

	@Override
	public List<StudentDTO> sAttendRef(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".sAttendRef",userId);
	}

	@Override
	public int att(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".att",userId);
	}

	@Override
	public int late(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".late",userId);
	}

	@Override
	public int ealry(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".ealry",userId);
	}

	@Override
	public int abs(String userId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".abs",userId);
	}
	public List<StudentDTO> attendanceSelect(StudentDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".attendanceSelect",dto);
	}





}
