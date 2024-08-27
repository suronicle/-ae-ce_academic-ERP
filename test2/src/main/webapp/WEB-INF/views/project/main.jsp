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
<script>
    // 현재 날짜를 포맷팅하는 함수
    function updateDate() {
        var now = new Date();
        var year = now.getFullYear();
        var month = ('0' + (now.getMonth() + 1)).slice(-2);
        var date = ('0' + now.getDate()).slice(-2);
        
        var hours = ('0' + now.getHours()).slice(-2);
        var minutes = ('0' + now.getMinutes()).slice(-2);
        var seconds = ('0' + now.getSeconds()).slice(-2);
        
        var formattedTime = hours + ':' + minutes + ':' + seconds;
        var formattedDate = year + '-' + month + '-' + date;
        document.getElementById('currentDate').innerText  = formattedDate + ' ' + formattedTime;
        document.getElementById('currentDateInput').value = formattedDate;
    }

    // 페이지 로드 시와 1초마다 updateDate 함수를 호출
    window.onload = function() {
        updateDate();
        setInterval(updateDate, 1000);
    }
</script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인화면</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/adminlte.min.css">

<!-- Daterange picker -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/daterangepicker/daterangepicker.css">

</head>

<!-- REQUIRED SCRIPTS -->


<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.js"></script>
<!-- Bootstrap 4 -->
<script
	src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="${contextPath}/resources/plugins/chart.js/Chart.min.js"></script>
<!-- moment.js -->
<script src="${contextPath}/resources/plugins/moment/moment.min.js"></script>
<!-- moment.js 로드 -->
<!-- daterangepicker -->
<script
	src="${contextPath}/resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script
	src="${contextPath}/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.js"></script>


