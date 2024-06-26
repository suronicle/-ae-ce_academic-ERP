<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>메일 작성하기</title>

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
<body
	class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
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
            <h1>작성</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
										href="/project/main?userId=${param.userId }">Home</a></li>
              <li class="breadcrumb-item active">작성</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

     <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
             <a href="/project/mail?userId=${param.userId }" class="btn btn-primary btn-block mb-3">수신함</a>

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Folders</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="card-body p-0">
                <ul class="nav nav-pills flex-column">
                <li class="nav-item active">
                  <a href="/project/mail?userId=${param.userId }" class="nav-link">
                    <i class="fas fa-inbox"></i> 수신함
                    <span class="badge bg-primary float-right">${mailCount }</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="/project/send?userId=${param.userId }" class="nav-link">
                    <i class="far fa-envelope"></i> 발신함
                  </a>
                </li>
                  <li class="nav-item">
                   <a  href="javascript:alert('준비중입니다.');" class="nav-link">
                      <i class="far fa-file-alt"></i> Drafts
                    </a>
                  </li>
                  <li class="nav-item">
                    <a  href="javascript:alert('준비중입니다.');" class="nav-link">
                      <i class="fas fa-filter"></i> Junk
                      <span class="badge bg-warning float-right">65</span>
                    </a>
                  </li>
                  <li class="nav-item">
                   <a  href="/project/mailDel?userId=${param.userId }" class="nav-link">
                      <i class="far fa-trash-alt"></i> 휴지통
                    </a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Labels</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <ul class="nav nav-pills flex-column">
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="far fa-circle text-danger"></i> Important</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="far fa-circle text-warning"></i> Promotions</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="far fa-circle text-primary"></i> Social</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
          
          <div class="col-md-9" >
          <form action="/mailRegister" method="post" name = "frm">
            <div class="card card-primary card-outline" >
              <div class="card-header">
                <h3 class="card-title">메일 작성하기</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body" style="height: 650px;">
				<div class="form-group" style="display: flex; align-items: center;">
				<input type="hidden" name = "userId" value="${param.userId }">
				    <input class="form-control" placeholder="To:" style="flex: 1;" name = "userEmail" id="userEmail" readonly>
				     <input  type="hidden"  name = "receiveId" id="receiveId">
				    <input type="button" onclick="return addressCheck()" value="주소록" style="margin-left: 10px;" class="btn btn-primary">
				</div>
                <div class="form-group">
                  <input class="form-control" placeholder="제목" name = "mailTitle">
                </div>
                <div class="form-group">
                    <textarea id="compose-textarea" class="form-control" name = "mailContent">

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
                  <button type="reset" class="btn btn-default"><i class="fas fa-pencil-alt"></i> 리셋</button>
                  <button type="submit" class="btn btn-primary" onclick="return sendMail()"><i class="far fa-envelope"></i> 보내기</button>
                </div>
                <button type="button" class="btn btn-default" onclick="goBack();"><i class="fas fa-times"></i> 뒤로가기</button>
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </form>
          </div>
          <!-- /.col -->
         
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

	<!-- 우측 사이드바 -->
	<%@include file="../include/sidebar.jsp"%>
	<!-- footer -->
	<%@include file="../include/footer.jsp"%>

</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>
<!-- Summernote -->
<script src="${contextPath}/resources/plugins/summernote/summernote-bs4.min.js"></script>

<script src="${contextPath}/resources/dist/js/mail.js"></script>


<!-- Page specific script -->
<script>
  $(function () {
    //Enable check and uncheck all functionality
    $('.checkbox-toggle').click(function () {
      var clicks = $(this).data('clicks')
      if (clicks) {
        //Uncheck all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
      } else {
        //Check all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
        $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
      }
      $(this).data('clicks', !clicks)
    })

    //Handle starring for font awesome
    $('.mailbox-star').click(function (e) {
      e.preventDefault()
      //detect type
      var $this = $(this).find('a > i')
      var fa    = $this.hasClass('fa')

      //Switch states
      if (fa) {
        $this.toggleClass('fa-star')
        $this.toggleClass('fa-star-o')
      }
    })
  })
</script>
<script>
  $(function () {
    //Add text editor
    $('#compose-textarea').summernote()
  })
</script>
</body>
</html>