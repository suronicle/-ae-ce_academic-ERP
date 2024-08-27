package kr.co.dong.manager;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class MainDTO {
	
	//user
	String userId; // 아이디
	String userName; // 이름
	String userPwd; // 비밀번호
	String userMobile; // 전화번호
	String userAdmin; // 직책
	String userAdminConfirm; // 가입승인
	
	//userlecture
	String uId; // 유저 아이디
	int ulNum; // 강의 번호
	
	//lecture
	int lectureNum; // 강의 번호
	String lectureName; // 강의 이름
	String lectureContent; // 강의 내용
	String lectureDateStart; // 강의 시작 날짜
	String lectureDateEnd; // 강의 끝난 날짜
	int lecDel; // 강의 삭제 여부
	
	//attend
	int aNum; // 출석 번호
	String aName; // 출석 이름
	int aCount; // 출석 기준
	
	//attendance
	String aId; // 아이디
	String aDate; // 작성 날짜
	int aAttend; // 출석 여부
	String aReason; // 사유
	String aConfirm; // 승인 여부
	String aConfirmDate; // 승인 날짜
	String aDeny; // 반려 이유
	String realFileName; // 출결 첨부 파일
	String ranFileName; // 출결 첨부 파일 이름
	
	//attendcount
	String acId; // 아이디
	int att; // 출석
	int abs; // 결석 / 미출석
	int late; // 지각
	int ealry; // 조퇴
	int ann; // 연차
	int half; // 반차
	
	//codetable
	String commId;
	String pId;
	String pName;
	String pYorN;
	String codeName;
	
	//board
	int boardNum;
	String boardUserId;
	String boardTitle;
	String boardContent;
	String boardDate;
	int boardDel;
	int boardCount;
	String boardEtc;
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public int getaCount() {
		return aCount;
	}
	public void setaCount(int aCount) {
		this.aCount = aCount;
	}
	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public String getaDate() {
		return aDate;
	}
	public void setaDate(String aDate) {
		this.aDate = aDate;
	}
	public int getaAttend() {
		return aAttend;
	}
	public void setaAttend(int aAttend) {
		this.aAttend = aAttend;
	}
	public String getaReason() {
		return aReason;
	}
	public void setaReason(String aReason) {
		this.aReason = aReason;
	}
	public String getaConfirm() {
		return aConfirm;
	}
	public void setaConfirm(String aConfirm) {
		this.aConfirm = aConfirm;
	}
	public String getaConfirmDate() {
		return aConfirmDate;
	}
	public void setaConfirmDate(String aConfirmDate) {
		this.aConfirmDate = aConfirmDate;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpYorN() {
		return pYorN;
	}
	public void setpYorN(String pYorN) {
		this.pYorN = pYorN;
	}
	
	public void setlecDel(int lecDel) {
		this.lecDel = lecDel;
	}
	
	public int getlecDel() {
		return lecDel;
	}
	
	public String getaDeny() {
		return aDeny;
	}
	
	public void setaDenyt(String aDeny) {
		this.aDeny = aDeny;
	}
	
	public void setboardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	
	public int getboardNum() {
		return boardNum;
	}
	
	public void boardUserId(String boardUserId) {
		this.boardUserId = boardUserId;
	}
	
	public String boardUserId() {
		return boardUserId;
	}
	
	public void boardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	
	public String boardTitle() {
		return boardTitle;
	}
	
	public void boardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	
	public String boardContent() {
		return boardContent;
	}
	
	public void boardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	
	public String boardDate() {
		return boardDate;
	}
	
	public void boardDel(int boardDel) {
		this.boardDel = boardDel;
	}
	
	public int boardDel() {
		return boardDel;
	}
	
	public void boardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	
	public int boardCount() {
		return boardCount;
	}
	
	public void boardEtc(String boardEtc) {
		this.boardEtc = boardEtc;
	}
	
	public String boardEtc() {
		return boardEtc;
	}



}
