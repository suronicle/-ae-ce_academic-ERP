package kr.co.dong.manager;

import java.util.List;

public interface MainDAO {
	
	public List<MainDTO> attenList() throws Exception;
	public MainDTO attenDetail(String bno, String bno2) throws Exception;
	public List<MainDTO> lessonList() throws Exception;
	public MainDTO lessonDetail(int bno) throws Exception;
	public int lessonDetail2(String bno) throws Exception;
	public int lessonDetail3(String bno) throws Exception;
	public int lessonUpdate(MainDTO dto) throws Exception;
	public int lessonTeacher(MainDTO dto) throws Exception;
	public int lessonDelete(int bno) throws Exception;
	public int lessonInsert(MainDTO dto) throws Exception;
	public int lessonInsert2(MainDTO dto) throws Exception;
	public int attenUpdate(MainDTO dto) throws Exception;
	public int attenDeny(MainDTO dto) throws Exception;
	public List<MainDTO> serchList(String serachField, String serachText) throws Exception;
	public List<MainDTO> teacherFind() throws Exception;
	public int lessonInsert3(MainDTO dto) throws Exception;
	public int attenDbUpdate(MainDTO dto) throws Exception;
	public int attenAbsCheck(MainDTO dto) throws Exception;
	public int attenAnnUpdate(MainDTO dto) throws Exception;
	public List<MainDTO> mlessonRecycleList() throws Exception;
	public int recycleDelete(int bno) throws Exception;
	public int lessonRestore(int bno) throws Exception;
	
}

