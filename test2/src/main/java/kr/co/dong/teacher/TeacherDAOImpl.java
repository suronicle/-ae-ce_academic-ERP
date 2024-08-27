package kr.co.dong.teacher;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDAOImpl implements TeacherDAO{

	@Autowired
	private SqlSession sqlsession;
	
	private static String namespace = "kr.co.dong.teacherMapper";

	@Override
	public List<TeacherDTO> lectureList(String userId) {

		return sqlsession.selectList(namespace+".lectureList",userId);
	}

	@Override
	public List<TeacherDTO> studentList(TeacherDTO teacherDTO) {

		return sqlsession.selectList(namespace+".studentList",teacherDTO);
	}

	@Override
	public String lectureName(int lectureNum) {
		
		return sqlsession.selectOne(namespace+".lectureName",lectureNum);
	}

	@Override
	public List<TeacherDTO> studentListOne(int lectureNum) {
	
		return sqlsession.selectList(namespace+".studentListOne",lectureNum);
	}

	@Override
	public int studentCount(int lectureNum) {
	
		return sqlsession.selectOne(namespace+".studentCount",lectureNum);
	}

	@Override
	public int tAttendRegister(TeacherDTO teacherDTO) {
		
		return sqlsession.insert(namespace+".tAttendRegister",teacherDTO);
	}

	@Override
	public List<TeacherDTO> tAttendList(String userId) {
	
		return sqlsession.selectList(namespace+".tAttendList",userId);
	}

	@Override
	public int annCount(String userId) {

		return sqlsession.selectOne(namespace+".annCount",userId);
	}

	@Override
	public int halfCount(String userId) {
	
		return sqlsession.selectOne(namespace+".halfCount",userId);
	}


	@Override
	public TeacherDTO attendOne(TeacherDTO teacherDTO) {
		
		return sqlsession.selectOne(namespace+".attendOne",teacherDTO);
	}

	@Override
	public int attendSet(TeacherDTO teacherDTO) {
		
		return sqlsession.update(namespace+".attendSet",teacherDTO);
	}

	@Override
	public List<TeacherDTO> sSearchDateList(TeacherDTO teacherDTO) {

		return sqlsession.selectList(namespace+".sSearchDateList",teacherDTO);
	}

	@Override
	public int attendDel(TeacherDTO teacherDTO) {
	
		return sqlsession.delete(namespace+".attendDel",teacherDTO);
	}

	@Override
	public TeacherDTO aDateCheck(TeacherDTO teacherDTO) {
		
		return sqlsession.selectOne(namespace+".aDateCheck",teacherDTO);
	}

	@Override
	public TeacherDTO userTeacher(String userId) {
		
		return sqlsession.selectOne(namespace+".userTeacher",userId);
	}

	@Override
	public String adminNumber(String userId) {
		
		return sqlsession.selectOne(namespace+".adminNumber",userId);
	}

	@Override
	public List<TeacherDTO> studentManage(int lectureNum) {
	
		return sqlsession.selectList(namespace+".studentManage",lectureNum);
	}

	@Override
	public int studentDelete(TeacherDTO teacherDTO) {
		
		return sqlsession.delete(namespace+".studentDelete",teacherDTO);
	}

	@Override
	public TeacherDTO studentInfo(TeacherDTO teacherDTO) {

		return sqlsession.selectOne(namespace+".studentInfo",teacherDTO);
	}

	@Override
	public int cCount(String userId) {
		
		return sqlsession.selectOne(namespace+".cCount",userId);
	}

	@Override
	public int dCount(String userId) {
	
		return sqlsession.selectOne(namespace+".dCount",userId);
	}

	@Override
	public int nCount(String userId) {
	
		return sqlsession.selectOne(namespace+".nCount",userId);
	}

	@Override
	public List<TeacherDTO> tAttendLists(TeacherDTO teacherDTO) {
		
		return sqlsession.selectList(namespace+".tAttendLists",teacherDTO);
	}

	@Override
	public List<TeacherDTO> tAttendSearch(TeacherDTO teacherDTO) {
		
		return sqlsession.selectList(namespace+".tAttendSearch",teacherDTO);
	}


}
