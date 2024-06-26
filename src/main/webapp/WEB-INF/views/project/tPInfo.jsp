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
   <title>나의 강의</title>

  <!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"  href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">
</head>

<!-- REQUIRED SCRIPTS -->


<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.js"></script>

<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
	<div class="wrapper">

		<!-- navbar -->
		<%@include file="../include/navbar.jsp"%>

		<!-- 사이드바 -->
		<%@include file="../include/side.jsp"%>

	<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">				
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>나의 강의</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="/project/main?userId=${param.userId }">Home</a></li>
								<li class="breadcrumb-item active">강의</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>


			<!-- Main content -->

			<section class="content">
						<div class="row" style="margin-top: 20px;">
							<div class="col-12" >
								<div class="card card-secondary">
									<div class="card-header">
								<h3 class="card-title">강의 리스트</h3>

							</div>
							<!-- /.card-header -->
							<div class="card-body table-responsive p-0"
								style="height: 500px;">
								<table class="table table-head-fixed text-nowrap">
									<thead>
										<tr>
										<tr>
											<th>강의 번호</th>
											<th>강의 명</th>
											<th>강의 내용</th>
											<th>개강 날짜</th>
											<th>종강 날짜</th>
											<th>학생 정보</th>
										</tr>

									</thead>
									<tbody>
										<c:forEach var="lecture" items="${lecture}">
											<tr>
												<td>${lecture.lectureNum }</td>
												<td>${lecture.lectureName }</td>
												<td>${lecture.lectureContent }</td>
												<td>${lecture.lectureDateStart }</td>
												<td>${lecture.lectureDateEnd }</td>
												<td><a
													href="tSInfo?lectureNum=${lecture.lectureNum }&userId=${param.userId}">
														상세보기 </a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
				</div>
				<!-- 리스트 끝 -->
						
			</section>
			<!-- /.content -->
		</div>


	</div>
	<!-- ./wrapper -->

	<!-- 우측 사이드바 -->
	<%@include file="../include/sidebar.jsp"%>


	<!-- footer -->
	<%@include file="../include/footer.jsp"%>
 

</body>
</html>
