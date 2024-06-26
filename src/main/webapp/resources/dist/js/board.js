function registerCheck(){
	   if (document.frm.boardTitle.value == "") {
       alert("제목을 입력하셔야합니다.");
       frm.boardTitle.focus();
       return false;
      }
       if (document.frm.boardContent.value == "") {
       alert("내용을 입력하셔야합니다.");
       frm.boardContent.focus();
       return false;
      }
       if (document.frm.boardId.value == "10") {
       alert("게시판 종류를 선택하셔야합니다.");
       return false;
      }
      if(document.frm.boardUserId.value != document.frm.idCheck.value){
      alert("작성자가 아니라 수정할 수 없습니다.");
      return false;
      }
	
   return true;
   
}

function goBack(){
	history.back();

}

function deleteCheck(){

	if(document.frm.boardUserId.value != document.frm.idCheck.value){
      alert("작성자가 아니라 삭제할 수 없습니다.");
      return false;
      }
  return true;
}

