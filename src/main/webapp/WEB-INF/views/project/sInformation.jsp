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
                     <h1>나의 강의</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a
                           href="/project/main?userId=${param.userId }">Home</a></li>
                        <li class="breadcrumb-item active">나의 강의</li>
                     </ol>
                  </div>
               </div>
            </div>
            <!-- /.container-fluid -->
         </section>
         <!-- Main content -->
         <section class="content">
            <div class="row">
               <div class="col-12">
                  <div class="card card-secondary">
                     <div class="card-header">
                        <h3 class="card-title">강의 리스트</h3>

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
                     <div class="card-body table-responsive p-0"
                        style="height: 450px;">
                        <table class="table table-head-fixed text-nowrap">
                           <thead>
                              <tr>
                                 <th>#</th>
                                 <th>강의명</th>
                                 <th>기간</th>
                                 <th>상세정보</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach var="student" items="${information }">
                                 <tr data-widget="expandable-table">
                                    <td>${student.lectureNum }</td>
                                    <td>${student.lectureName }</td>
                                    <td>${student.lectureDateStart }~
                                       ${student.lectureDateEnd }</td>
                                    <td><a
                                       href="/project/sDetail?lectureNum=${student.lectureNum }&userId=${param.userId}">상세정보</a></td>
                                 </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                        <p></p>
                        
                     </div>
                     <!-- /.card-body -->
                  </div>
                  <!-- /.card -->
               </div>

            </div>
         </section>
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->

      <!-- /.control-sidebar -->

   </div>
   <!-- 우측 사이드바 -->
   <%@include file="../include/sidebar.jsp"%>
   <!-- footer -->
   <%@include file="../include/footer.jsp"%>
   <!-- ./wrapper -->
</body>
</html>
