<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>주소록</title>
</head>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">
</head>
<body>


	<div class="card-body table-responsive p-0" style="height: 650px;">
	<form action = "/address" method="post" name = "frm">
		<table class="table table-head-fixed text-nowrap">
			<thead>
				<tr>
				<th>아이디</th>
					<th>이름</th>
					<th>직책</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="mail" items="${emailAddress}">
					<tr>

						<td>${mail.userId}</td>
						<td>${mail.userName}</td>
						<td>${mail.pName}</td>
						<td><input type="hidden" id = "userEmail" value="${mail.userEmail}">
						<button type="button" class="btn btn-light" onclick="useAddress('${mail.userEmail}', '${mail.userId}')">${mail.userEmail}</button>
						</td>
						
						
					</tr>
				</c:forEach>

			</tbody>
		</table>
		</form>
	</div>
	<!-- /.card-body -->
	<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>

<script src="${contextPath}/resources/dist/js/mail.js"></script>


</body>
</html>