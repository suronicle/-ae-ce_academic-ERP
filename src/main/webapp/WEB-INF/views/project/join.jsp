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
  <title>회원가입</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">

</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<b><a href="/project/main?userId=">회원가입</a></b>
		</div>

		<div class="card">
			<div class="card-body register-card-body">
				<p class="login-box-msg">가입하기</p>

				<form action="/join" method="post" name="frm">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="이름"
							name="userName" id="userName">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="userId"
							placeholder="아이디 (4글자 이상)" id="userId">
						
						<input type="hidden" class="form-control" name="userIdCheck"
						id="userIdCheck">
						<div class="input-group-append">

							<div class="input-group-text"></div>
							<input type="button" class="btn btn-secondary btn-block"
								value="중복체크" onclick="return idCheck()">
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPwd" id="userPwd">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>

					<div class="input-group mb-3">
						<input type="password" class="form-control"
							placeholder="비밀번호 확인" name="userPwdCheck"
							id="userPwdCheck">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>

					<div class="input-group mb-3">
						<input type="email" class="form-control" name="userEmail"
							placeholder="이메일" id="userEmail">
							<input type="hidden" class="form-control" name="userEmailCheck"
								id="userEmailCheck">
						<div class="input-group-append">

							<div class="input-group-text"></div>
							<input type="button" class="btn btn-secondary btn-block"
								value="중복체크" onclick="return emailCheck()">
						</div>
						
					</div>
						
						
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="userMobile"
							placeholder="전화번호 : ex)01022221211" id="userMobile">
						<div class="input-group-append">
							<div class="input-group-text"></div>
						</div>
					</div>




					<div class="row">
						<div class="col-8">
							<div class="form-group">
								<select class="custom-select" name="userAdmin" id="userAdmin">
									<option value="" style="text-align:center;">======직책======</option>
									<option value="001" style="text-align:center;" >학원생</option>
									<option value="002" style="text-align:center;">강사</option>
									<option value="003" style="text-align:center;">관리자</option>
								</select>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<input type="submit" name="joinbtn"
								class="btn btn-primary btn-block" onclick="return joinCheck()"
								value="가입">
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
 				<a href="/project/login" class="text-center">이미 가입 되어있습니다.</a>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->


<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>

<script src="${contextPath}/resources/dist/js/member.js"></script>

</body>
</html>
