package kr.co.dong.teacher;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	TeacherDAO teacherDAO;

	@Override
	public List<TeacherDTO> lectureList(String userId) {
	
		return teacherDAO.lectureList(userId);
	}

	@Override
	public List<TeacherDTO> studentList(TeacherDTO teacherDTO) {

		return teacherDAO.studentList(teacherDTO);
	}

	@Override
	public String lectureName(int lectureNum) {
	
		return teacherDAO.lectureName(lectureNum);
	}

	@Override
	public List<TeacherDTO> studentListOne(int lectureNum) {
	
		return teacherDAO.studentListOne(lectureNum);
	}

	@Override
	public int studentCount(int lectureNum) {

		return teacherDAO.studentCount(lectureNum);
	}

	@Override
	public int tAttendRegister(TeacherDTO teacherDTO) {

		return teacherDAO.tAttendRegister(teacherDTO);
	}

	@Override
	public List<TeacherDTO> tAttendList(String userId) {
	
		return teacherDAO.tAttendList(userId);
	}

	@Override
	public int annCount(String userId) {

		return teacherDAO.annCount(userId);
	}

	@Override
	public int halfCount(String userId) {

		return teacherDAO.halfCount(userId);
	}


	@Override
	public TeacherDTO attendOne(TeacherDTO teacherDTO) {

		return teacherDAO.attendOne(teacherDTO);
	}

	@Override
	public int attendSet(TeacherDTO teacherDTO) {
	
		return teacherDAO.attendSet(teacherDTO);
	}

	@Override
	public List<TeacherDTO> sSearchDateList(TeacherDTO teacherDTO) {
	
		return teacherDAO.sSearchDateList(teacherDTO);
	}

	@Override
	public int attendDel(TeacherDTO teacherDTO) {
	
		return teacherDAO.attendDel(teacherDTO);
	}

	@Override
	public TeacherDTO aDateCheck(TeacherDTO teacherDTO) {
		
		return teacherDAO.aDateCheck(teacherDTO);
	}

	@Override
	public TeacherDTO userTeacher(String userId) {
	
		return teacherDAO.userTeacher(userId);
	}

	@Override
	public String adminNumber(String userId) {
		
		return teacherDAO.adminNumber(userId);
	}

	@Override
	public List<TeacherDTO> studentManage(int lectureNum) {

		return teacherDAO.studentManage(lectureNum);
	}

	@Override
	public int studentDelete(TeacherDTO teacherDTO) {
		
		return teacherDAO.studentDelete(teacherDTO);
	}

	@Override
	public TeacherDTO studentInfo(TeacherDTO teacherDTO) {
		
		return teacherDAO.studentInfo(teacherDTO);
	}

	@Override
	public int cCount(String userId) {

		return teacherDAO.cCount(userId);
	}

	@Override
	public int dCount(String userId) {
	
		return teacherDAO.dCount(userId);
	}

	@Override
	public int nCount(String userId) {
	
		return teacherDAO.nCount(userId);
	}

	@Override
	public List<TeacherDTO> tAttendLists(TeacherDTO teacherDTO) {
		
		return teacherDAO.tAttendLists(teacherDTO);
	}

	@Override
	public List<TeacherDTO> tAttendSearch(TeacherDTO teacherDTO) {
		
		return teacherDAO.tAttendSearch(teacherDTO);
	}


}
