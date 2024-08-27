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
  
  <style>
  
  .card-body {
overflow:auto;
overflow-x:hidden;
height:600px;
}
  
  </style>
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
      <%@ include file="../include/mNavbar.jsp" %>
      
            <!-- 사이드바 -->
      <%@ include file="../include/mSide.jsp" %>
      
         <!-- 우측 사이드바 -->
   <%@ include file="../include/sidebar.jsp" %>


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
                        <li class="breadcrumb-item"><a href="/mMain">Home</a></li>
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
                           <h3 class="card-title"><a href="/mNBoard?userId=${user.userId}">공지사항</a></h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body table-responsive p-0"  style="height: 570px">
                           <table class="table table table-head-fixed text-nowrap">
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
                              <c:forEach var="nBoard" items="${nBoard}">
                                 <tr>
                                 	<td>${nBoard.boardNum}</td>
                                    <td>${nBoard.boardTitle}</td>
                                    <td>${nBoard.boardUserId}</td>
                                    <td>${nBoard.pName}</td>
                                    <td>${nBoard.boardDate}</td>
                                    <td>${nBoard.boardCount}</td>
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
                  <div class="col-md-6">
                     <div class="card" >
                        <div class="card-header">
                           <h3 class="card-title"><a href="/mTBoard?userId=${user.userId}">강사 게시판</a></h3>
							</div>
                        <!-- /.card-header -->
                        <div class="card-body table-responsive p-0" style="height:254px">
                           <table class="table table table-head-fixed text-nowrap">
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
                              <c:forEach var="tBoard" items="${tBoard}">
                                <c:if test="${tBoard.boardId == 202}"><tr>
                                 	<td>${tBoard.boardNum}</td>
                                    <td>${tBoard.boardTitle}</td>
                                    <td>${tBoard.boardUserId}</td>
                                    <td>${tBoard.pName}</td>
                                    <td>${tBoard.boardDate}</td>
                                    <td>${tBoard.boardCount}</td>
                                 </tr></c:if>
                               </c:forEach>
                              </tbody>
                           </table>
                        </div>
                        <!-- /.card-body -->
                     </div>
                     <!-- /.card -->
                     <div class="card">
                        <div class="card-header">
                           <h3 class="card-title"><a href="/mSBoard?userId=${user.userId}">학원생 게시판</a></h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body table-responsive p-0" style="height:254px">
                           <table class="table table table-head-fixed text-nowrap">
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
                              <c:forEach var="sBoard" items="${sBoard}">
                                <c:if test="${sBoard.boardId == 201}"><tr>
                                 	<td>${sBoard.boardNum}</td>
                                    <td>${sBoard.boardTitle}</td>
                                    <td>${sBoard.boardUserId}</td>
                                    <td>${sBoard.pName}</td>
                                    <td>${sBoard.boardDate}</td>
                                    <td>${sBoard.boardCount}</td>
                                 </tr></c:if>
                               </c:forEach>
                              </tbody>
                           </table>
                        </div>
                        <!-- /.card-body -->
                     </div>
                     
                     <!-- /.card -->
                  </div>
                  <!-- /.col -->
               </div>
                     </div>
                     
                     </section>
               <!-- /.row -->
</div>

         
            </div>
            <!-- /.container-fluid -->

         <!-- /.content -->
      <!-- /.content-wrapper -->
  
  
  
  



   <!-- footer -->
   <%@ include file="../include/mFooter.jsp" %>


</body>
</html>