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
<title>근태 리스트</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/adminlte.min.css">
</head>
<body>

	<div class="card-body table-responsive p-0" style="height: 650px;">
		<table class="table table-head-fixed text-nowrap">
			<thead>
				<tr>
					<th>근태 명칭</th>
					<th>사유</th>
					<th>기간</th>
					<th>승인 여부</th>
					<th>승인 날짜</th>
					<th>반려 사유</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="attendlist" items="${sAttendList}">
					<tr>
						<td>${attendlist.aName}</td>
						<td>${attendlist.aReason}</td>
						<td>${attendlist.aDate}</td>
						<td>${attendlist.pName}</td>
						<td>${attendlist.aConfirmDate}</td>
						<td style="color: red;">${attendlist.aDeny}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
	<!-- /.card-body -->



	<!-- jQuery -->
	<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>

	<script src="${contextPath}/resources/dist/js/member.js"></script>
</body>
</html>