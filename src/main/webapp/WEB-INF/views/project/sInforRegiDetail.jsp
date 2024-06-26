<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>강의정보</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/adminlte.min.css">
</head>

<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.js"></script>
<!-- Bootstrap 4 -->
<script
	src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.js"></script>
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
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>수강신청</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="/project/main?userId=${param.userId }">Home</a></li>
								<li class="breadcrumb-item active">수강신청</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<div class="card card-success">
								<div class="card-header">
									<h3 class="card-title">강의</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body" style="height: 700px;">
									<form action="/sInforRegister" method="post">
										<input type="hidden" name="userId" value="${param.userId }">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>강의명</th>
													<th>기간</th>
													<th>신청</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="student" items="${sInformation }">
													<tr data-widget="expandable-table">
														<td>${student.lectureName }</td>
														<td>${student.lectureDateStart }~
															${student.lectureDateEnd }</td>
														<td><a
															href="/project/sInforRegiDetail?lectureNum=${student.lectureNum }&userId=${param.userId}">
																수강신청</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<p></p>
									</form>
								</div>
							</div>
						</div>
						<!-- /.card -->

						<!-- /.col-->

						<!-- 등록 폼 -->
						<div class="col-md-6">
							<div class="card card-warning">
								<div class="card-header">
									<h3 class="card-title">강의정보</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body" style="height: 700px;">
									<form action="/sInforRegister" method="post">
										<input type = "hidden" name = "userId" value = "${param.userId }">
										<div class="row">
											<div class="col-sm-6">
												<!-- text input -->
											</div>

										</div>

										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<label>강의 번호</label> <input type="text" name="lectureNum" id="lectureNum"
														class="form-control" value="${sInforRegiDetail.lectureNum}" readonly>
												</div>
												
												
												
												<div class="form-group">
													<label>강사명</label> <input type="text" name = "userName"
														class="form-control" value="${sInforRegiDetail.userName}" readOnly>

												</div>
												
											</div>


											<div class="col-sm-6">
												<div class="form-group">
													<label>강의 명</label> <input type="text" name = lectureName
														class="form-control" value="${sInforRegiDetail.lectureName}" readonly>

												</div>
												
												<div class="form-group">
													<label>강사 전화번호</label> <input type="text" name = "userMobile"
														class="form-control" value="${sInforRegiDetail.userMobile}" readOnly>

												</div>
											</div>
											<div class="col-sm-12">
												<div class="form-group">
														<label>강의 내용</label> <textarea class="form-control" name = lectureContent style = "height: 390px;"
															readOnly>${sInforRegiDetail.lectureContent}</textarea>
												</div>
											</div>
										</div>
										<div class="col-7">
												<button style="display: inline-block; float: right;" type="submit"
												class="btn btn-primary">신청하기</button>
										</div>
									</form>
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->

						</div>
					</div>
				</div>
			</section>
		</div>

		<!-- /.content-wrapper -->

		<div id="sidebar-overlay"></div>
	</div>

	<!-- 우측 사이드바 -->
	<%@include file="../include/sidebar.jsp"%>
	<!-- footer -->
	<%@include file="../include/footer.jsp"%>
	<!-- ./wrapper -->





</body>
</html>
