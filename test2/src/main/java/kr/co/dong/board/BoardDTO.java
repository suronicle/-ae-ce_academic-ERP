package kr.co.dong.board;

public class BoardDTO {

	//user
	String userId;
	String userName;
	String userPwd;
	String userMobile;
	String userAdmin;
	String userAdminConfirm;
	String userEmail;
	String userRefusal;

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


	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
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
	
	
	public String getUserRefusal() {
		return userRefusal;
	}
	public void setUserRefusal(String userRefusal) {
		this.userRefusal = userRefusal;
	}
	@Override
	public String toString() {
		return "BoardDTO [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", userMobile="
				+ userMobile + ", userAdmin=" + userAdmin + ", userAdminConfirm=" + userAdminConfirm + ", userEmail="
				+ userEmail + ", userRefusal=" + userRefusal + ", commId=" + commId + ", pId=" + pId + ", pName="
				+ pName + ", pYorN=" + pYorN + ", codeName=" + codeName + ", boardNum=" + boardNum + ", boardUserId="
				+ boardUserId + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardDate="
				+ boardDate + ", boardDel=" + boardDel + ", boardCount=" + boardCount + ", boardEtc=" + boardEtc
				+ ", boardId=" + boardId + "]";
	}
	
	






}
