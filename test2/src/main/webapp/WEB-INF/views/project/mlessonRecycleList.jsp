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
            <h1 class="m-0">강의 휴지통</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/home">Home</a></li>
              <li class="breadcrumb-item active">강의 휴지통</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
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
    <!-- Main content -->

        <!-- /.card-header -->
        <div class="card-body table-responsive p-0" style="height: 500px;">
        <form name="RecycleList" action = "/recycleDelete2" method="post">
      <table class="table table-head-fixed text-nowrap">
     		<thead>
     		<tr>
     			<th><input id = "allChk" type="checkbox" onClick = "allCheck(this)" name = "allChk" value = "allcheck"/></th>
     			<th>강의 번호</th>
     			<th>강의 명</th>
     			<th>강의 내용</th>
     			<th>개강 날짜</th>
     			<th>종강 날짜</th>
     			<th>강의 정보</th>
     		</tr>
     		</thead>
     		<tbody>
     		<c:forEach var="mlessonRecycleList" items="${mlessonRecycleList}">
     			<tr>
     			<td><input name = "RowCheck" type="checkbox" class="RowCheck" onclick = "chk(this)" value="${mlessonRecycleList.lectureNum}"></td>
     			<td>${mlessonRecycleList.lectureNum}</td>
     			<td>${mlessonRecycleList.lectureName}</td>
     			<td>${mlessonRecycleList.lectureContent}</td>
     			<td>${mlessonRecycleList.lectureDateStart}</td>
     			<td>${mlessonRecycleList.lectureDateEnd}</td>
     			<td><a href="lessonDetail?lectureNum=${mlessonRecycleList.lectureNum}">상세보기</a></td>
     		</tr>
     		</c:forEach>
     		</tbody>
     	</table>
     	</form>
     	</div>
     	<div class="card-footer">
  		<div class="float-left">
  		<button type="button" class="btn btn-default mBtn" onclick="location.href='/lesson'"><i class="fas fa-times"></i>뒤로가기</button>
  		</div>
  		<div class="d-flex justify-content-center">
     	<button id = "delete" class="btn btn-danger mBtn" type = "button" onclick = "toDelete()" disabled>선택 삭제</button>
     	</div>
     	</div>
     	</div>
     	
    </div>
    <!-- /.content -->
  </div>
  </div>

  <!-- /.content-wrapper -->


<!-- ./wrapper -->
<script>
var isMessage = true;
var rc = document.getElementsByName('RowCheck');
const target = document.getElementById('delete');
var count = 0;
var leng = $("input:checkbox[name=RowCheck]").length;

<c:if test="${!empty msg}">
 if(isMessage){
	 alert("${msg}");
	 isMessage = false;
 }
</c:if>

function chk(rc) {
	
	 const checkboxes 
     = document.querySelectorAll('input[name="RowCheck"]');

const checked = document.querySelectorAll('input[name="RowCheck"]:checked');

const selectAll 
  = document.querySelector('input[name="allChk"]');

if(checkboxes.length === checked.length) {
	  selectAll.checked = true;
} else {selectAll.checked = false;}

	if(rc.checked) {
		count = count + 1;
	} else if(rc.checked != true) {
		count = count - 1;
	}
	
	if(count > 0) {
		target.disabled = false;
	} else if(count <= 0){
		target.disabled = true;
	}
	
}

function allCheck(allcheck)  {
	 
	 const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = allcheck.checked;
	  })
	  
	  
	  if(allChk.checked) {count = leng;} else {count = 0;}
	  
	 
	  
		if(count > 0) {

			target.disabled = false;
		} else if(count <= 0){

			target.disabled = true;
		}

	  
	}
	
	function toDelete() {
		var rc = document.RecycleList.RowCheck;
		
		flag = false;
		
		for(i=0; i<rc.length; i++) {
			if(rc[i].checked) {
				flag = true;
			}
		}
		
		if(rc.checked == true) {
			flag = true;
		}
		
		if(flag == false) {
			alert("삭제할 강의를 하나 이상 선택해 주세요.");
			return false;
		} else if(flag == true) {
			document.RecycleList.submit();
		}
		
	}

	

</script>
<!-- REQUIRED SCRIPTS -->

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
