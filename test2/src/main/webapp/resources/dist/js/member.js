function loginCheck() {
   if (document.frm.userId.value.length == 0) {
      alert("아이디를 써주세요");
      frm.userId.focus();
      return false;
   }
   if (document.frm.userPwd.value == "") {
      alert("암호는 반드시 입력해야 합니다.");
      frm.userPwd.focus();
      return false;
   }
   return true;
}

function idCheckCheck(){
 if (document.frm.userId.value == "") {
      alert('아이디를 입력하여 주십시오.');
      document.frm.userId.focus();
 return false;
   }
   if (document.frm.userId.value.length <4) {
      alert('아이디는 4글자 이상을 입력해주세요.');
      document.frm.userId.focus();
   return false;
   }
return true;
}


function idCheck() {
if (document.frm.userId.value == "") {
      alert('아이디를 입력하여 주십시오.');
      document.frm.userId.focus();
 	return;
   }
   if (document.frm.userId.value.length <4) {
      alert('아이디는 4글자 이상을 입력해주세요.');
      document.frm.userId.focus();
   return;
   }
   var url = "idCheck?userId=" + document.frm.userId.value;
   window.open(url, "_blank_1",
               "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=400");
        
}

function emailCheck() {
if (document.frm.userEmail.value == "") {
      alert('이메일을 입력하여 주십시오.');
      document.frm.userEmail.focus();
 	return;
   }
   var email = document.getElementById("userEmail").value;
   var Emailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
      if (!Emailreg.test(email)) {
		alert('이메일을 형식에 맞게 입력해주세요.');
		frm.userEmail.focus();
		return false;
	} 	

   var url = "emailCheck?userEmail=" + document.frm.userEmail.value;
   window.open(url, "_blank_1",
               "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=400");
        
}

function emailCheckCheck(){
   var email = document.getElementById("userEmail").value;
   var Emailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

 if (document.frm.userEmail.value == "") {
      alert('이메일을 입력하여 주십시오.');
      document.frm.userEmail.focus();
 return false;
   }
   
   if (!Emailreg.test(email)) {
		alert('이메일을 형식에 맞게 입력해주세요.');
		frm.userEmail.focus();
		return false;
	} 	
return true;
}


function idOk() {
    // 사용자가 입력한 ID 값을 가져옴
    var userIdValue = document.getElementById('userId').value;
    
    // 부모 창으로 전달하기 위해 부모 창의 document 객체에 접근
    var parentDocument = window.opener.document;
    
    // 부모 창의 ID 입력 필드에 사용자가 입력한 값 설정
    parentDocument.getElementById('userId').value = userIdValue;
    parentDocument.getElementById('userIdCheck').value = userIdValue;
    
    
    // 부모 창의 ID 입력 필드를 비활성화
    parentDocument.getElementById('userId').readOnly= true;
    
    // 자식 창 닫기
    window.close();
}

function emailOk() {
    // 사용자가 입력한 ID 값을 가져옴
    var userEmailValue = document.getElementById('userEmail').value;
    
    // 부모 창으로 전달하기 위해 부모 창의 document 객체에 접근
    var parentDocument = window.opener.document;
    
    // 부모 창의 ID 입력 필드에 사용자가 입력한 값 설정
    parentDocument.getElementById('userEmail').value = userEmailValue;
    parentDocument.getElementById('userEmailCheck').value = userEmailValue;
    
    
    // 부모 창의 ID 입력 필드를 비활성화
    parentDocument.getElementById('userEmail').readOnly= true;
    
    // 자식 창 닫기
    window.close();
}



function pwCheck(){


  var url = "changepassword?userId=" + document.frm.userId.value+"&userPwd="+document.frm.userPwd.value;
   window.open(url, "_blank_1",
               "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=400");
   
	

}



function pwChange(){
	   if (document.frm.userPwd.value == "") {
       alert("암호는 반드시 입력해야 합니다.");
       frm.userPwd.focus();
       return false;
      }
      if (document.frm.userPwd.value != document.frm.userPwdCheck.value) {
      alert("암호가 일치하지 않습니다.");
      frm.userPwd.focus();
      return false;
   }
	
   return true;
   
}


function mobileCheck(){


  var url = "changemobile?userId=" + document.frm.userId.value+"&userMobile="+document.frm.userMobile.value;
   window.open(url, "_blank_1",
               "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=400");
   
	

}



function mobileChange(){
	   if (document.frm.userMobile.value == "") {
       alert("전화번호는 반드시 입력해야 합니다.");
       frm.userMobile.focus();
       return false;
      }
     var phone = document.getElementById("userMobile").value;
  	 var Phonereg = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
  	 if (!Phonereg.test(phone)) {
		alert('전화번호를 형식에 맞게 입력해주세요.');
		frm.userMobile.focus();
		return false;
	} 
	
   return true;
   
}


















function joinCheck() {
   if (document.frm.userName.value.length == 0) {
      alert("이름을 써주세요.");
      frm.userName.focus();
      return false;
   }
   if (document.frm.userId.value.length == 0) {
      alert("아이디를 써주세요");
      frm.userId.focus();
      return false;
   }
   if (document.frm.userId.value.length < 4) {
      alert("아이디는 4글자이상이어야 합니다.");
      frm.userId.focus();
      return false;
   }
   if (document.frm.userPwd.value == "") {
      alert("암호는 반드시 입력해야 합니다.");
      frm.userPwd.focus();
      return false;
   }
   if (document.frm.userPwd.value != document.frm.userPwdCheck.value) {
      alert("암호가 일치하지 않습니다.");
      frm.userPwd.focus();
      return false;
   }
  if (document.frm.userMobile.value.length == 0) {
      alert("전화번호를 입력해주세요");
      frm.userMobile.focus();
      return false;
   }   
   
   if (document.frm.userAdmin.value == "") {
      alert("직책을 선택해주세요");
      frm.userAdmin.focus();
      return false;
   }
   
   if (document.frm.userAdmin.value == "") {
      alert("직책을 선택해주세요");
      return false;
   }
    if (document.frm.userEmail.value.length == 0) {
      alert("이메일을 입력해주세요");
      frm.userEmail.focus();
      return false;
   }

  if (document.frm.userIdCheck.value.length == 0) {
      alert("아이디 중복체크를 진행해주세요");
      frm.userId.focus();
      return false;
   }

  if (document.frm.userEmailCheck.value.length == 0) {
      alert("이메일 중복체크를 진행해주세요");
      frm.userEmail.focus();
      return false;
   }
   //정규식
   
   var phone = document.getElementById("userMobile").value;
   var Phonereg = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
   if (!Phonereg.test(phone)) {
		alert('전화번호를 형식에 맞게 입력해주세요.');
		frm.userMobile.focus();
		return false;
	} 
   
   var email = document.getElementById("userEmail").value;
   var Emailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
   if (!Emailreg.test(email)) {
		alert('이메일을 형식에 맞게 입력해주세요.');
		frm.userEmail.focus();
		return false;
	} 	
   

   
   return true;
}