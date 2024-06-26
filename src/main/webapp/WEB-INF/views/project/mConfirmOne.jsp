<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>

<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/adminlte.min.css">
</head>
<body
	class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
	<div class="wrapper">


		<!-- 관리자모드 상단 바 -->
		<%@include file="../include/mNavbar.jsp"%>

		<!-- 관리자 모드 사이드바 -->
		<%@include file="../include/mSide.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>CONFIRM</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
										href="/project/mMain">Home</a></li>
								<li class="breadcrumb-item active">CONFIRM</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>


			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">CONFIRM</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<div id="jsGrid1">

							<table class="table">


								<tr>
									<td>아이디</td>
									<td>이름</td>
									<td>직책</td>
									<td>전화번호</td>
									<td>반려 사유</td>
								</tr>

								<tr>
									<td>${member.userId}</td>
									<td>${member.userName}</td>
									<td>${role}</td>
									<td>${member.userMobile}</td>
									<td style="color:red;">${member.userRefusal}</td>
								</tr>


							</table>


							<div class="d-flex justify-content-center">
								<div class="box-footer">
									<button class="btn btn-success"
										onclick="location.href = '/project/mConfirm'">목록</button>
									<button class="btn btn-primary"
										onclick="location.href = '/project/confirm?userId=${param.userId }'">승인</button>
									<button class="btn btn-danger"
										onclick="window.open('/project/mConfirmRefusal?userId=${param.userId }', '_blank', 'width=400, height=200'); return false;">반려</button>	

								</div>
							</div>

						</div>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</section>


		</div>
		<!-- /.content-wrapper -->



		<!-- 우측 사이드바 -->
		<%@include file="../include/sidebar.jsp"%>


	</div>
	<!-- ./wrapper -->

	<!-- footer -->
	<%@include file="../include/mFooter.jsp"%>

	<!-- REQUIRED SCRIPTS -->
	<!-- jQuery -->
	<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="${contextPath}/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextPath}/resources/dist/js/adminlte.js"></script>

	<script src="${contextPath}/resources/dist/js/manager.js"></script>

	<!-- PAGE PLUGINS -->
	<!-- jQuery Mapael -->
	<script
		src="${contextPath}/resources/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
	<script src="${contextPath}/resources/plugins/raphael/raphael.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/jquery-mapael/jquery.mapael.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/jquery-mapael/maps/usa_states.min.js"></script>
	<!-- ChartJS -->
	<script src="${contextPath}/resources/plugins/chart.js/Chart.min.js"></script>


	
</body>
</html>