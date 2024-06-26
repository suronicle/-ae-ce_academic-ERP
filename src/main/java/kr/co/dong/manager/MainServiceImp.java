package kr.co.dong.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainServiceImp implements MainService {
	
	@Autowired
	MainDAO mainDAO;
	
	public List<MainDTO> attenList() throws Exception {
		return mainDAO.attenList();
	}
	
	public MainDTO attenDetail(String bno, String bno2) throws Exception  {
		return mainDAO.attenDetail(bno, bno2);
	}
	
	public List<MainDTO> lessonList() throws Exception  {
		return mainDAO.lessonList();
	}
	
	public MainDTO lessonDetail(int bno) throws Exception  {
		return mainDAO.lessonDetail(bno);
	}
	
	public int lessonDetail2(String bno) throws Exception  {
		return mainDAO.lessonDetail2(bno);
	}
	
	public int lessonDetail3(String bno) throws Exception {
		return mainDAO.lessonDetail3(bno);
	}
	
	public int lessonUpdate(MainDTO dto) throws Exception  {
		return mainDAO.lessonUpdate(dto);
	}
	
	public int lessonTeacher(MainDTO dto) throws Exception {
		return mainDAO.lessonTeacher(dto);
	}
	
	public int lessonDelete(int bno) throws Exception  {
		return mainDAO.lessonDelete(bno);
	}
	
	public int lessonInsert(MainDTO dto) throws Exception  {
		return mainDAO.lessonInsert(dto);
	}
	
	public int attenUpdate(MainDTO dto) throws Exception  {
		return mainDAO.attenUpdate(dto);
	}
	
	public int attenDeny(MainDTO dto) throws Exception  {
		return mainDAO.attenDeny(dto);
	}
	
	public List<MainDTO> serchList(String serachField, String serachText) throws Exception {
		return mainDAO.serchList(serachField, serachText);
	}
	
	public List<MainDTO> teacherFind() throws Exception {
		return mainDAO.teacherFind();
	}
	public int lessonInsert2(MainDTO dto) throws Exception {
		return mainDAO.lessonInsert2(dto);
	}
	
	public int lessonInsert3(MainDTO dto) throws Exception {
		return mainDAO.lessonInsert3(dto);
	}
	
	public int attenDbUpdate(MainDTO dto) throws Exception {
		return mainDAO.attenDbUpdate(dto);
	}
	
	public int attenAbsCheck(MainDTO dto) throws Exception {
		return mainDAO.attenAbsCheck(dto);
	}
	
	public int attenAnnUpdate(MainDTO dto) throws Exception {
		return mainDAO.attenAnnUpdate(dto);
	}
	
	public List<MainDTO> mlessonRecycleList() throws Exception {
		return mainDAO.mlessonRecycleList();
	}
	
	public int recycleDelete(int bno) throws Exception {
		return mainDAO.recycleDelete(bno);
	}
	
	public int lessonRestore(int bno) throws Exception {
		return mainDAO.lessonRestore(bno);
	}

	

	
	


	
	

}
