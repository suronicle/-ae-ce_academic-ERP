
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>로그인</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="/project/main?userId="><b>로그인</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">아이디 비밀번호 입력</p>

      <form action="/login" method="post" name = "frm">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="userId" placeholder="아이디">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="userPwd" placeholder="비밀번호">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">

          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block" name="loginbtn" onclick="return loginCheck();">로그인</button>
          </div>

      	  
     		
          <!-- /.col -->
        </div>
      </form>
		     <div class="social-auth-links text-center">
		        <p>- OR -</p>
		        <a href="#" class="btn btn-block btn-primary">
		          <i class="fab fa-facebook mr-2"></i>
		          Sign up using Facebook
		        </a>
		        <a href="#" class="btn btn-block btn-danger">
		          <i class="fab fa-google-plus mr-2"></i>
		          Sign up using Google+
		        </a>
		      </div>
		   <div class="col-8">
      	  <p></p>
      	  <a href="/project/findpassword" class="text-center">비밀번호 찾기</a>
      	  </div>
      	  <div class="col-8">
      	  <p></p>
      	  <a href="/project/join" class="text-center">회원가입</a>
      	  </div>

    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>

<script src="${contextPath}/resources/dist/js/member.js"></script>
</body>
</html>
