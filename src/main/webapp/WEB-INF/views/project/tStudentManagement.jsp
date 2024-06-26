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
  <title>학생관리</title>

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
			<b>학생 관리</b>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">학생 정보</p>

				<form action="/tStudentDelete" method="post">
					<!-- Profile Image -->
					<div class="card card-primary card-outline">
						<div class="card-body box-profile">

							<div class="text-center">

								<img class="profile-user-img img-fluid img-circle"
									src="${contextPath}/resources/dist/img/person.png"
									alt="User profile picture">

							</div>

							<h3 class="profile-username text-center">${student.userName}</h3>

							<p class="text-muted text-center">${student.userId}</p>

							<ul class="list-group list-group-unbordered mb-3">
								<li class="list-group-item"><b>전화번호</b> <a
									class="float-right">${student.userMobile}</a></li>
								<li class="list-group-item"><b>이메일</b> <a
									class="float-right">${student.userEmail}</a></li>

							</ul>
							<input type="hidden" name = "userId" id = "userId" class="form-control" value="${student.userId}" readonly>
							<input type="hidden" name = "lectureNum" id = "lectureNum" class="form-control" value="${student.ulNum}" readonly>
							<button type="submit" class="btn btn-danger btn-block" name="btn" value = "cancel"><b>Cancel</b></button>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
	
					<!-- /.col -->
				</form>

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
