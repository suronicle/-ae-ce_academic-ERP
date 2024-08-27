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
<title>학생</title>

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

<body
	class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
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
							<h1>출결관리</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="/project/main?userId=${param.userId }">Home</a></li>
								<li class="breadcrumb-item active">출결관리</li>
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
											<h3 class="card-title">상태</h3>
										</div>
										<!-- /.card-header -->
										<div class="card-body" style="height: 420px;">
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
														<td>${late }</td>

													</tr>
													<tr>

														<td>조퇴</td>
														<td>${ealry }</td>
													</tr>
													<tr>

														<td>결석</td>
														<td>${abs }</td>
													</tr>


												</tbody>
											</table>
											<p></p>
											<h3 class="card-title">COUNT</h3>
											<br>
											<div class="row">
												<div class="col-12 col-sm-4">
													<div class="info-box bg-light">
														<div class="info-box-content" style="text-align: center;">
															<a
																href="/project/sAttendList?userId=${param.userId }&aConfirm=101"
																onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">승인</a>
															<span class="info-box-number text-center text-muted mb-0">${con }</span>
														</div>
													</div>
												</div>
												<div class="col-12 col-sm-4">
													<div class="info-box bg-light">
														<div class="info-box-content" style="text-align: center;">
															<a
																href="/project/sAttendList?userId=${param.userId }&aConfirm=100"
																onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">미승인</a>
															<span class="info-box-number text-center text-muted mb-0">${notc }</span>
														</div>
													</div>
												</div>
												<div class="col-12 col-sm-4">
													<div class="info-box bg-light">
														<div class="info-box-content" style="text-align: center;">
															<a
																href="/project/sAttendList?userId=${param.userId }&aConfirm=102"
																onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">반려</a>
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
											<h3 class="card-title">근태작성</h3>
										</div>
										<!-- /.card-header -->
										<div class="card-body">
											<form
												action="/sAttendRegister?userId=${param.userId }&aDate=${param.aDate}"
												method="post" enctype="multipart/form-data">
												<div class="row">
													<div class="col-sm-6">
														<!-- text input -->

													</div>

												</div>

												<div class="row">
													<div class="col-sm-6">
														<div class="form-group">
															<label>ID</label> <input type="text" name="aId" id="aId"
																class="form-control" value="${param.userId}" readonly>

														</div>
														<div class="form-group">
															<label>승인 여부</label> <input type="text"
																class="form-control" readonly>

														</div>
														<div class="form-group">
															<label>근태 구분</label> <input type="text"
																class="form-control" readOnly>

														</div>
														<div class="form-group">
															<label>기간</label> <input type="text" class="form-control"
																readOnly>
														</div>
													</div>


													<div class="col-sm-6">
														<div class="form-group">
															<label>증빙자료</label> <br>
															<div class="btn btn-default btn-file">
																<i class="fas fa-paperclip"></i> Attachment
															</div>
															<br>
															<c:forEach var="fileName" items="${dto.realFileName}">
																<li style="width: 200px"><span
																	class="mailbox-attachment-icon"> <i
																		class="far fa-file-pdf"></i></span>
																	<div class="mailbox-attachment-info">
																		<c:if test="${not empty fileName}">
																			<c:set var="formattedFileName"
																				value="${dto.ranFileName}" />
																			<a href="/resources/dist/img/${formattedFileName}"
																				onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
																				class="mailbox-attachment-name"><i
																				class="fas fa-paperclip"></i> ${fileName}</a>
																		</c:if>
																	</div></li>
																<br>

															</c:forEach>
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
										<h3 class="card-title">리스트</h3>
										<form action="/project/sAttendance" method="get">
											<input type="hidden" name="userId" value="${param.userId }">
											<div class="card-tools">

												<div class="input-group input-group-sm"
													style="width: 150px; float: right;">
													<select name="aNum" id="inputStatus"
														class="custom-select form-control float-right"
														style="text-align: center;">
														<option value=500>전체 리스트</option>
														<option value=0>출석 리스트</option>
														<option value=2>지각 리스트</option>
														<option value=3>조퇴 리스트</option>
														<option value=6>결석 리스트</option>
													</select>
													<div class="input-group-append">
														<button type="submit" class="btn btn-default">
															<i class="fas fa-search"></i>
														</button>
													</div>
												</div>
											</div>
										</form>
									</div>
									<!-- /.card-header -->
									<div class="card-body table-responsive p-0"
										style="height: 450px;">
										<table class="table table-head-fixed text-nowrap">
											<thead>
												<tr>
													<th>강의 번호</th>
													<th>강의 명</th>
													<th>근태 명칭</th>
													<th>사유</th>
													<th>기간</th>
													<th>승인 여부</th>
													<th>승인 날짜</th>
													<th>반려 사유</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="student" items="${attendance }">
													<tr>
														<td>${student.aLecNum }</td>
														<td>${student.lectureName }</td>
														<td><c:if test="${student.aConfirm == 100 }">
																<a
																	href="/project/sAttendRegister?userId=${student.aId }&aDate=${student.aDate}">
																	${student.aName }</a>
															</c:if> <c:if test="${student.aConfirm == 101 }">
                                                ${student.aName }
                                             </c:if> <c:if
																test="${student.aConfirm == 102 }">
																<a
																	href="/project/sAttendRegister?userId=${student.aId }&aDate=${student.aDate}">
																	${student.aName }</a>
															</c:if></td>
														<td><c:if test="${empty student.realFileName}">
																<h6>자료 없음</h6>
															</c:if> <c:if test="${not empty student.realFileName}">
																<h6 style="color: green;">자료 있음</h6>
															</c:if></td>
														<td>${student.aDate}</td>
														<td>${student.pName}</td>
														<td>${student.aConfirmDate}</td>
														<td>${student.aDeny }</td>
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