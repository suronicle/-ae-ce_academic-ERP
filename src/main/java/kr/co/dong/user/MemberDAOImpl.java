package kr.co.dong.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.board.BoardDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlsession;
	
	private static String namespace = "kr.co.dong.memberMapper";

	@Override
	public int join(MemberDTO memberDTO) {
		
		return sqlsession.insert(namespace+".join",memberDTO);
	}

	@Override
	public Map login(Map<String, Object> map) {
	
		return sqlsession.selectOne(namespace+".login",map);
	}

	@Override
	public int idCheck(String userId) {

		return sqlsession.selectOne(namespace + ".idCheck",userId);
	}

	@Override
	public List<MemberDTO> managerConfirm() {

		return sqlsession.selectList(namespace+".managerConfirm");
	}

	@Override
	public MemberDTO confirmOne(String userId) {

		return sqlsession.selectOne(namespace+".confirmOne",userId);
	}

	@Override
	public int confirm(String userId) {

		return sqlsession.update(namespace+".confirm",userId);
	}

	@Override
	public int sAttendCount(String userId) {
	
		return sqlsession.insert(namespace+".sAttendCount",userId);
	}

	@Override
	public int tAttendCount(String userId) {

		return sqlsession.insert(namespace+".tAttendCount",userId);
	}

	@Override
	public String role(String userId) {
	
		return sqlsession.selectOne(namespace+".role",userId);
	}

	@Override
	public String getAdmin(Map<String, Object> map) {

		return sqlsession.selectOne(namespace+".getAdmin",map);
	}

	@Override
	public Map findPass(Map<String, Object> map) {
		
		return sqlsession.selectOne(namespace+".findPass",map);
	}

	@Override
	public String confirmName(String userId) {

		return sqlsession.selectOne(namespace+".confirmName",userId);
	}

	@Override
	public int changePass(MemberDTO memberDTO) {
		
		return sqlsession.update(namespace+".changePass",memberDTO);
	}

	@Override
	public int refusal(MemberDTO memberDTO) {
		
		return sqlsession.update(namespace+".refusal",memberDTO);
	}

	@Override
	public MemberDTO userInfo(String userId) {
		
		return sqlsession.selectOne(namespace+".userInfo",userId);
	}

	@Override
	public int cCount(String userId) {
	
		return sqlsession.selectOne(namespace+".cCount",userId);
	}

	@Override
	public int nCount(String userId) {
		
		return sqlsession.selectOne(namespace+".nCount",userId);
	}

	@Override
	public List<BoardDTO> boardList() {
	
		return sqlsession.selectList(namespace+".boardList");
	}

	@Override
	public int tGo(String userId) {
	
		return sqlsession.insert(namespace+".tGo",userId);
	}

	@Override
	public int tOut(String userId) {
		
		return sqlsession.insert(namespace+".tOut",userId);
	}

	@Override
	public int tGoCheck(MemberDTO memberDTO) {
		
		return sqlsession.selectOne(namespace+".tGoCheck",memberDTO);
	}

	@Override
	public MemberDTO tGoInfo(MemberDTO memberDTO) {
	
		return sqlsession.selectOne(namespace+".tGoInfo",memberDTO);
	}

	@Override
	public MemberDTO tOutInfo(MemberDTO memberDTO) {
		
		return sqlsession.selectOne(namespace+".tOutInfo",memberDTO);
	}

	@Override
	public List<MemberDTO> GoOutAll(String userId) {

		return sqlsession.selectList(namespace+".GoOutAll",userId);
	}

	@Override
	public List<MemberDTO> mailList(String userId) {
		
		return  sqlsession.selectList(namespace+".mailList",userId);
	}

	@Override
	public int mailCount(String userId) {
		
		return sqlsession.selectOne(namespace+".mailCount",userId);
	}

	@Override
	public MemberDTO mailSelect(MemberDTO memberDTO) {
		
		return sqlsession.selectOne(namespace+".mailSelect",memberDTO);
	}

	@Override
	public List<MemberDTO> emailAddress(String userId) {
		
		return sqlsession.selectList(namespace+".emailAddress",userId);
	}

	@Override
	public int emailRegister(MemberDTO memberDTO) {
		
		return sqlsession.insert(namespace+".emailRegister",memberDTO);
	}

	@Override
	public int updateMail(int mailNum) {

		return sqlsession.update(namespace+".updateMail",mailNum);
	}

	@Override
	public List<MemberDTO> sendMail(String userId) {
	
		return sqlsession.selectList(namespace+".sendMail",userId);
	}

	@Override
	public List<MemberDTO> mailDelList(String userId) {
	
		return sqlsession.selectList(namespace+".mailDelList",userId);
	}

	@Override
	public MemberDTO mailUserInfo(String userId) {
		
		return sqlsession.selectOne(namespace+".mailUserInfo",userId);
	}

	@Override
	public int mailDelete(int mailNum) {
		
		return sqlsession.update(namespace+".mailDelete",mailNum);
	}

	@Override
	public int emailCheck(String userEmail) {
		
		return sqlsession.selectOne(namespace+".emailCheck",userEmail);
	}

	@Override
	public int changeMob(MemberDTO memberDTO) {
		
		return sqlsession.update(namespace+".changeMob",memberDTO);
	}

	
	
	
	
	
	
	
	
	@Override
	public int att(String userId) {
		
		return sqlsession.selectOne(namespace+".att",userId);
	}

	@Override
	public int late(String userId) {
		
		return sqlsession.selectOne(namespace+".late",userId);
	}

	@Override
	public int ealry(String userId) {
		
		return sqlsession.selectOne(namespace+".ealry",userId);
	}

	@Override
	public int abs(String userId) {
		
		return sqlsession.selectOne(namespace+".abs",userId);
	}

	@Override
	public int attPl(String userId) {
		
		return sqlsession.update(namespace+".attPl",userId);
	}

	@Override
	public int latePl(String userId) {
		
		return sqlsession.update(namespace+".latePl",userId);
	}

	@Override
	public int ealryPl(String userId) {
		
		return sqlsession.update(namespace+".ealryPl",userId);
	}

	@Override
	public int absPl(String userId) {
		
		return sqlsession.update(namespace+".absPl",userId);
	}

	@Override
	public int latePlEalry(String userId) {
		
		return sqlsession.update(namespace+".latePlEalry",userId);
	}

	@Override
	public List<MemberDTO> mainAttend(String userId) {
		
		return sqlsession.selectList(namespace + ".mainAttend",userId);
	}

	@Override
	public int dateCount(MemberDTO dto) {

		return sqlsession.selectOne(namespace + ".dateCount", dto);
	}

	@Override
	public int regiAttend(MemberDTO dto) {

		return sqlsession.insert(namespace + ".regiAttend",dto) ;
	}

	@Override
	public List<MemberDTO> lectureInfo(String userId) {
		
		return sqlsession.selectList(namespace + ".lectureInfo",userId);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
