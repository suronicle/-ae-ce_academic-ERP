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
  <title>게시판</title>

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
							<h1>게시판</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="/project/main?userId=${param.userId }">Home</a></li>
								<li class="breadcrumb-item active">게시판</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>





			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
					
					
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title"><a href="/project/nBoard?userId=${param.userId}">공지사항</a></h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body" style="height: 563px;">
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
											<c:forEach var="notice" items="${boardN}" begin="0" end="5">
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
								</div>
								<!-- /.card-body -->
								
							</div>
							<!-- /.card -->


							<!-- /.card -->
						</div>
						<!-- /.col -->


						<c:if test="${user.userAdmin.equals('003') }">
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">
											<a href="/project/sBoard?userId=${param.userId}">학원생 게시판</a>
										</h3>

									</div>
									<!-- /.card-header -->
									<div class="card-body p-0" style="height: 250px;">
										<table class="table">
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
												<c:forEach var="student" items="${boardS}" begin="0" end="2">
													<tr>
														<td>${student.boardNum }</td>
														<td>${student.boardTitle }</td>
														<td>${student.boardUserId }</td>
														<td>${student.pName }</td>
														<td>${student.boardDate }</td>
														<td>${student.boardCount }</td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->

								<div class="card">
									<div class="card-header">
										<h3 class="card-title">
											<a href="/project/tBoard?userId=${param.userId}">강사 게시판</a>
										</h3>
									</div>
									<!-- /.card-header -->
									<div class="card-body p-0" style="height: 250px;">
										<table class="table table-striped">
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
												<c:forEach var="teacher" items="${boardT}" begin="0" end="2">
													<tr>
														<td>${teacher.boardNum }</td>
														<td>${teacher.boardTitle }</td>
														<td>${teacher.boardUserId }</td>
														<td>${teacher.pName }</td>
														<td>${teacher.boardDate }</td>
														<td>${teacher.boardCount }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
							</div>
							<!-- /.col -->
						</c:if>
						
						
						<c:if test="${user.userAdmin.equals('001') }">
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">
											<a href="/project/sBoard?userId=${param.userId}">학원생 게시판</a>
										</h3>

									</div>
									<!-- /.card-header -->
									<div class="card-body p-0" style="height: 250px;">
										<table class="table">
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
												<c:forEach var="student" items="${boardS}" begin="0" end="2">
													<tr>
														<td>${student.boardNum }</td>
														<td>${student.boardTitle }</td>
														<td>${student.boardUserId }</td>
														<td>${student.pName }</td>
														<td>${student.boardDate }</td>
														<td>${student.boardCount }</td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->

								<div class="card">
									<div class="card-header">
										<h3 class="card-title">
											강사 게시판
										</h3>
									</div>
									<!-- /.card-header -->
									<div class="card-body p-0" style="height: 250px;">
										<table class="table table-striped">
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
												<tr>
												<td>0</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
											</tr>
										<tr>
												<td>1</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
											</tr>
										<tr>
												<td>2</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
											</tr>

											</tbody>
										</table>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
							</div>
							<!-- /.col -->
						</c:if>

						<c:if test="${user.userAdmin.equals('002') }">
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">
										학원생 게시판
										</h3>

									</div>
									<!-- /.card-header -->
									<div class="card-body p-0" style="height: 250px;">
										<table class="table">
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
												<tr>
												<td>0</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
											</tr>
										<tr>
												<td>1</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
											</tr>
										<tr>
												<td>2</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
												<td>???</td>
											</tr>

											</tbody>
										</table>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->

								<div class="card">
									<div class="card-header">
										<h3 class="card-title">
											<a href="/project/tBoard?userId=${param.userId}">강사 게시판</a>
										</h3>
									</div>
									<!-- /.card-header -->
									<div class="card-body p-0" style="height: 250px;">
										<table class="table table-striped">
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
												<c:forEach var="teacher" items="${boardT}" begin="0" end="2">
													<tr>
														<td>${teacher.boardNum }</td>
														<td>${teacher.boardTitle }</td>
														<td>${teacher.boardUserId }</td>
														<td>${teacher.pName }</td>
														<td>${teacher.boardDate }</td>
														<td>${teacher.boardCount }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
							</div>
							<!-- /.col -->
						</c:if>



					</div>
					<!-- /.row -->


				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
  
  
  
  
  
  </div>
	<!-- 우측 사이드바 -->
	<%@include file="../include/sidebar.jsp"%>
	<!-- footer -->
	<%@include file="../include/footer.jsp"%>


</body>
</html>
