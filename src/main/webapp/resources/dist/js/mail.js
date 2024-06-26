function addressCheck() {

   var url = "address?userId=" + document.frm.userId.value;
   window.open(url, "_blank_1",
               "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=800, height=600");
        
}

function useAddress(userEmail,userId) {
            // 부모 창의 document 객체에 접근
            var parentDocument = window.opener.document;
            
            // 부모 창의 ID 입력 필드에 사용자가 입력한 값 설정
            parentDocument.getElementById('userEmail').value = userEmail;
            parentDocument.getElementById('receiveId').value = userId;
            
            // 부모 창의 ID 입력 필드를 비활성화
            parentDocument.getElementById('userEmail').disabled = true;
            
            // 자식 창 닫기
            window.close();
}

function goBack(){

	window.history.back();

}

function sendMail(){

	if (document.frm.receiveId.value == "") {
      alert('메일을 주소록에서 선택하여 주십시오.');
      document.frm.receiveId.focus();
	 return false;
 }
 
 
	if (document.frm.mailTitle.value == "") {
      alert('제목을 입력하여 주십시오.');
      document.frm.mailTitle.focus();
	 return false;
 }
 
 if (document.frm.mailTitle.value.length >10) {
      alert('제목이 너무 깁니다. 10글자 이하로 작성해주세요.');
      document.frm.mailTitle.focus();
	 return false;
 }
 
 
	return true;
}



	
	
	























