<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>관리자</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
   <!-- overlayScrollbars -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">
  
    <style>
  .mBtn {
  margin-right:10px;
  }
  


  </style>
  
</head>


<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">

<%@ include file="../include/mFooter.jsp" %>
  <%@ include file="../include/mNavbar.jsp" %>
  <%@ include file="../include/mSide.jsp" %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">강의 관리</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/home">Home</a></li>
              <li class="breadcrumb-item active">Starter Page</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    
    <div class="content">
    <form action="/lessonInsert" method="post" name="lessonpost" >
    <div class="contaner-fluid">
    <div class="row">
    <div class="col-12">
    <div class="card card-primary card-outline">
    <div class="card-header">
    <h3 class="card-title">상세보기</h3>
   </div>
        <div class="card-body">
        <div class="form-group">
        <label>강의 명</label>
         <input type="text" name="lectureName"class="form-control" value=""/>
         <input type="hidden" name="lecDel" class="form-control" value="0"/>
         <label>강의 번호</label>
          <input type="text" name="lectureNum" class="form-control" value="" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required/>
        <label>강의 기간</label>
         <input type="date" name="lectureDateStart"class="form-control" value="" max="9999-12-31"/> 
         <input type="date" name="lectureDateEnd" class="form-control" value="" max="9999-12-31"/> 
        <div class="form-group">
        <label>담당 강사</label>
        <div>
         <select id="userId" class="form-control" name="userId" required>
             <option selected value="">담당 강사</option>
                   <c:forEach var="teacher" items = "${teacherFind}">
                      <option id = "userId" value="<c:out value="${teacher.userId}"/>"><c:out  value="${teacher.userName}"></c:out>
                   </c:forEach>
             </select></div>
        <label>강의 내용</label>
        <textarea name="lectureContent" rows="5"
        class="form-control"></textarea>
    <!-- /.content -->
  </div>
      
  <div class="d-flex justify-content-center">
  <div class="box-footer">
     <button class="btn btn-success mBtn" type="button" onclick = "location.href = '/home'">메인</button>
     <button class="btn btn-warning mBtn" name="insertpost">등록</button>
     <button class="btn btn-primary mBtn" type="button" onclick = "location.href = '/lesson'">목록</button>
     </div>
     </div>
     </div>
     </div>
     </div>
     </div>
     </div>
     </div></form>
     </div>
    </div>

  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->

</div>
<!-- ./wrapper -->
<script>
var isMessage = true;

<c:if test="${!empty msg}">
 if(isMessage){
    alert("${msg}");
    isMessage = false;
 }
</c:if>
</script>
<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="${contextPath}/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="${contextPath}/resources/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="${contextPath}/resources/plugins/raphael/raphael.min.js"></script>
<script src="${contextPath}/resources/plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="${contextPath}/resources/plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="${contextPath}/resources/plugins/chart.js/Chart.min.js"></script>


<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${contextPath}/resources/dist/js/pages/dashboard2.js"></script>
</body>
</html>
