function attendRegister() {
   if (document.frm.aReason.value.length == 0) {
      alert("사유를 작성해주세요.");
      frm.aReason.focus();
      return false;
   }
   if (document.frm.aDate.value.length == 0) {
      alert("날짜를 작성해주세요.");
      frm.aDate.focus();
      return false;
   }
    if (document.frm.aAttend.value== 10) {
      alert("근태 명을 선택해주세요.");
      frm.aAttend.focus();
      return false;
   }
   return true;
}

function attendRewrite() {
   if (document.frm.aReason.value.length == 0) {
      alert("사유를 작성해주세요.");
      frm.aReason.focus();
      return false;
   }

    if (document.frm.aAttend.value== 'none') {
      alert("근태 명을 선택해주세요.");
      frm.aAttend.focus();
      return false;
   }
   return true;
}


function sSearch() {
 if (document.frm.aDate.value == "") {
      alert('날짜를 입력하여 주십시오.');
      document.frm.aDate.focus();
      return;
   }
   
 	var url = "sPInfo?aDate=" + document.frm.aDate.value;
    window.open(url, "_blank_1",
               "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=400");

}



function tSearch(){
 	if (document.search.aAttend.value == "10") {
  		alert('근태명을 선택해주세요.');
  		
     	   return false;
	 }
	 	if (document.search.aAttend.value == "4") {
  		alert('연차 목록을 선택하였습니다');
  		
     	   return;
	 }
	 	if (document.search.aAttend.value == "5") {
  		alert('반차 목록을 선택하였습니다.');
  		
     	   return;
	 }
	   return true;
}

