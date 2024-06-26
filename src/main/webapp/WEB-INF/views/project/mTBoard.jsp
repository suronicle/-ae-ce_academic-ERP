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
  <style>
    .button-group {
      display: flex;
      justify-content: center;
      gap: 10px;
      margin-top: 20px;
    }
    
    .card-body {
overflow:auto;
overflow-x:hidden;
height:600px;
}
  </style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>강사 게시판</title>

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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.js"></script>

<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
   <div class="wrapper">

      <!-- navbar -->
      <%@include file="../include/mNavbar.jsp"%>

      <!-- 사이드바 -->
      <%@include file="../include/mSide.jsp"%>

   <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
         <!-- Content Header (Page header) -->
         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1>강사 게시판</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/mMain">Home</a></li>
                        <li class="breadcrumb-item active">게시판</li>
                     </ol>
                  </div>
               </div>
            </div>
            <!-- /.container-fluid -->
         </section>
         <div class="col-12">
            <div class="card">
               <div class="card-header">
                  <h3 class="card-title">${user.userId}님</h3>

                  <div class="card-tools">
                     <div class="input-group input-group-sm" style="width: 150px;">
                        <input type="text" name="table_search"
                           class="form-control float-right" placeholder="Search">

                        <div class="input-group-append">
                           <button type="submit" class="btn btn-default">
                              <i class="fas fa-search"></i>
                           </button>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- /.card-header -->
               <div class="card-body table-responsive p-0" style="height: 500px;">
                  <table class="table table-head-fixed text-nowrap">
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
                        <c:forEach var="boardT" items="${boardT}">
                           <tr>
                              <td><a
                                 href="/mBoardDetail?boardNum=${boardT.boardNum}&userId=${user.userId}">${boardT.boardNum }</a></td>
                              <td>${boardT.boardTitle}</td>
                              <td>${boardT.boardUserId}</td>
                              <td>${boardT.pName}</td>
                              <td>${boardT.boardDate}</td>
                              <td>${boardT.boardCount}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
              <div class="card-footer">
                <div class="float-right">
                  <c:if test="${user.userAdmin == 002}">
                  <button type="submit" class="btn btn-primary" onclick="location.href='/mBoardRegister?userId=${user.userId}'"><i class="far fa-envelope"></i>등록</button></c:if>
                </div>
                <button type="button" class="btn btn-default" onclick="location.href='/mBoard?userId=${user.userId}'"><i class="fas fa-times"></i>뒤로가기</button>
              </div>
               <p></p>
               <!-- /.card-body -->
            </div>
            <!-- /.card -->




         </div>
         <!-- /.container-fluid -->
         </div>
         <!-- /.content-header -->

   </div>
   <script>
var isMessage = true;

<c:if test="${!empty msg}">
 if(isMessage){
	 alert("${msg}");
	 isMessage = false;
 }
</c:if>
</script>

   <!-- 우측 사이드바 -->
   <%@include file="../include/sidebar.jsp"%>
   <!-- footer -->
   <%@include file="../include/mFooter.jsp"%>


</body>
</html>