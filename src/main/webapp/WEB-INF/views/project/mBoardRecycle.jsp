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
    
  .mBtn {
  margin-right:10px;
  }
  
  .card-body {
overflow:auto;
overflow-x:hidden;
height:600px;
}
  
  </style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>게시판 휴지통</title>

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
                     <h1>게시판 휴지통</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/mMain">Home</a></li>
                        <li class="breadcrumb-item active">게시판 휴지통</li>
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
               <form name="RecycleList" action="/mBoardRecycleDelete2" method="post">
                <input type="hidden" id = "userId" name = "userId" value="${user.userId}"/>
                  <table class="table table-head-fixed text-nowrap">
                     <thead>
                        <tr>
                        <th><input id = "allChk" type="checkbox" onClick = "allCheck(this)" name = "allChk" value = "allcheck"/></th>
                           <th>#</th>
                           <th>제목</th>
                           <th>아이디</th>
                           <th>직책</th>
                           <th>날짜</th>                          
                           <th>조회수</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="mBoardRecycle" items="${mBoardRecycle}">
                           <tr>
                           <td><input name = "RowCheck" type="checkbox" class="RowCheck" onclick = "chk(this)" value="${mBoardRecycle.boardNum}"></td>
                              <td><a href="/mBoardDetail?boardNum=${mBoardRecycle.boardNum}&userId=${user.userId}">${mBoardRecycle.boardNum}</a></td>
                              <td>${mBoardRecycle.boardTitle}</td>
                              <td>${mBoardRecycle.boardUserId}</td>
                              <td>${mBoardRecycle.pName}</td>
                              <td>${mBoardRecycle.boardDate}</td>
                              <td>${mBoardRecycle.boardCount}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                  </form>
               </div>
              <div class="card-footer">
                <div class="float-left">
                 <button type="button" class="btn btn-default mBtn" onclick="location.href='/mBoard?userId=${user.userId}'"><i class="fas fa-times"></i>뒤로가기</button>
                </div>
               <div class="d-flex justify-content-center">
                <button id = "delete" class="btn btn-danger mBtn" type = "button" onclick = "toDelete()" disabled>선택 삭제</button>
              </div>
              </div>
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
   var rc = document.getElementsByName('RowCheck');
   const target = document.getElementById('delete');
   var count = 0;
   var leng = $("input:checkbox[name=RowCheck]").length;
var isMessage = true;

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

   <!-- 우측 사이드바 -->
   <%@include file="../include/sidebar.jsp"%>
   <!-- footer -->
   <%@include file="../include/mFooter.jsp"%>


</body>
</html>