<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
.card-body {
overflow:auto;
overflow-x:hidden;
height:600px;
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
              <li class="breadcrumb-item"><a href="/home">Home</a></li>
              <li class="breadcrumb-item active">출결 관리</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="col-12">
    <div class="card">
    <div class="card-header">
    	<h3 class="card-title">출결 관리</h3>
    </div>
    <form action ="/attenDetail" method="get">
    <div class="card-body table-responsive p-0">
     	<table class="table table-head-fixed text-nowrap">
     		<thead>
     		<tr>
     			<th>아이디</th>
     			<th>작성 날짜</th>
     			<th>출석 여부</th>
     			<th>사유</th>
     			<th>승인 여부</th>
     			<th>반려 이유</th>
     		</tr>
     		</thead>
     		<tbody>
     		<c:forEach var="mattenList" items="${mattenList}">
     		<tr>
     		<td><a href="attenDetail?aId=${mattenList.aId}&aDate=${mattenList.aDate}"> ${mattenList.aId}</a></td>
     		<td>${mattenList.aDate}</td>
     		<td><c:choose>
     		<c:when test="${mattenList.aAttend == 2}">지각</c:when>
     		<c:when test="${mattenList.aAttend == 3}">조퇴</c:when>
     		<c:when test="${mattenList.aAttend == 4}">연차</c:when>
     		<c:when test="${mattenList.aAttend == 5}">반차</c:when>
     		<c:when test="${mattenList.aAttend == 6}">결석</c:when>
     		</c:choose></td>
     		<td><c:choose>
     		<c:when test="${mattenList.userAdmin == 001}">${mattenList.realFileName}</c:when>
     		<c:when test="${mattenList.userAdmin != 001}">${mattenList.aReason}</c:when>
     		</c:choose></td>
     		<td style="<c:choose><c:when test="${mattenList.aConfirm == 101}">color:skyblue;</c:when> <c:when test="${mattenList.aConfirm == 102}">color:red;</c:when></c:choose>">
     		<c:choose><c:when test="${mattenList.aConfirm == 100}">미승인</c:when>
     		<c:when test="${mattenList.aConfirm == 101}">승인</c:when>
     		<c:when test="${mattenList.aConfirm == 102}">반려</c:when>
     		</c:choose></td>
     		<td>${mattenList.aDeny}</td>
     		</tr>
     		</c:forEach>
     		</tbody>
     	</table>
     	</div></form></div>
    </div>
 
    <div class="container">
     <div class="d-flex justify-content-center">
     		<div class="row">
     			<form action = "/serchList">
     				<table class="pull-right">
     					<tr>
     						<td><select class="form-control" name="serachField">
     							<option value="0">선택</option>
     							<option value="aId"<c:if test="${serachField eq 'aId'}">selected</c:if>>아이디</option>
     							<option value="aDate"<c:if test="${serachField eq 'aDate'}">selected</c:if>>작성 날짜</option>
     							<option value="aAttend"<c:if test="${serachField eq 'aAttend'}">selected</c:if>>출석 여부</option>
     							<option value="aConfirm"<c:if test="${serachField eq 'aConfirm'}">selected</c:if>>승인 여부</option>
     						</select></td>
     						<td><input type="text" class="form-control" placeholder="검색어 입력" name="serachText"
     						maxlength="100"></td>
     						<td><button class="btn btn-success" id = "serchBtn">검색</button></td>
     						</tr>
     				</table>
     			</form>
     		</div>
     		</div>
     	</div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->



<script>
var isMessage = true;

<c:if test="${!empty msg}">
 if(isMessage){
	 alert("${msg}");
	 isMessage = false;
 }
</c:if>
</script>

<script>
		document.getElementById("searchBtn").onclick = function () {
			let serachField = document.getElementsByName("serachField")[0].value;
			let serachText = document.getElementsByName("serachText")[0].value;
			let url = "/serchList?serachField=" + serachField + "&serachText=" + serachText;
			location.href = encodeURI(url);
		};
	</script>
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->


</div>
<!-- ./wrapper -->

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
