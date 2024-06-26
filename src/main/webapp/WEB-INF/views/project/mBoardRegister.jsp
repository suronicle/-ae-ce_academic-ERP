<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>
<%@include file="../include/mNavbar.jsp"%>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글 작성하기</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"  href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">


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
<script>
$(function () {
    //Add text editor
    $('#compose-textarea').summernote()
  })
</script>
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">
<!-- navbar -->
	

	<!-- 사이드바 -->
	<%@include file="../include/mSide.jsp"%>

	<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>게시글 작성하기</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/mMain">Home</a></li>
								<li class="breadcrumb-item active">작성하기</li>
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
	      <form action = "/mBoardRegister" method = "post">
	        <div class="card card-primary card-outline">
	          <div class="card-header">
	            <h3 class="card-title">New</h3>
	          </div>
	          <!-- /.card-header -->
	
	          <div class="card-body">
	            <div class="form-group">
	              <input class="form-control" type = "text" name = "boardUserId" value="${boardUser.userId}" readonly>
	            </div>
	            <div class="form-group">
	              <input class="form-control" type = "text" name = "boardTitle" placeholder="제목 : " required>
	              <input class="form-control" type = "hidden" name = "boardDel" value="0">
	            </div>
				<div class="form-group">
								<select class="custom-select" name="boardId" required>
									<option value="" disabled selected>--- 게시판 선택 ---</option>
									<c:if test="${boardUser.pId.equals('002') }">
									<option value="202">강사 게시판</option>
									</c:if>
									<c:if test="${boardUser.pId.equals('003')}">
									<option value="203">공지사항</option>
									</c:if>
									<c:if test="${boardUser.pId.equals('001') }">
									<option value="201">학원생 게시판</option>
									</c:if>
									</select>
				</div>
	
	
	            <div class="form-group">
	                <textarea id="compose-textarea"  class="form-control" style="height:800px; resize: none;" maxlength="100" name = "boardContent" required></textarea>
	            </div>
	            <div class="form-group">
	              <div class="btn btn-default btn-file">
	                <i class="fas fa-paperclip"></i> 파일 첨부
	                <input type="file" name="attachment">
	              </div>
	              <p class="help-block">Max. 32MB</p>
	            </div>
	          </div>
	          <!-- /.card-body -->
	          <div class="card-footer">
	            <div class="float-right">
	              <button type="reset" class="btn btn-default"><i class="fas fa-pencil-alt"></i>초기화</button>
	              <button type="submit" class="btn btn-primary" onclick="registerCheck()"><i class="far fa-envelope"></i>등록</button>
	            </div>
	            <button type="button" class="btn btn-default" onclick="goBack()"><i class="fas fa-times"></i>뒤로가기</button>
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
<script>

function registerCheck(){
    if (document.frm.boardTitle.value == "") {
     alert("제목을 입력하셔야합니다.");
     frm.boardTitle.focus();
     return false;
    }

 
 return true;
 
}

function goBack(){
	 history.back();

	}


</script>

<!-- 우측 사이드바 -->
<%@include file="../include/sidebar.jsp"%>
<!-- footer -->
<%@include file="../include/mFooter.jsp"%>



</body>
</html>