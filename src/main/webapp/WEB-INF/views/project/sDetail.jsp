<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" style="height: auto;">
<head>
<meta charset="UFT-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>강의정보</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="../../plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed" style="height: auto;">
	<!-- Site wrapper -->
	<div class="wrapper">
		<!-- navbar -->
		<%@include file="../include/navbar.jsp"%>

		<!-- 사이드바 -->
		<%@include file="../include/side.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="min-height: 1604.44px;">
			<!-- Content Header (Page header) -->
						<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>강의 정보</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/project/main?userId=${param.userId }">Home</a></li>
								<li class="breadcrumb-item active">학생</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Default box -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">나의 강의</h3>


					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-12 col-md-12 col-lg-8 order-2 order-md-1">
								<div class="row">
									<div class="col-12 col-sm-4">
										<div class="info-box bg-light">
											<div class="info-box-content">
												<span class="info-box-text text-center text-muted">강의번호</span>
												<span class="info-box-number text-center text-muted mb-0">${sDetail.lectureNum }</span>
											</div>
										</div>
									</div>
									<div class="col-12 col-sm-4">


										<div class="info-box bg-light">
											<div class="info-box-content">
												<span class="info-box-text text-center text-muted">강의명</span>
												<span class="info-box-number text-center text-muted mb-0">${sDetail.lectureName }</span>
											</div>
										</div>
									</div>
									<div class="col-12 col-sm-4">
										<div class="info-box bg-light">
											<div class="info-box-content">
												<span class="info-box-text text-center text-muted">학생수</span>
												<span class="info-box-number text-center text-muted mb-0">${studentCnt }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<h4>강의내용</h4>
										<div class="post"></div>

										<div class="post">
											<p>${sDetail.lectureContent }</p>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body box-profile">
								<div class="text-center">
									<img width = "150px" src="${contextPath}/resources/dist/img/person.png">
								</div>

								<h3 class="profile-username text-center">${sDetail.userName }</h3>

								<p class="text-muted text-center">${sDetail.pName}</p>

								<ul class="list-group list-group-unbordered mb-3">
									<li class="list-group-item"><b>전화번호</b> <a
										class="float-right">${sDetail.userMobile }</a></li>
									<li class="list-group-item"><b>이메일</b> <a
										class="float-right">${sDetail.userEmail }</a></li>
								</ul>
								
							
							</div>
						</div>
						
					</div>
					
					<!-- /.card-body -->
				</div>
				<!-- /.card -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- Control Sidebar -->
		<!-- /.control-sidebar -->
		<div id="sidebar-overlay"></div>
	</div>
	
	<!-- 우측 사이드바 -->
<%@include file="../include/sidebar.jsp"%>
<!-- footer -->
<%@include file="../include/footer.jsp" %>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="../../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../dist/js/demo.js"></script>
	
	
	

</body>
</html>