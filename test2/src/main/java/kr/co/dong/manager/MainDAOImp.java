package kr.co.dong.manager;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAOImp implements MainDAO {
	
	@Autowired
	private SqlSession sqlsession;
	private static final String namespace = "kr.co.dong.mainMapper";
	
	@Override
	public List<MainDTO> attenList() {
		return sqlsession.selectList(namespace + ".attenList");
	
	}

	@Override
	public MainDTO attenDetail(String bno, String bno2) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("aId", bno);
		data.put("aDate", bno2);
		return sqlsession.selectOne(namespace + ".attenDetail", data);
	}

	@Override
	public List<MainDTO> lessonList() {
		return sqlsession.selectList(namespace + ".lessonList");
	}

	@Override
	public MainDTO lessonDetail(int bno) {
		return sqlsession.selectOne(namespace + ".lessonDetail", bno);
	}
	
	public int lessonDetail2(String bno) {
		return sqlsession.selectOne(namespace + ".lessonDetail2", bno);
	}
	
	public int lessonDetail3(String bno) {
		return sqlsession.selectOne(namespace + ".lessonDetail3", bno);
	}

	@Override
	public int lessonUpdate(MainDTO dto) {
		return sqlsession.update(namespace + ".lessonUpdate", dto);
	}
	
	public int lessonTeacher(MainDTO dto) {
		return sqlsession.update(namespace + ".lessonTeacher", dto);
	}

	@Override
	public int lessonDelete(int bno) {
		return sqlsession.delete(namespace + ".lessonDelete", bno);
	}

	@Override
	public int lessonInsert(MainDTO dto) {
		return sqlsession.insert(namespace + ".lessonInsert", dto);
	}
	
	public int attenUpdate(MainDTO dto) {
		return sqlsession.update(namespace + ".attenUpdate", dto);
	}
	
	public int attenDeny(MainDTO dto) {
		return sqlsession.update(namespace + ".attenDeny", dto);
	}
	
	public List<MainDTO> serchList(String serachField, String serachText) {
		HashMap<String, Object> data = new HashMap<String, Object>();
	    data.put("serachField", serachField);
	    data.put("serachText", serachText);
		
		return sqlsession.selectList(namespace + ".serchList", data);
	}
	
	public List<MainDTO> teacherFind() {
		return sqlsession.selectList(namespace + ".teacherFind");
	}
	
	public int lessonInsert2(MainDTO dto) {
		return sqlsession.insert(namespace + ".lessonInsert2", dto); 
	}
	
	public int lessonInsert3(MainDTO dto) {
		return sqlsession.insert(namespace + ".lessonInsert3", dto);
	}
	
	public int attenDbUpdate(MainDTO dto) {
		return sqlsession.update(namespace + ".attenDbUpdate", dto);
	}
	
	public int attenAbsCheck(MainDTO dto) {
		return sqlsession.update(namespace + ".attenAbsCheck", dto);
	}
	
	public int attenAnnUpdate(MainDTO dto) {
		return sqlsession.update(namespace + ".attenAnnUpdate", dto);
	}
	
	public List<MainDTO> mlessonRecycleList() {
		return sqlsession.selectList(namespace + ".mlessonRecycleList");
	}
	
	public int recycleDelete(int bno) {
		return sqlsession.delete(namespace + ".recycleDelete", bno);
	}
	
	public int lessonRestore(int bno) {
		return sqlsession.update(namespace + ".lessonRestore", bno);
	}
	


	
	
}
