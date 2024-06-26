package kr.co.dong.student;

import org.springframework.web.multipart.MultipartFile;

public class StudentDTO {
	String lectureDateStart;
	String lectureDateEnd;
	String lectureName;
	String lectureContent;
	int lectureNum;

	String aId;

	String aDate;
	String aReason;
	int aAttend;
	String aConfirm;
	String aConfirmDate;
	String aDeny;
	int aLecNum;

	String userId;
	String userName;
	String userMobile;
	int userAdmin;
	int userAdminConfirm;
	String userEmail;

	String uId;
	int ulNum;

	String acId;
	int att;
	int abs;
	int late;
	int ealry;
	int ann;
	int half;

	String commId;
	String pId;
	String pName;
	String pYorN;
	String codeName;

	String aName;
	int aNum;
	int aCount;

	int studentCnt;

	int con;
	int notc;
	int den;



	MultipartFile file;
	String realFileName;
	String ranFileName;

	public int getaLecNum() {
		return aLecNum;
	}
	public void setaLecNum(int aLecNum) {
		this.aLecNum = aLecNum;
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
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
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
	public String getaReason() {
		return aReason;
	}
	public void setaReason(String aReason) {
		this.aReason = aReason;
	}
	public int getaAttend() {
		return aAttend;
	}
	public void setaAttend(int aAttend) {
		this.aAttend = aAttend;
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
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public int getUserAdmin() {
		return userAdmin;
	}
	public void setUserAdmin(int userAdmin) {
		this.userAdmin = userAdmin;
	}
	public int getUserAdminConfirm() {
		return userAdminConfirm;
	}
	public void setUserAdminConfirm(int userAdminConfirm) {
		this.userAdminConfirm = userAdminConfirm;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
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
	public String getAcId() {
		return acId;
	}
	public void setAcId(String acId) {
		this.acId = acId;
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
	public int getEalry() {
		return ealry;
	}
	public void setEalry(int ealry) {
		this.ealry = ealry;
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
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public int getaCount() {
		return aCount;
	}
	public void setaCount(int aCount) {
		this.aCount = aCount;
	}
	public int getStudentCnt() {
		return studentCnt;
	}
	public void setStudentCnt(int studentCnt) {
		this.studentCnt = studentCnt;
	}
	public int getCon() {
		return con;
	}
	public void setCon(int con) {
		this.con = con;
	}
	public int getNotc() {
		return notc;
	}
	public void setNotc(int notc) {
		this.notc = notc;
	}
	public int getDen() {
		return den;
	}
	public void setDen(int den) {
		this.den = den;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getRealFileName() {
		return realFileName;
	}
	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}
	public String getRanFileName() {
		return ranFileName;
	}
	public void setRanFileName(String ranFileName) {
		this.ranFileName = ranFileName;
	}
	@Override
	public String toString() {
		return "StudentDTO [lectureDateStart=" + lectureDateStart + ", lectureDateEnd=" + lectureDateEnd
				+ ", lectureName=" + lectureName + ", lectureContent=" + lectureContent + ", lectureNum=" + lectureNum
				+ ", aId=" + aId + ", aDate=" + aDate + ", aReason=" + aReason + ", aAttend=" + aAttend + ", aConfirm="
						+ aConfirm + ", aConfirmDate=" + aConfirmDate + ", aDeny=" + aDeny + ", userId=" + userId
						+ ", userName=" + userName + ", userMobile=" + userMobile + ", userAdmin=" + userAdmin
						+ ", userAdminConfirm=" + userAdminConfirm + ", userEmail=" + userEmail + ", uId=" + uId + ", ulNum="
								+ ulNum + ", acId=" + acId + ", att=" + att + ", abs=" + abs + ", late=" + late + ", ealry=" + ealry
								+ ", ann=" + ann + ", half=" + half + ", commId=" + commId + ", pId=" + pId + ", pName=" + pName
								+ ", pYorN=" + pYorN + ", codeName=" + codeName + ", aName=" + aName + ", aNum=" + aNum + ", aCount="
								+ aCount + ", studentCnt=" + studentCnt + ", con=" + con + ", notc=" + notc + ", den=" + den
								+ ", aLecNum=" + aLecNum + ", file=" + file + ", realFileName=" + realFileName + ", ranFileName="
								+ ranFileName + "]";
	}


}