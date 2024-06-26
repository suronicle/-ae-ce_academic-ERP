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
 <script src="http://code.jquery.com/jquery-latest.js"></script> 
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">
</head>
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
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
							<h1>가입 승인</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
										href="/project/mMain">Home</a></li>
								<li class="breadcrumb-item active">가입 승인</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

<!-- Main content -->

			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">가입자 리스트</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<div id="jsGrid1">
							<table class="table">


								<tr>
									<td>아이디</td>
									<td>이름</td>
									<td>승인 여부</td>

								</tr>
								<c:forEach var="member" items="${member}">
									<tr>
										<td><a href="mConfirmOne?userId=${member.userId}">
												${member.userId} </a></td>
										<td>${member.userName}</td>
										<c:if test="${member.pName.equals('반려')}">
										<td style="color:red;">${member.pName}</td>
										</c:if>
										<c:if test="${member.pName.equals('미승인')}">
										<td>${member.pName}</td>
										</c:if>
									</tr>
								</c:forEach>

							</table>



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
<!-- 우측 사이드바 -->
	<%@include file="../include/sidebar.jsp"%>


	</div>
	<!-- ./wrapper -->

	<!-- footer -->
	<%@include file="../include/mFooter.jsp"%>

	<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->


<!-- Bootstrap -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="${contextPath}/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="${contextPath}/resources/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="${contextPath}/resources/plugins/raphael/raphael.min.js"></script>
<script src="${contextPath}/resources/plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="${contextPath}/resources/plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="${contextPath}/resources/plugins/chart.js/Chart.min.js"></script>


<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${contextPath}/resources/dist/js/pages/dashboard2.js"></script>
</body>
</html>