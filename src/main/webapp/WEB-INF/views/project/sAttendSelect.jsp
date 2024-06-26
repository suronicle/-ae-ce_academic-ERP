<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<title>근태관리</title>

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

<!-- REQUIRED SCRIPTS -->


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
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>My Attend</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/project/main?userId=${param.userId }">Home</a></li>
								<li class="breadcrumb-item active">MyAttend</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>


			<!-- Main content -->

			<div class="content-header">
				<div class="container-fluid">


					<section class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-6">
									<div class="card card-success">
										<div class="card-header">
											<h3 class="card-title">STATE</h3>
										</div>
										<!-- /.card-header -->
										<div class="card-body" style="height: 350px;">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>근태 명칭</th>
														<th>근태 현황</th>
													</tr>
												</thead>
												<tbody>
													<tr>

														<td>지각</td>
														<td><c:forEach var="student" items="${attendance }"
																begin="0" end="0">
																${student.late }
															</c:forEach></td>
													</tr>
													<tr>

														<td>조퇴</td>
														<td><c:forEach var="student" items="${attendance }"
																begin="0" end="0">
																${student.ealry }
															</c:forEach></td>
													</tr>
													<tr>

														<td>결석</td>
														<td><c:forEach var="student" items="${attendance }"
																begin="0" end="0">
																${student.abs }
															</c:forEach></td>
													</tr>


												</tbody>
											</table>
											<p></p>
											<h3 class="card-title">COUNT</h3>
											<br>
											<div class="row">
												<div class="col-12 col-sm-4">
													<div class="info-box bg-light">
														<div class="info-box-content">
															<span class="info-box-text text-center text-muted">승인</span>
															<span class="info-box-number text-center text-muted mb-0">${con }</span>
														</div>
													</div>
												</div>
												<div class="col-12 col-sm-4">
													<div class="info-box bg-light">
														<div class="info-box-content">
															<span class="info-box-text text-center text-muted">미승인</span>
															<span class="info-box-number text-center text-muted mb-0">${notc }</span>
														</div>
													</div>
												</div>
												<div class="col-12 col-sm-4">
													<div class="info-box bg-light">
														<div class="info-box-content">
															<span class="info-box-text text-center text-muted">반려</span>
															<span class="info-box-number text-center text-muted mb-0">${den}</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.card -->

								<!-- /.col-->

								<!-- 등록 폼 -->
								<div class="col-md-6">
									<div class="card card-warning">
										<div class="card-header">
											<h3 class="card-title">Attend FORM</h3>
										</div>
										<!-- /.card-header -->
										<div class="card-body">
											<form action="/sAttendRegister" method="post">

												<div class="row">
													<div class="col-sm-6">
														<!-- text input -->
														<div class="form-group">
															<label>ID</label> <input type="text" name="aId" id="aId"
																class="form-control" value="${param.userId}" readonly>

														</div>
													</div>
													<div class="col-sm-6">
														<div class="form-group">
															<label>승인 여부</label> <input type="text"
																class="form-control" value="${student.pName }" readonly>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-sm-6">

														<div class="form-group">
															<label>근태 구분</label> <input type="text"
																class="form-control" value="" readOnly>


														</div>
														<div class="form-group">
															<label>기간</label> <input type="text" name="aDate"
																class="form-control" readOnly>
														</div>
													</div>
													<div class="col-sm-6">
														<div class="form-group">
															<label>증빙자료</label>
															<textarea class="form-control" rows="5" name="aReason"
																readOnly></textarea>
														</div>
													</div>
												</div>
												<div class="col-6">
													<button type="submit" class="btn btn-warning"
														name="savebtn"
														style="display: inline-block; float: right;" disabled>Save</button>
												</div>
											</form>
										</div>

										<!-- /.col -->
									</div>
									<!-- /.row -->
								</div>
							</div>
						</div>

						<!-- List -->
						<div class="row">
							<div class="col-12">
								<div class="card card-secondary">
									<div class="card-header">
										<h3 class="card-title">LIST</h3>

										<div class="card-tools">

											<form action="/sAttendSelect?userId=${param.userId }" method ="post">
												<div class="input-group input-group-sm" style="width: 150px;">
													<select class="form-control float-right" style = "height: 40px;" id=aAttend name=aAttend>
														<option value=1>출석</option>
														<option value=2>지각</option>
														<option value=3>조퇴</option>
														<option value=6>결석</option>
													</select>
													<button type="submit" class="btn btn-default">
														<i class="fas fa-search"></i>
													</button>
												</div>
											</form>

										</div>
									</div>
									<!-- /.card-header -->
									<div class="card-body table-responsive p-0"
										style="height: 450px;">
										<table class="table table-head-fixed text-nowrap">
											<thead>
												<tr>
													<th>근태 명칭</th>
													<th>사유</th>
													<th>기간</th>
													<th>승인 여부</th>
													<th>승인 날짜</th>
													<th>반려 사유</th>
												</tr>
											</thead>
											<tbody>
												<c:if test = "${aAttend == 1}">
													<c:forEach var="student" items="${attendAtt }">
														<tr>
															<td><c:if test="${student.aConfirm == 100 }">
																	<a
																		href="/project/sAttendRegister?userId=${student.aId }&aDate=${student.aDate}">
																		${student.aName }</a>
																</c:if> <c:if test="${student.aConfirm == 101 }">
																	${student.aName }
																</c:if> <c:if test="${student.aConfirm == 102 }">
																	<a
																		href="/project/sAttendRegister?userId=${student.aId }&aDate=${student.aDate}">
																		${student.aName }</a>
																</c:if></td>
															<td>${student.aReason}</td>
															<td>${student.aDate}</td>
															<td>${student.pName}</td>
															<td>${student.aConfirmDate}</td>
															<td>${student.aDeny }</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
							</div>
						</div>
					</section>

				</div>

			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->
	<!-- 우측 사이드바 -->
	<%@include file="../include/sidebar.jsp"%>
	<!-- footer -->
	<%@include file="../include/footer.jsp"%>


</body>
</html>