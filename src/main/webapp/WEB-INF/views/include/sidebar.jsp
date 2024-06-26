<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>내 정보</h5>
      <p></p>
      <p>이름 : ${user.userName }</p>
       <p>아이디 :  ${user.userId }</p>
        <p>직책 :  ${user.pName }</p>
         <p>이메일 :  ${user.userEmail}</p>
          <p>전화번호 :  ${user.userMobile }</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->


</body>
</html>