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
  <title>아이디 중복체크</title>

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
			<b>중복체크</b>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">중복체크 할 아이디를 입력해주세요.</p>

				<form action="/idCheck" method="post" name="frm">
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="userId" id = "userId"
							value="${param.userId}">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>

					<div class="col-4" style="display: inline-block">
						<input type="submit" class="btn btn-warning btn-block"
							name="idCheckbtn" value="중복체크" onclick="return idCheckCheck()">
					</div>
					<div class="col-4" style="display: inline-block; float: right;">
						<button type="submit" class="btn btn-primary btn-block"
							name="idOkbtn" onclick="idOk()">사용하기</button>
					</div>
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
