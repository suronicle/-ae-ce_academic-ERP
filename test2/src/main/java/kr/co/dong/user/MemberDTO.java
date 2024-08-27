package kr.co.dong.user;

public class MemberDTO {

	//user
	String userId;
	String userName;
	String userPwd;
	String userMobile;
	String userAdmin;
	String userAdminConfirm;
	String userEmail;
	String userRefusal;

	//attend
	int aNum;
	String aName;
	int aCount;

	//attendCount
	String acId;
	int ann;
	int half;
	int att;
	int abs;
	int late;
	int early;

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
	String boardId;



	//attendance
	String aId;
	String aDate;
	int aAttend;
	String aReason;
	String aConfirm;
	String aConfirmDate;
	String aDeny;
	
	
	
	//mail
	String sendId;
	String receiveId;
	String mailTitle;
	String mailContent;
	String mailDate;
	int mailNum;
	int mailCount;
	int mailDel;
	
	
	//lecture
	int lectureNum;
	String lectureName;
	
	
	
	
	
	
	
	
	public int getMailDel() {
		return mailDel;
	}
	public void setMailDel(int mailDel) {
		this.mailDel = mailDel;
	}
	public int getMailCount() {
		return mailCount;
	}
	public void setMailCount(int mailCount) {
		this.mailCount = mailCount;
	}
	public int getMailNum() {
		return mailNum;
	}
	public void setMailNum(int mailNum) {
		this.mailNum = mailNum;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getMailTitle() {
		return mailTitle;
	}
	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	public String getMailDate() {
		return mailDate;
	}
	public void setMailDate(String mailDate) {
		this.mailDate = mailDate;
	}
	public int getAtt() {
		return att;
	}
	public void setAtt(int att) {
		this.att = att;
	}
	public int getAbs() {
		return abs;
	}
	public void setAbs(int abs) {
		this.abs = abs;
	}
	public int getLate() {
		return late;
	}
	public void setLate(int late) {
		this.late = late;
	}
	public int getEarly() {
		return early;
	}
	public void setEarly(int early) {
		this.early = early;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public String getUserAdmin() {
		return userAdmin;
	}
	public void setUserAdmin(String userAdmin) {
		this.userAdmin = userAdmin;
	}
	public String getUserAdminConfirm() {
		return userAdminConfirm;
	}
	public void setUserAdminConfirm(String userAdminConfirm) {
		this.userAdminConfirm = userAdminConfirm;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserRefusal() {
		return userRefusal;
	}
	public void setUserRefusal(String userRefusal) {
		this.userRefusal = userRefusal;
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
	public String getAcId() {
		return acId;
	}
	public void setAcId(String acId) {
		this.acId = acId;
	}
	public int getAnn() {
		return ann;
	}
	public void setAnn(int ann) {
		this.ann = ann;
	}
	public int getHalf() {
		return half;
	}
	public void setHalf(int half) {
		this.half = half;
	}
	public String getCommId() {
		return commId;
	}
	public void setCommId(String commId) {
		this.commId = commId;
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
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardUserId() {
		return boardUserId;
	}
	public void setBoardUserId(String boardUserId) {
		this.boardUserId = boardUserId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardDel() {
		return boardDel;
	}
	public void setBoardDel(int boardDel) {
		this.boardDel = boardDel;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public String getBoardEtc() {
		return boardEtc;
	}
	public void setBoardEtc(String boardEtc) {
		this.boardEtc = boardEtc;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
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
	public String getaDeny() {
		return aDeny;
	}
	public void setaDeny(String aDeny) {
		this.aDeny = aDeny;
	}
	
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", userMobile="
				+ userMobile + ", userAdmin=" + userAdmin + ", userAdminConfirm=" + userAdminConfirm + ", userEmail="
				+ userEmail + ", userRefusal=" + userRefusal + ", aNum=" + aNum + ", aName=" + aName + ", aCount="
				+ aCount + ", acId=" + acId + ", ann=" + ann + ", half=" + half + ", att=" + att + ", abs=" + abs
				+ ", late=" + late + ", early=" + early + ", commId=" + commId + ", pId=" + pId + ", pName=" + pName
				+ ", pYorN=" + pYorN + ", codeName=" + codeName + ", boardNum=" + boardNum + ", boardUserId="
				+ boardUserId + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardDate="
				+ boardDate + ", boardDel=" + boardDel + ", boardCount=" + boardCount + ", boardEtc=" + boardEtc
				+ ", boardId=" + boardId + ", aId=" + aId + ", aDate=" + aDate + ", aAttend=" + aAttend + ", aReason="
				+ aReason + ", aConfirm=" + aConfirm + ", aConfirmDate=" + aConfirmDate + ", aDeny=" + aDeny
				+ ", sendId=" + sendId + ", receiveId=" + receiveId + ", mailTitle=" + mailTitle + ", mailContent="
				+ mailContent + ", mailDate=" + mailDate + ", mailNum=" + mailNum + ", mailCount=" + mailCount
				+ ", mailDel=" + mailDel + ", lectureNum=" + lectureNum + ", lectureName=" + lectureName + "]";
	}

	


}
