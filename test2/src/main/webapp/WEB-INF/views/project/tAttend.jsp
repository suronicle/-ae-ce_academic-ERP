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
   <title>근태 관리</title>

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
							 <h1>나의 근태</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="/project/main?userId=${param.userId }">Home</a></li>
								<li class="breadcrumb-item active">근태</li>
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
										<div class="card-body" style="height: 350px;">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>근태 명칭</th>
														<th>근태 현황</th>
														<th style="width: 70px">현황</th>
													</tr>
												</thead>
												<tbody>
													<tr>

														<td>연차</td>
														<td>
															<div class="progress progress-xs">
																<div class="progress-bar progress-bar-danger"
																	style="width: ${(ann/24)* 100 }%"></div>
															</div>
														</td>
														<td><span class="badge bg-danger">${ann }</span></td>
													</tr>
													<tr>

														<td>반차</td>
														<td>
															<div class="progress progress-xs">
																<div class="progress-bar bg-warning"
																	style="width: ${(half/48)*100}%"></div>
															</div>
														</td>
														<td><span class="badge bg-warning">${half }</span></td>
													</tr>


												</tbody>
											</table>
											<p></p>
											<h3 class="card-title"></h3>
											<br>
											<br>
											<div class="row">
												<div class="col-12 col-sm-4">
													<div class="info-box bg-light">
														<div class="info-box-content">
															<span class="info-box-text text-center text-muted"><a
																href="/project/tAttendList?userId=${param.userId }&pId=101"
																onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">승인</a></span>
															<span class="info-box-number text-center text-muted mb-0">${con }</span>
														</div>
													</div>
												</div>
												<div class="col-12 col-sm-4">
													<div class="info-box bg-light">
														<div class="info-box-content">
															<span class="info-box-text text-center text-muted"><a
																href="/project/tAttendList?userId=${param.userId }&pId=100"
																onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">미승인</a></span>
															<span class="info-box-number text-center text-muted mb-0">${notc }</span>
														</div>
													</div>
												</div>
												<div class="col-12 col-sm-4">
													<div class="info-box bg-light">
														<div class="info-box-content">
															<span class="info-box-text text-center text-muted"><a
																href="/project/tAttendList?userId=${param.userId }&pId=102"
																onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">반려</a></span>
															<span class="info-box-number text-center text-muted mb-0">${den}</span>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
									<!-- /.card -->

								</div>
								<!-- /.col -->


								<!-- 폼 -->
								<div class="col-md-6">
									<!-- general form elements disabled -->
									<div class="card card-warning">
										<div class="card-header">
											<h3 class="card-title">근태 작성</h3>
											<div style="float: right;">
												<a href="/project/tAttend?userId=${param.userId }">등록하기</a>
											</div>
										</div>

										<!-- /.card-header -->
										<div class="card-body" style="height: 350px;">
											<form action="/tAttendRegister" method="post" name="frm">
												<div class="row">
													<div class="col-sm-6">
														<!-- text input -->
														<div class="form-group">
															<label>아이디</label> <input type="text" name="aId" id="aId"
																class="form-control" value="${param.userId}" readonly>

														</div>


													</div>
													<div class="col-sm-6">
														<c:if test="${attend!=null }">
															<div class="form-group">
																<label>승인 여부</label> <input type="text"
																	name="confirmName" class="form-control"
																	value="${attend.pName }" readonly>

															</div>
														</c:if>
														<c:if test="${attend==null }">
															<div class="form-group">
																<label>승인 여부</label> <input type="text"
																	class="form-control" placeholder="" readonly>

															</div>
														</c:if>

													</div>
												</div>
												<div class="row">
													<div class="col-sm-6">
														<c:if test="${attend!=null &&attend.pName.equals('승인')}">
															<div class="form-group">
																<label>근태 구분</label><input type="text" name="aAttend"
																	class="form-control" value="${attend.aName}" readonly>

															</div>
														</c:if>
														<c:if
															test="${attend != null && !attend.pName.equals('승인')}">
															<div class="form-group">
																<label>근태 구분</label> <select class="custom-select"
																	name="aAttend">
																	<option value="${attend.aAttend }">원래 근태 :
																		${attend.aName}</option>
																	<option value="4">연차</option>
																	<option value="5">반차</option>

																</select>
															</div>
														</c:if>
														<c:if test="${attend==null }">
															<div class="form-group">
																<label>근태 구분</label> <select class="custom-select"
																	name="aAttend">
																	<option value="10">--- 선택 ---</option>
																	<option value="4">연차</option>
																	<option value="5">반차</option>

																</select>
															</div>
														</c:if>

														<c:if test="${attend!=null }">
															<div class="form-group">
																<label>기간</label> <input type="text" name="aDate"
																	class="form-control" value="${attend.aDate }" readonly>
															</div>
														</c:if>
														<c:if test="${attend==null }">
															<div class="form-group">
																<label>기간</label> <input type="date" name="aDate"
																	class="form-control" >
															</div>
														</c:if>

													</div>
													<div class="col-sm-6">
														<c:if
															test="${attend != null && !attend.pName.equals('승인')}">
															<div class="form-group">
																<label>사유</label>
																<textarea class="form-control" rows="5" name="aReason">${attend.aReason }</textarea>
															</div>
														</c:if>
														<c:if test="${attend!=null &&attend.pName.equals('승인')}">
															<div class="form-group">
																<label>사유</label>
																<textarea class="form-control" rows="5" name="aReason"
																	readonly>${attend.aReason }</textarea>
															</div>
														</c:if>
														<c:if test="${attend==null }">
															<div class="form-group">
																<label>사유</label>
																<textarea class="form-control" rows="5" name="aReason"
																	placeholder="Enter ..."></textarea>
															</div>
														</c:if>
													</div>
												</div>
												<c:if test="${attend==null }">
													<div class="col-7">
														<button type="submit" class="btn btn-warning" name="btn"
															style="display: inline-block; float: right;" value="save"
															onclick="return attendRegister()">저장</button>
													</div>
													<div class="col-6">
														<button type="reset" class="btn btn-success"
															name="resetbtn"
															style="display: inline-block; float: right;">리셋</button>
													</div>
												</c:if>
												<c:if test="${attend!=null }">
													<c:if
														test="${attend != null && !attend.pName.equals('승인')}">
														<div class="col-7">
															<button type="submit" class="btn btn-primary" name="btn"
																style="display: inline-block; float: right;"
																value="write" onclick="return attendRewrite()">수정</button>
														</div>
														<div class="col-6">
															<button type="reset" class="btn btn-success"
																name="resetbtn"
																style="display: inline-block; float: right;">리셋</button>
														</div>
														<div class="col-5">
															<button type="submit" class="btn btn-danger" name="btn"
																style="display: inline-block; float: right;"
																value="delete">삭제</button>
														</div>

													</c:if>

												</c:if>
											</form>
										</div>

										<!-- /.col -->
									</div>
									<!-- /.row -->
								</div>
								<!-- 폼 끝 -->


							</div>
						</div>
						<!-- 리스트 -->
						<div class="row" style="margin-top: 20px;">
							<div class="col-12">
								<form name="search">
									<div class="card card-secondary">
										<div class="card-header" style="padding-bottom: 5px;">
											<!-- Adjust padding as needed -->
											<h3 class="card-title" style="margin-bottom: 0;">리스트</h3>
											<!-- Remove bottom margin -->
											<div class="card-tools">
												<div class="card-tools">
													<div class="card-tools"
														style="width: 320px; display: flex; justify-content: flex-end;">
														<input type="hidden" name="userId" value="${param.userId}">
														<div class="form-group"
															style="display: flex; align-items: center; margin-bottom: 0; margin-top: -5px;">
															<!-- Add margin-top -->
															<select class="custom-select" name="aAttend"
																style="margin-right: 10px;">
																<option value="10">--- 근태 명 ---</option>
																<option value="4">연차</option>
																<option value="5">반차</option>
															</select>
															<button type="submit" onclick="return tSearch()"
																class="btn btn-default">
																<i class="fas fa-search"></i>
															</button>
														</div>
													</div>
												</div>
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
													<c:forEach var="attendlist" items="${attendlist}">
														<tr>
															<td><c:if test="${attendlist.pName.equals('미승인')}">
																	<a
																		href="/project/tAttend?userId=${param.userId}&aDate=${attendlist.aDate}">
																		${attendlist.aName} </a>
																</c:if> <c:if test="${attendlist.pName.equals('승인')}">
                                                ${attendlist.aName}
                                            </c:if> <c:if
																	test="${attendlist.pName.equals('반려')}">
																	<a
																		href="/project/tAttend?userId=${param.userId}&aDate=${attendlist.aDate}">
																		${attendlist.aName} </a>
																</c:if></td>
															<td>${attendlist.aReason}</td>
															<td>${attendlist.aDate}</td>
															<td>${attendlist.pName}</td>
															<td>${attendlist.aConfirmDate}</td>
															<td style="color: red;">${attendlist.aDeny}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->
								</form>
							</div>
						</div>
						<!-- 리스트 끝 -->
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
 
 <script src="${contextPath}/resources/dist/js/teacher.js"></script>

</body>
</html>
