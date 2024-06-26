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
  <title>게시글 작성하기</title>

<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">
    <!-- summernote -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/summernote/summernote-bs4.min.css">
</head>

<!-- REQUIRED SCRIPTS -->


<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
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
							<h1>게시글 작성하기</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="/project/main?userId=${param.userId }">Home</a></li>
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
          <form action = "/register" method = "post" name = "frm">
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h3 class="card-title">New</h3>
              </div>
              <!-- /.card-header -->
              
              <div class="card-body">
                <div class="form-group">
                  <input class="form-control" type = "text" name = "boardUserId" value="${param.userId }" readonly>
                </div>
                <div class="form-group">
                  <input class="form-control" type = "text" name = "boardTitle" placeholder="제목 : ">
                </div>
				<div class="form-group">
								<select class="custom-select" name="boardId">
									<option value="10">--- 게시판 선택 ---</option>
									<c:if test="${user.pId.equals('002') }">
									<option value="202">강사게시판</option>
									</c:if>
									<c:if test="${user.pId.equals('003') }">
									<option value="203">공지사항</option>
									</c:if>
									<c:if test="${user.pId.equals('001') }">
									<option value="201">학원생게시판</option>
									</c:if>

									</select>
				</div>
				
									
                <div class="form-group">
                    <textarea id="compose-textarea" name = "boardContent" class="form-control" style="height:800px; resize: none;" maxlength="100" name = "boardContent"></textarea>
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
                  <button type="reset" class="btn btn-default"><i class="fas fa-pencil-alt"></i> 재작성</button>
                  <button type="submit" class="btn btn-primary" onclick="return registerCheck()"><i class="far fa-envelope"></i> 등록</button>
                </div>
                <button type="button" class="btn btn-default" onclick="goBack()"><i class="fas fa-times"></i> 뒤로가기</button>
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

  
	<!-- 우측 사이드바 -->
	<%@include file="../include/sidebar.jsp"%>
	<!-- footer -->
	<%@include file="../include/footer.jsp"%>

<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>
<!-- Summernote -->
<script src="${contextPath}/resources/plugins/summernote/summernote-bs4.min.js"></script>

<script src="${contextPath}/resources/dist/js/board.js"></script>
<script>
  $(function () {
    //Add text editor
    $('#compose-textarea').summernote()
  })
</script>

</body>
</html>
