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
   <title>학생 정보</title>

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
							<h1>${param.lectureNum }번 강의</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/project/main?userId=${param.userId }">Home</a></li>
								<li class="breadcrumb-item active">학생 정보</li>
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
        <c:if test = "${admin.equals('002') }">
          <div class="col-md-3">
	
			
            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
            
                <div class="text-center">
            
                  <img class="profile-user-img img-fluid img-circle"
                       src="${contextPath}/resources/dist/img/person.png"
                       alt="User profile picture">
        
                </div>

                <h3 class="profile-username text-center">${teacher.userName}</h3>

                <p class="text-muted text-center">${teacher.userMobile}</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>강의 번호</b> <a class="float-right">${param.lectureNum}</a>
                  </li>
                  <li class="list-group-item">
                    <b>강의 명</b> <a class="float-right">${lecture}</a>
                  </li>
                  <li class="list-group-item">
                    <b>총 학생 수</b> <a class="float-right">${studentCount }</a>
                  </li>
                </ul>

                <a href="#" class="btn btn-primary btn-block"><b>${teacher.userEmail }</b></a>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
			
            <!-- About Me Box -->
           
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">학생</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body"
									style="max-height: 430px; overflow-y: auto;">
									<c:forEach var="studentOne" items="${studentOne}">
										<strong><i class="fas fa-book mr-1"></i>${studentOne.userName }</strong>
										<p class="text-muted">아이디 :  <a href="/project/tStudentManagement?lectureNum=${param.lectureNum}&userId=${studentOne.userId } " 
										onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">${studentOne.userId }</a></p>
										<p class="text-muted">전화번호 : ${studentOne.userMobile }</p>
										<p class="text-muted">
											<a
												href="/project/tSInfo?lectureNum=${param.lectureNum }&userId=${studentOne.userId }"><i
												class="fas fa-link mr-1"></i>출결보기</a>
										</p>
										<hr>
									</c:forEach>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
				
				</div>
          </c:if>
          <c:if test = "${admin.equals('001') }">
           <div class="col-md-3">
	
			
              <!-- About Me Box -->
           
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">학생</h3>
								
								</div>
								<!-- /.card-header -->
								<div class="card-body"
									style="max-height: 870px; overflow-y: auto;">
									<c:forEach var="studentOne" items="${studentOne}">
										<strong><i class="fas fa-book mr-1"></i>${studentOne.userName }</strong>
										<p class="text-muted">아이디 :  <a href="/project/tStudentManagement?lectureNum=${param.lectureNum}&userId=${studentOne.userId } " 
										onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">${studentOne.userId }</a></p>
										<p class="text-muted">전화번호 : ${studentOne.userMobile }</p>
										<p class="text-muted">
											<a
												href="/project/tSInfo?lectureNum=${param.lectureNum }&userId=${studentOne.userId }"><i
												class="fas fa-link mr-1"></i>출결보기</a>
										</p>
										<hr>
									</c:forEach>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
				
				</div>
          </c:if>
          
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">출결</a></li>
                  <li class="nav-item" ><a class="nav-link" data-toggle="tab" >관리</a></li>
                  
                </ul>
      
              </div><!-- /.card-header -->
              
              <div class="card-body" style="overflow-y: auto;">
                <div class="tab-content">
                  <div class="active tab-pane" id="activity">
                    <!-- Post -->
                    <div class="post">
												<form>
													<div class="row">
														<div class="col-12" >

															<div class="card" style="height: 800px;">

																<div class="card-header">

																	<div class="card-tools">
																		<div class="input-group input-group-sm"
																			style="width: 150px;">
																			<table style="margin-left: -60px;">
																				<tr>
																					<td><input type="hidden" name="lectureNum"
																						value="${param.lectureNum }"> <input
																						type="hidden" name="userId"
																						value="${param.userId }"> <input
																						type="date" name="aDate" class="form-control"
																						value="aDate" max="9999-12-31" id="aDate" /></td>
																					<td><div class="input-group-append">
																							<button type="submit" class="btn btn-default">
																								<i class="fas fa-search"></i>
																							</button>


																						</div></td>
																				</tr>

																			</table>

																		</div>
																	</div>

																</div>

																<!-- /.card-header -->

																<div class="card-body table-responsive p-0"
																	style="height: 500px;">
																	<table class="table table-hover text-nowrap">
																		<thead>
																			<tr>
																				<th>아이디</th>
																				<th>날짜</th>
																				<th>상태</th>
																				<th>사유</th>
																			</tr>
																		</thead>
																		<tbody>

																			<c:forEach var="student" items="${student}">
																				<tr>
																					<td>${student.userId }</td>
																					<td>${student.aDate }</td>
																					<td>${student.aName }</td>
																					<td>${student.aReason }</td>

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
												</form>
											</div>
                 
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  </div>
  

	<!-- 우측 사이드바 -->
	<%@include file="../include/sidebar.jsp"%>


	<!-- footer -->
	<%@include file="../include/footer.jsp"%>
 
 <script src="${contextPath}/resources/dist/js/teacher.js"></script>

</body>
</html>
