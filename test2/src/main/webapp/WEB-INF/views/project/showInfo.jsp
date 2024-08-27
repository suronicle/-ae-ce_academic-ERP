
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
  <title>가입 정보</title>

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
			<b><a href="/project/main?userId=">가입 정보</a></b>
		</div>

		<div class="card">
			<div class="card-body register-card-body">
				<p class="login-box-msg">나의 정보</p>

				<form action="/project/login" method="get" name="frm">
					<div class="input-group mb-3">
					<div class="col-3">
					이름
					</div>				
					<input type="text" class="form-control" placeholder="Full name"
							name="userName" id="userName" value="${user.userName }" readonly>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
					<div class="col-3">
					아이디
					</div>	
						<input type="text" class="form-control" name="userId"
							placeholder="ID (4글자 이상)" id="userId" value="${user.userId }" readonly>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
					<div class="col-3">
					비밀번호
					</div>		
						<input type="text" class="form-control" placeholder="Password"
							name="userPwd"  value="${user.userPwd }" readonly>
						<div class="input-group-append">
							
							<input type="button" class="btn btn-secondary btn-block"
								value="변경" onclick="return pwCheck()">
						</div>
					</div>



					<div class="input-group mb-3">
					<div class="col-3">
					이메일
					</div>		
						<input type="email" class="form-control" name="userEmail"
							placeholder="Email" id="userEmail" value="${user.userEmail }" readonly>
						<div class="input-group-append">
							<div class="input-group-text">
							<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
						
						
					<div class="input-group mb-3">
					<div class="col-3">
					전화번호
					</div>	
						<input type="text" class="form-control" name="userMobile"
							placeholder="ex)01022221211" id="userMobile" value="${user.userMobile }" readonly>
											<div class="input-group-append">
							
							<input type="button" class="btn btn-secondary btn-block"
								value="변경" onclick="return mobileCheck()">
						</div>
					</div>

					<div class="input-group mb-3">
					<div class="col-3">
					직책
					</div>		
						<input type="text" class="form-control" placeholder="Full name"
							name="userAdmin" id="userAdmin" value="${user.pName}" readonly>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
					<div class="col-3">
					승인여부
					</div>	
						<c:if test="${user.userAdminConfirm.equals('100') }">
						<input type="text" class="form-control" value="미승인" readonly
							name="pName" id="pName">
						</c:if>
						<c:if test="${user.userAdminConfirm.equals('101') }">
						<input type="text" class="form-control"  value="승인" readonly
							name="pName" id="pName">
						</c:if>
						<c:if test="${user.userAdminConfirm.equals('102') }">
						<input type="text" class="form-control" value="반려" readonly title="사유 : ${user.userRefusal}"
							name="pName" id="pName" style="color:red;">
						</c:if>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>

					<div class="row">

						<!-- /.col -->
						<div class="col-7" style="display: inline-block; margin: 0 65px; float: right;">

							<input type="submit" name="loginbtn"
								class="btn btn-primary btn-block"
								value="Login">
						</div>
						<!-- /.col -->
						
					</div>

				</form>
	
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->


</div>




<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>

<script src="${contextPath}/resources/dist/js/member.js"></script>

</body>
</html>
