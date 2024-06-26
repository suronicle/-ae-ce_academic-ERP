function refusalCheck(){

	  if (document.frm.userRefusal.value == "") {
      alert("사유를 입력해주세요.");
      frm.userRefusal.focus();
      return false;
   }
   if (document.frm.userRefusal.value.length > 10) {
      alert("10글자 이하로 작성해주세요.");
      frm.userRefusal.focus();
      return false;
   }
   
   
return true;

}