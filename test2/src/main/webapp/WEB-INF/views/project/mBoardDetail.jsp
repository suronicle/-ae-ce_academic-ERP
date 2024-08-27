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
<title>BOARD DETAIL</title>

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
						<h1>DETAIL</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="/mMain">Home</a></li>
							<li class="breadcrumb-item active">상세보기</li>
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
	 <div class="col-md-12">
	      <div class="card card-primary card-outline">
	        <div class="card-header">
	          <h3 class="card-title"><img src = "${contextPath}/resources/dist/img/eye.png" style="width:25px;">&nbsp;${boardDetail.boardCount}</h3>
	
	          <div class="card-tools">
	            <a href="#" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
	            <a href="#" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
	          </div>
	        </div>
	        <!-- /.card-header -->
	        <div class="card-body p-0">
	          <div class="mailbox-read-info">
	            <h5>${boardDetail.boardNum}.${boardDetail.boardTitle }</h5>
	            <h6 style="opacity: 0.6;">&nbsp;ID : ${boardDetail.boardUserId}
	              <span class="mailbox-read-time float-right">Date ${boardDetail.boardDate}</span>
	             </h6>
	          </div>
	          <!-- /.mailbox-read-info -->
	          <div class="mailbox-controls with-border text-center">
	            <div class="btn-group">
	              <button type="button" class="btn btn-default btn-sm" data-container="body" title="Delete">
	                <i class="far fa-trash-alt"></i>
	              </button>
	              <button type="button" class="btn btn-default btn-sm" data-container="body" title="Reply">
	                <i class="fas fa-reply"></i>
	              </button>
	              <button type="button" class="btn btn-default btn-sm" data-container="body" title="Forward">
	                <i class="fas fa-share"></i>
	              </button>
	            </div>
	            <!-- /.btn-group -->
	            <button type="button" class="btn btn-default btn-sm" title="Print">
	              <i class="fas fa-print"></i>
	            </button>
	          </div>
	          <!-- /.mailbox-controls -->
	          <div class="mailbox-read-message">
	            <p>${boardDetail.boardContent}</p>
	
	          </div>
	          <!-- /.mailbox-read-message -->
	        </div>
	        <!-- /.card-footer -->
	        <div class="card-footer">
	          <div class="float-right">
	            <button type="button" class="btn btn-default"><i class="fas fa-reply"></i> Reply</button>
	            <button type="button" class="btn btn-default"><i class="fas fa-share"></i> Forward</button>
	          </div>
	          <c:if test="${boardDetail.boardDel == 0}">
	          <button type="button" class="btn btn-default"  onclick="delOk2()"><i class="far fa-trash-alt"></i>삭제</button>
	          </c:if>
	           <c:if test="${boardDetail.boardDel == 1}">
	          <button type="button" class="btn btn-default"  onclick="delOk()"><i class="far fa-trash-alt"></i>삭제</button>
	          </c:if>
	          <c:if test="${boardDetail.boardDel == 0}">
	          <button type="button" class="btn btn-default" onclick="location.href='/mBoardEdit?boardNum=${boardDetail.boardNum}'"><i class="fas fa-pencil-alt"></i>수정</button>
	          </c:if>
	          <c:if test="${boardDetail.boardDel == 1}">
	          <button type="button" class="btn btn-default" onclick="location.href='/mBoardRestore?boardNum=${boardDetail.boardNum}&userId=${user.userId}'"><i class="fas fa-pencil-alt"></i>복구</button>
	          </c:if>
	           <button type="button" class="btn btn-default" onclick="goBack()"><i class="fas fa-times"></i>뒤로가기</button>
	        </div>
	        <!-- /.card-footer -->
	      </div>
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

function goBack(){
 window.history.back();

}

function delOk(){
    if(!confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')){
        return false;
    }
    location.href = '/mBoardRecycleDelete?boardNum=${boardDetail.boardNum}&userId=${user.userId}&boardId=${boardDetail.boardId}';
}

function delOk2(){
    if(!confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')){
        return false;
    }
    location.href = '/mBoardDelete?boardNum=${boardDetail.boardNum}&userId=${user.userId}&boardId=${boardDetail.boardId}';
}

</script>

<!-- 우측 사이드바 -->
<%@include file="../include/sidebar.jsp"%>
<!-- footer -->
<%@include file="../include/mFooter.jsp"%>


</body>
</html>