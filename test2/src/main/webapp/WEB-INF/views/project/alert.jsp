<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>ALERT</title>
</head>
<body>

	<script>
    var msg = "${msg}";
    var url = "${url}";
    
    alert(msg);
    location.href = url;
    
    if(msg === "변경되었습니다.") {
        // 비밀번호 변경되었을 때 //전화번호 변경
        window.close();
        window.opener.location.reload();
    }
    if(msg === "취소되었습니다.") {
        // 학생 취소했을 때
       
        window.close();
        window.opener.location.reload();
    }
    if(msg === "승인 반려되었습니다.") {
        // 가입 승인 반려
       
        window.close();
        window.opener.location.reload();
    }
    if(msg === "메일을 선택하였습니다.") {
        // 메일 선택했을때
        window.close();
        window.opener.location.reload();
    }
    
    
</script>

</body>
</html>