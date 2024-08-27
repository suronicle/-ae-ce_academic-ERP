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
  .sbtn {
  margin-top:10px;}
 .files {
 max-width:600px;
 max-height:600px;
 object-fit:contain;
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
            <h1 class="m-0">출결 관리</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/mMain">Home</a></li>
              <li class="breadcrumb-item active">출결 상세</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
    <div class="contaner-fluid">
    <div class="row">
    <div class="col-12">
    <div class="card card-primary card-outline">
    <div class="card-header">
    <h3 class="card-title">상세보기</h3>
</div>
     	<div class="card-body">
     	<div class="form-group">
     	 <label>아이디</label>
     	 <input type="text" name="aId"class="form-control" value="${mattenDetail.aId}" readonly="readonly"/>
     	<label>작성 날짜</label>
     	 <input type="text" name="aDate"class="form-control" value="${mattenDetail.aDate}" readonly="readonly"/>
     	<label>출석 여부</label>
     	 <input type="text" name="aAttend" id="aAttend" class="form-control" value="<c:choose><c:when test="${mattenDetail.aAttend == 2}">지각</c:when><c:when test="${mattenDetail.aAttend == 3}">조퇴</c:when><c:when test="${mattenDetail.aAttend == 4}">연차</c:when><c:when test="${mattenDetail.aAttend == 5}">반차</c:when><c:when test="${mattenDetail.aAttend == 6}">결석</c:when></c:choose>" readonly="readonly">
     	<c:if test="${mattenDetail.userAdmin != 001}">
     	<label>사유</label>
     	 <textarea name="aReason" id="aReason" class="form-control" readonly="readonly" style="height:100px; resize: none;" maxlength="100">${mattenDetail.aReason}</textarea></c:if>
     	 <c:if test="${mattenDetail.userAdmin == 001}">
     	 <label>증빙 서류</label>
     	 <img class="card-img-bottom d-block files" src="/resources/dist/img/${mattenDetail.ranFileName}" onclick = "return file()" alt="증빙 서류">
     	 <%-- <button class="btn btn-secondary sbtn" onclick = "return file()"> ${mattenDetail.realFileName}</button> --%></c:if>
     	 </div>
     	 
    <!-- /.content -->
  <div class="d-flex justify-content-center">
  <div class="box-footer">
  	<button class="btn btn-success mBtn" onclick = "location.href = '/home'">메인</button>
  	<c:choose><c:when test="${mattenDetail.aConfirm != 101}">
  	<button class="btn btn-warning mBtn" type = "button" onclick = "location.href = '/attenUpdate?aId=${mattenDetail.aId}&aDate=${mattenDetail.aDate}&aAttend=${mattenDetail.aAttend}'">승인</button>
  	<button class="btn btn-danger mBtn"  onclick = "location.href = '/attenDeny?aId=${mattenDetail.aId}&aDate=${mattenDetail.aDate}'">반려</button></c:when>
  	<c:when test="${mattenDetail.aConfirm == 101}"></c:when>
  	</c:choose> 
  	<button class="btn btn-primary mBtn" onclick = "location.href = '/attenList'">목록</button>
  	</div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    
      
  <!-- /.content-wrapper -->
 
  


</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<script>
	function file() {
		var href="/resources/dist/img/${mattenDetail.ranFileName}";
		window.open(href, '_blank', 'width=1000, height=1000'); return false;
		
	}
	

</script>
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