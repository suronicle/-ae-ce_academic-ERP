<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>메일</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
   <!-- overlayScrollbars -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">
</head>
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">

  <%@ include file="../include/footer.jsp"%>
  <%@ include file="../include/mNavbar.jsp"%>
  <%@ include file="../include/mSide.jsp"%>

 

   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>발신함</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a
										href="/project/mMain?userId=${param.userId }">Home</a></li>
              <li class="breadcrumb-item active">메일</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
             <a href="/project/mMailSend?userId=${param.userId }" class="btn btn-primary btn-block mb-3">메일 보내기</a>

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
                  <a href="/project/mMail?userId=${param.userId }" class="nav-link">
                    <i class="fas fa-inbox"></i> 수신함
                    <span class="badge bg-primary float-right">${mailCount }</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="/project/mSend?userId=${param.userId }" class="nav-link">
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
                 <a  href="/project/mMailDel?userId=${param.userId }" class="nav-link">
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
            <div class="card-body p-0">
              <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <i class="far fa-circle text-danger"></i>
                    Important
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <i class="far fa-circle text-warning"></i> Promotions
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <i class="far fa-circle text-primary"></i>
                    Social
                  </a>
                </li>
              </ul>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
<div class="col-md-9">
  <div class="card card-primary card-outline">
    <div class="card-header">
      <h3 class="card-title">${param.userId }의 발신함</h3>

      <div class="card-tools">
        <div class="input-group input-group-sm">
          <input type="text" class="form-control" placeholder="Search Mail">
          <div class="input-group-append">
            <div class="btn btn-primary">
              <i class="fas fa-search"></i>
            </div>
          </div>
        </div>
      </div>
      <!-- /.card-tools -->
    </div>
    <!-- /.card-header -->
    <div class="card-body p-0">
      <div class="mailbox-controls">
        <!-- Check all button -->
        <button type="button" class="btn btn-default btn-sm checkbox-toggle">
          <i class="far fa-square"></i>
        </button>
        <div class="btn-group">
          <button type="button" class="btn btn-default btn-sm">
            <i class="far fa-trash-alt"></i>
          </button>
          <button type="button" class="btn btn-default btn-sm">
            <i class="fas fa-reply"></i>
          </button>
          <button type="button" class="btn btn-default btn-sm">
            <i class="fas fa-share"></i>
          </button>
        </div>
        <!-- /.btn-group -->
        <button type="button" class="btn btn-default btn-sm">
          <i class="fas fa-sync-alt"></i>
        </button>
        <div class="float-right">
          1-50/200
          <div class="btn-group">
            <button type="button" class="btn btn-default btn-sm">
              <i class="fas fa-chevron-left"></i>
            </button>
            <button type="button" class="btn btn-default btn-sm">
              <i class="fas fa-chevron-right"></i>
            </button>
          </div>
          <!-- /.btn-group -->
        </div>
        <!-- /.float-right -->
      </div>
      <div class="table-responsive mailbox-messages" style="height:700px;">
        <table class="table table-hover table-striped" >
          <tbody>
            <c:forEach var="mail" items="${mail}" begin="0" end="10" varStatus="status">
              <tr>
                <td>
                  <div class="icheck-primary">
                    <input type="checkbox" value="${status.index + 1}" id="check${status.index + 1}">
                    <label for="check${status.index+1 }"></label>
                  </div>
                </td>
                <td class="mailbox-star">
                <c:if test="${mail.mailCount==0 }">
                  <a href="#"><i class="fas fa-star text-warning"></i></a>
                   </c:if>
                    <c:if test="${mail.mailCount==1 }">
                  <a href="#"><i class="fas fa-star text-light"></i></a>
                   </c:if>
                </td>
                <td class="mailbox-name">
                  <a href="/project/mSelectSendMail?receiveId=${mail.receiveId }&mailNum=${mail.mailNum}">${mail.receiveId}</a>
                </td>
 <td class="mailbox-subject">
                                <b>${mail.mailTitle}&nbsp;&nbsp;-&nbsp;&nbsp;</b>
                                <c:choose>
                                    <c:when test="${fn:length(mail.mailContent) > 10}">
                                        ${fn:substring(mail.mailContent, 0, 10)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${mail.mailContent}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                <td class="mailbox-attachment"></td>
                <td class="mailbox-date">${mail.mailDate }</td>
                <c:if test="${mail.mailCount==1 }">
                  <td>읽음</td>
                </c:if>
                <c:if test="${mail.mailCount==0 }">
                  <td style="color:skyblue">안 읽음</td>
                </c:if>
              </tr>
            </c:forEach>
          </tbody>
        </table>
        <!-- /.table -->
      </div>
      <!-- /.mail-box-messages -->
    </div>
    <!-- /.card-body -->
    <div class="card-footer p-0">
      <div class="mailbox-controls">
        <!-- Check all button -->
        <button type="button" class="btn btn-default btn-sm checkbox-toggle">
          <i class="far fa-square"></i>
        </button>
        <div class="btn-group">
          <button type="button" class="btn btn-default btn-sm">
            <i class="far fa-trash-alt"></i>
          </button>
          <button type="button" class="btn btn-default btn-sm">
            <i class="fas fa-reply"></i>
          </button>
          <button type="button" class="btn btn-default btn-sm">
            <i class="fas fa-share"></i>
          </button>
        </div>
        <!-- /.btn-group -->
        <button type="button" class="btn btn-default btn-sm">
          <i class="fas fa-sync-alt"></i>
        </button>
        <div class="float-right">
          1-50/200
          <div class="btn-group">
            <button type="button" class="btn btn-default btn-sm">
              <i class="fas fa-chevron-left"></i>
            </button>
            <button type="button" class="btn btn-default btn-sm">
              <i class="fas fa-chevron-right"></i>
            </button>
          </div>
          <!-- /.btn-group -->
        </div>
        <!-- /.float-right -->
      </div>
    </div>
  </div>
  <!-- /.card -->
</div>
<!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
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
</body>
</html>
