package kr.co.dong.teacher;

public class TeacherDTO {

	//lecture
	int lectureNum;
	String lectureName;
	String lectureContent;
	String lectureDateStart;
	String lectureDateEnd;
	int lecDel;

	//userlecture
	String uId;
	int ulNum;

	//user
	String userId;
	String userName;
	String userPwd;
	String userMobile;
	String userAdmin;
	String userAdminConfirm;
	String userEmail;
	String userRefusal;

	//attendance
	String aId;
	String aDate;
	int aAttend;
	String aReason;
	String aConfirm;
	String aConfirmDate;
	String aDeny;
	int aDel;
	int aLecNum;

	//codetable
	String commId;
	String pId;
	String pName;
	String pYorN;
	String codeName;


	//attendCount;
	String acId;
	int ann;
	int half;


	//attend
	int aNum;
	String aName;
	int aCount;

	//board
	int boardNum;
	String boardUserId;
	String boardTitle;
	String boardContent;
	String boardDate;
	int boardDel;
	int boardCount;
	String boardEtc;





	public int getaLecNum() {
		return aLecNum;
	}
	public void setaLecNum(int aLecNum) {
		this.aLecNum = aLecNum;
	}
	public int getaDel() {
		return aDel;
	}
	public void setaDel(int aDel) {
		this.aDel = aDel;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
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
	public String getLectureContent() {
		return lectureContent;
	}
	public void setLectureContent(String lectureContent) {
		this.lectureContent = lectureContent;
	}
	public String getLectureDateStart() {
		return lectureDateStart;
	}
	public void setLectureDateStart(String lectureDateStart) {
		this.lectureDateStart = lectureDateStart;
	}
	public String getLectureDateEnd() {
		return lectureDateEnd;
	}
	public void setLectureDateEnd(String lectureDateEnd) {
		this.lectureDateEnd = lectureDateEnd;
	}
	public int getLecDel() {
		return lecDel;
	}
	public void setLecDel(int lecDel) {
		this.lecDel = lecDel;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public int getUlNum() {
		return ulNum;
	}
	public void setUlNum(int ulNum) {
		this.ulNum = ulNum;
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
	public String getUserRefusal() {
		return userRefusal;
	}
	public void setUserRefusal(String userRefusal) {
		this.userRefusal = userRefusal;
	}
	@Override
	public String toString() {
		return "TeacherDTO [lectureNum=" + lectureNum + ", lectureName=" + lectureName + ", lectureContent="
				+ lectureContent + ", lectureDateStart=" + lectureDateStart + ", lectureDateEnd=" + lectureDateEnd
				+ ", lecDel=" + lecDel + ", uId=" + uId + ", ulNum=" + ulNum + ", userId=" + userId + ", userName="
				+ userName + ", userPwd=" + userPwd + ", userMobile=" + userMobile + ", userAdmin=" + userAdmin
				+ ", userAdminConfirm=" + userAdminConfirm + ", userEmail=" + userEmail + ", userRefusal=" + userRefusal
				+ ", aId=" + aId + ", aDate=" + aDate + ", aAttend=" + aAttend + ", aReason=" + aReason + ", aConfirm="
				+ aConfirm + ", aConfirmDate=" + aConfirmDate + ", aDeny=" + aDeny + ", aDel=" + aDel + ", aLecNum="
				+ aLecNum + ", commId=" + commId + ", pId=" + pId + ", pName=" + pName + ", pYorN=" + pYorN
				+ ", codeName=" + codeName + ", acId=" + acId + ", ann=" + ann + ", half=" + half + ", aNum=" + aNum
				+ ", aName=" + aName + ", aCount=" + aCount + ", boardNum=" + boardNum + ", boardUserId=" + boardUserId
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardDate=" + boardDate
				+ ", boardDel=" + boardDel + ", boardCount=" + boardCount + ", boardEtc=" + boardEtc + "]";
	}
	






}
