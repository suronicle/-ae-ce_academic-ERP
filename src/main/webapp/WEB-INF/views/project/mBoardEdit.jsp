<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<%@include file="../include/mNavbar.jsp"%>
<!DOCTYPE html>

<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BOARD EDIT</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"  href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">

  <style>
  .mBtn {
  margin-right:10px;
  }
  </style>


<!-- summernote -->


<link rel="stylesheet" href="${contextPath}/resources/plugins/summernote/summernote-bs4.min.css">

</head>

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<%-- <script src="${contextPath}/resources/plugins/jquery/jquery.js"></script> --%>

<!-- Bootstrap 4 -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.js"></script>
<!-- Summernote -->
<script src="${contextPath}/resources/plugins/summernote/summernote-bs4.min.js"></script>

<script src="${contextPath}/resources/dist/js/board.js"></script>

<script>
$(function () {
//Add text editor
$('#compose-textarea').summernote()
})
</script>
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">

	<!-- 사이드바 -->
	<%@include file="../include/mSide.jsp"%>

<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Board Edit</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="/project/main">Home</a></li>
							<li class="breadcrumb-item active">수정</li>
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

      <div class="col-12">
      <form action = "/mBoardEdit" method = "post" name = "frm">
        <div class="card card-primary card-outline">
          <div class="card-header">
            <h3 class="card-title">Edit</h3>
          </div>
          <!-- /.card-header -->

          <div class="card-body">
          <div class="form-group">
              <input class="form-control" type = "hidden" name = "boardNum" value="${boardEdit.boardNum}" readonly>
              <input class="form-control" type = "hidden" name = "idCheck" value="${user.userId}" >
            </div>
            <div class="form-group">
              <input class="form-control" type = "text" name = "boardUserId" value="${boardEdit.boardUserId}" readonly>
            </div>
            <div class="form-group">
              <input class="form-control" type = "text" name = "boardTitle" value="${boardEdit.boardTitle}">
            </div>
			<div class="form-group">
			<input class="form-control" type = "text" name = "boardId" value="${boardEdit.pName}" readonly>
			</div>


            <div class="form-group">
                <textarea id="compose-textarea" class="form-control" style="height:300px; resize: none;" maxlength="100" name = "boardContent" >
                ${boardEdit.boardContent}
                </textarea>
            </div>
            <div class="form-group">
              <div class="btn btn-default btn-file">
                <i class="fas fa-paperclip"></i> Attachment
                <input type="file" name="attachment">
              </div>
              <p class="help-block">Max. 32MB</p>
            </div>
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <div class="float-right">
              <button type="reset" class="btn btn-default mBtn"><i class="fas fa-pencil-alt"></i> Reset</button>
              <button type="submit" class="btn btn-primary mBtn" onclick="return registerCheck()"><i class="far fa-envelope"></i>Save</button>
            </div>
            <button type="button" class="btn btn-default mBtn"><i class="fas fa-times" onclick="return goBack()"></i> Back</button>
          </div>
          <!-- /.card-footer -->

        </div>
         </form>
        <!-- /.card -->
      </div>
      <!-- /.col -->
 

    </div>
    <!-- /.row -->
  </div><!-- /.container-fluid -->
</section>
<!-- /.content -->
</div>

</div>
 <script type="text/javascript">
var isMessage = true;

<c:if test="${!empty msg}">
 if(isMessage){
	 alert("${msg}");
	 isMessage = false;
 }
</c:if>

function registerCheck(){
    if (document.frm.boardTitle.value == "") {
     alert("제목을 입력하셔야합니다.");
     frm.boardTitle.focus();
     return false;
    }
     if (document.frm.boardContent.value == "") {
     alert("내용을 입력하셔야합니다.");
     frm.boardContent.focus();
     return false;
    }
     if (document.frm.boardId.value == "10") {
     alert("게시판 종류를 선택하셔야합니다.");
     return false;
    }

 
 return true;
 
}



function goBack(){
 window.history.back();

}

</script>


<!-- 우측 사이드바 -->
<%@include file="../include/sidebar.jsp"%>
<!-- footer -->
<%@include file="../include/mFooter.jsp"%>


</body>
</html>