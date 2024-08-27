package kr.co.dong.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.board.BoardDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int join(MemberDTO memberDTO) {
		
		return memberDAO.join(memberDTO);
	}

	@Override
	public Map login(Map<String, Object> map) {

		return memberDAO.login(map);
	}

	@Override
	public int idCheck(String userId) {

		return memberDAO.idCheck(userId);
	}

	@Override
	public List<MemberDTO> managerConfirm() {
	
		return memberDAO.managerConfirm();
	}

	@Override
	public MemberDTO confirmOne(String userId) {

		return memberDAO.confirmOne(userId);
	}

	@Override
	public int confirm(String userId) {
		
		return memberDAO.confirm(userId);
	}

	@Override
	public int sAttendCount(String userId) {

		return memberDAO.sAttendCount(userId);
	}

	@Override
	public int tAttendCount(String userId) {
		
		return memberDAO.tAttendCount(userId);
	}

	@Override
	public String role(String userId) {

		return memberDAO.role(userId);
	}

	@Override
	public String getAdmin(Map<String, Object> map) {
		
		return memberDAO.getAdmin(map);
	}

	@Override
	public Map findPass(Map<String, Object> map) {

		return memberDAO.findPass(map);
	}

	@Override
	public String confirmName(String userId) {

		return memberDAO.confirmName(userId);
	}

	@Override
	public int changePass(MemberDTO memberDTO) {
	
		return memberDAO.changePass(memberDTO);
	}

	@Override
	public int refusal(MemberDTO memberDTO) {
		
		return memberDAO.refusal(memberDTO);
	}

	@Override
	public MemberDTO userInfo(String userId) {
	
		return memberDAO.userInfo(userId);
	}

	@Override
	public int cCount(String userId) {
		
		return memberDAO.cCount(userId);
	}

	@Override
	public int nCount(String userId) {
	
		return memberDAO.nCount(userId);
	}

	@Override
	public List<BoardDTO> boardList() {
	
		return memberDAO.boardList();
	}

	@Override
	public int tGo(String userId) {

		return memberDAO.tGo(userId);
	}

	@Override
	public int tOut(String userId) {

		return memberDAO.tOut(userId);
	}

	@Override
	public int tGoCheck(MemberDTO memberDTO) {
		
		return memberDAO.tGoCheck(memberDTO);
	}

	@Override
	public MemberDTO tGoInfo(MemberDTO memberDTO) {
	
		return memberDAO.tGoInfo(memberDTO);
	}

	@Override
	public MemberDTO tOutInfo(MemberDTO memberDTO) {
	
		return memberDAO.tOutInfo(memberDTO);
	}

	@Override
	public List<MemberDTO> GoOutAll(String userId) {
		
		return memberDAO.GoOutAll(userId);
	}

	@Override
	public List<MemberDTO> mailList(String userId) {
	
		return memberDAO.mailList(userId);
	}

	@Override
	public int mailCount(String userId) {
		
		return memberDAO.mailCount(userId);
	}

	@Override
	public MemberDTO mailSelect(MemberDTO memberDTO) {
	
		return memberDAO.mailSelect(memberDTO);
	}

	@Override
	public List<MemberDTO> emailAddress(String userId) {
		
		return memberDAO.emailAddress(userId);
	}

	@Override
	public int emailRegister(MemberDTO memberDTO) {
	
		return memberDAO.emailRegister(memberDTO);
	}

	@Override
	public int updateMail(int mailNum) {
		
		return memberDAO.updateMail(mailNum);
	}

	@Override
	public List<MemberDTO> sendMail(String userId) {
		
		return memberDAO.sendMail(userId);
	}

	@Override
	public List<MemberDTO> mailDelList(String userId) {

		return memberDAO.mailDelList(userId);
	}

	@Override
	public MemberDTO mailUserInfo(String userId) {

		return memberDAO.mailUserInfo(userId);
	}

	@Override
	public int mailDelete(int mailNum) {
	
		return memberDAO.mailDelete(mailNum);
	}

	@Override
	public int emailCheck(String userEmail) {

		return memberDAO.emailCheck(userEmail);
	}

	@Override
	public int changeMob(MemberDTO memberDTO) {
	
		return memberDAO.changeMob(memberDTO);
	}

	@Override
	public int att(String userId) {
		
		return memberDAO.att(userId);
	}

	@Override
	public int late(String userId) {
		
		return memberDAO.late(userId);
	}

	@Override
	public int ealry(String userId) {

		return memberDAO.ealry(userId);
	}

	@Override
	public int abs(String userId) {

		return memberDAO.abs(userId);
	}

	@Override
	public int attPl(String userId) {

		return memberDAO.attPl(userId);
	}

	@Override
	public int latePl(String userId) {

		return memberDAO.latePl(userId);
	}

	@Override
	public int ealryPl(String userId) {

		return memberDAO.ealryPl(userId);
	}

	@Override
	public int absPl(String userId) {

		return memberDAO.absPl(userId);
	}

	@Override
	public int latePlEalry(String userId) {

		return memberDAO.latePlEalry(userId);
	}

	@Override
	public List<MemberDTO> mainAttend(String userId) {

		return memberDAO.mainAttend(userId);
	}

	@Override
	public int dateCount(MemberDTO dto) {
		
		return memberDAO.dateCount(dto);
	}

	@Override
	public int regiAttend(MemberDTO dto) {
		
		return memberDAO.regiAttend(dto);
	}

	@Override
	public List<MemberDTO> lectureInfo(String userId) {
		
		return memberDAO.lectureInfo(userId);
	}






}