<body
	class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
	<div class="wrapper">

		<!-- navbar -->
		<%@include file="../include/navbar.jsp"%>

		<!-- 사이드바 -->
		<%@include file="../include/side.jsp"%>

		<c:if test="${user!=null}">
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<h1 class="m-0"></h1>
							</div>
							<!-- /.col -->
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a
										href="/project/main?userId=${param.userId }">Home</a></li>
									<li class="breadcrumb-item active">[æ]ce</li>
								</ol>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</div>
				<!-- /.content-header -->



				<!-- Main content -->
				<section class="content">
					<div class="container-fluid">
						<div class="row">

							<c:if test="${info.userAdmin.equals('002') }">
								<div class="col-md-2 col-sm-4">
									<div class="card card-primary card-outline"
										style="height: 695px; width: 400px; margin-left: 10px;">
										<form action="/tGoOut" method="post">
											<div class="card-body box-profile">


												<h3 class="profile-username text-center">출 / 퇴근</h3>
												<p></p>

												<input type="hidden" name="userId" value="${param.userId }">
												<b><span id="currentDate"
													style="text-align: center; display: block;"></span></b>
												<p></p>
												<input type="hidden" id="currentDateInput" name="aDate" />

												<table class="table table-bordered">
													<thead>
														<tr>

															<th>날짜</th>
															<th>출/퇴근</th>

														</tr>
													</thead>
													<tbody>
														<c:forEach var="GoOut" items="${GoOut}" begin="0" end="8">
															<tr>
																<td>${GoOut.aDate}</td>
																<td>${GoOut.aName }</td>

															</tr>
														</c:forEach>
													</tbody>
												</table>
												<p></p>
												<button type="submit" class="btn btn-primary btn-block">
													<b>출/퇴근</b>
												</button>
											</div>
											<!-- /.card-body -->
										</form>
									</div>
								</div>
							</c:if>
							<c:if test="${info.userAdmin.equals('001') }">
								<div class="col-md-2 col-sm-4">
									<div class="card card-primary card-outline"
										style="height: 715px; width: 400px; margin-left: 10px;">
										<form action="/sGoOut" method="post">
											<div class="card-body box-profile">


												<h3 class="profile-username text-center">등 / 하원</h3>
												<select name="lectureNum" id="inputStatus"
													class="form-control custom-select"
													style="text-align: center;">
													<option value=500>========선택========</option>
													<c:forEach var="lecture" items="${lectureInfo }">
														<option value=${lecture.lectureNum }>${lecture.lectureName }</option>
													</c:forEach>
												</select>
												<p></p>

												<input type="hidden" name="userId" value="${param.userId }">
												<b><span id="currentDate"
													style="text-align: center; display: block;"></span></b>
												<p></p>
												<input type="hidden" id="currentDateInput" name="aDate" />

												<table class="table table-bordered">
													<thead>
														<tr>
															<th>날짜</th>
															<th>등/하원</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="GoOut" items="${mainAttend}" begin="0"
															end="8">
															<tr>
																<td>${GoOut.aDate}</td>
																<td>${GoOut.aName }</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
												<p></p>
												<button type="submit" class="btn btn-primary btn-block">
													<b>등/하원</b>
												</button>
											</div>
											<!-- /.card-body -->
										</form>
									</div>
								</div>
								</c:if>
								<div class="col-md-9" style="margin-left: 140px;">
									<div class="card">



										<div class="card-body" style="margin-left: 10px;">
											<div class="tab-content">

												<div class="row"
													style="margin-top: 20px; margin-right: 6px;">

													<div class="col-lg-3 col-6">
														<!-- small box -->

														<c:if test="${info.userAdmin.equals('002') }">
															<div class="small-box bg-info">
																<div class="inner">
																	<h3>연차</h3>

																	<p>${info.ann }</p>
																</div>

																<a href="/project/tAttend?userId=${param.userId }"
																	class="small-box-footer">더보기<i
																	class="fas fa-arrow-circle-right"></i></a>
															</div>
														</c:if>
														<c:if test="${info.userAdmin.equals('001') }">
															<div class="small-box bg-info">
																<div class="inner">
																	<h3>출석</h3>

																	<p>${att }</p>
																</div>

																<a
																	href="${contextPath}/project/sAttendance?userId=${user.userId }"
																	class="small-box-footer">더보기<i
																	class="fas fa-arrow-circle-right"></i></a>
															</div>
														</c:if>
													</div>

													<div class="col-lg-3 col-6">
														<!-- small box -->
														<div class="small-box bg-success">



															<c:if test="${info.userAdmin.equals('002') }">
																<div class="inner">

																	<h3>반차</h3>
																	<p>${info.half }</p>
																</div>
																<a href="/project/tAttend?userId=${param.userId }"
																	class="small-box-footer">더보기 <i
																	class="fas fa-arrow-circle-right"></i></a>
															</c:if>

															<c:if test="${info.userAdmin.equals('001') }">
																<div class="inner">

																	<h3>지각</h3>
																	<p>${late }</p>
																</div>
																<a
																	href="${contextPath}/project/sAttendance?userId=${user.userId }"
																	class="small-box-footer">더보기 <i
																	class="fas fa-arrow-circle-right"></i>
																</a>

															</c:if>

														</div>
													</div>
													<!-- ./col -->
													<div class="col-lg-3 col-6">
														<!-- small box -->
														<div class="small-box bg-warning">


															<c:if test="${info.userAdmin.equals('002') }">
																<div class="inner">
																	<h3>승인</h3>
																	<p>${con }</p>
																</div>
																<a href="/project/tAttend?userId=${param.userId }"
																	class="small-box-footer">더보기<i
																	class="fas fa-arrow-circle-right"></i></a>
															</c:if>

															<c:if test="${info.userAdmin.equals('001') }">
																<div class="inner">

																	<h3>조퇴</h3>
																	<p>${early }</p>
																</div>
																<a
																	href="${contextPath}/project/sAttendance?userId=${user.userId }"
																	class="small-box-footer">더보기 <i
																	class="fas fa-arrow-circle-right"></i>
																</a>

															</c:if>




														</div>
													</div>
													<!-- ./col -->
													<div class="col-lg-3 col-6">
														<!-- small box -->
														<div class="small-box bg-danger">


															<c:if test="${info.userAdmin.equals('002') }">
																<div class="inner">

																	<h3>미승인</h3>
																	<p>${notc }</p>
																</div>
																<a href="/project/tAttend?userId=${param.userId }"
																	class="small-box-footer">더보기 <i
																	class="fas fa-arrow-circle-right"></i></a>
															</c:if>


															<c:if test="${info.userAdmin.equals('001') }">
																<div class="inner">

																	<h3>결석</h3>
																	<p>${abs }</p>
																</div>
																<a
																	href="${contextPath}/project/sAttendance?userId=${user.userId }"
																	class="small-box-footer">더보기 <i
																	class="fas fa-arrow-circle-right"></i>
																</a>

															</c:if>




														</div>
													</div>
													<!-- ./col -->
												</div>
												<!-- /.row -->
												<section class="col-lg-7 connectedSortable">
													<!-- Custom tabs (Charts with tabs)-->

													<!-- 공지사항 -->
													<div class="card"
														style="height: 375px; margin-top: 82px; width: 1250px; margin-left: 8px;">
														<div class="card-header">
															<h3 class="card-title">
																<i class="ion ion-clipboard mr-1"></i> 공지사항
															</h3>


														</div>
														<!-- /.card-header -->
														<div class="card-body">
															<ul class="todo-list" data-widget="todo-list">
																<table class="table table-bordered">
																	<thead>
																		<tr>
																			<th>#</th>
																			<th>제목</th>
																			<th>아이디</th>
																			<th>직책</th>
																			<th>날짜</th>
																			<th>조회수</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach var="notice" items="${boardN}" begin="0"
																			end="2">
																			<tr>
																				<td>${notice.boardNum }</td>
																				<td>${notice.boardTitle }</td>
																				<td>${notice.boardUserId }</td>
																				<td>${notice.pName }</td>
																				<td>${notice.boardDate }</td>
																				<td>${notice.boardCount }</td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>

															</ul>

														</div>
														<!-- /.card-body -->
														<div class="card-footer clearfix">
															<button type="button" class="btn btn-primary float-right"
																onclick="location.href='/project/board?userId=${param.userId}'">
																<i class="fas fa-plus"></i> 더보기
															</button>
														</div>
													</div>
													<!-- /.card -->
												</section>
												<!-- /.Left col -->




											</div>
											<!-- /.row (main row) -->
										</div>
										<!-- /.tab-content -->
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
				</section>
				<!-- /.content -->
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</c:if>

	</div>


	<!-- 우측 사이드바 -->
	<%@include file="../include/sidebar.jsp"%>
	<!-- footer -->
	<%@include file="../include/footer.jsp"%>


</body>
</html>
