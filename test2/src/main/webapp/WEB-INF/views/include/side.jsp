<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이드바</title>
</head>
<body>

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="http://localhost:8081/" class="brand-link">
      <img src="${contextPath}/resources/dist/img/logo.png" alt="AdminLTE Logo" width="40px">
      <span class="brand-text font-weight-light">[æ]ce</span>
    </a>
<!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">

				<div class="info">

					<c:if test="${user!=null && user.userAdmin.equals('001')}">
						<div class="image">
							<img src="${contextPath}/resources/dist/img/person.png"
								alt="User Image"><a
								href="/project/findpassword" class="d-block">${user.userName }님(${user.pName})
								
								</a>
							
						</div>
						
					</c:if>
					<c:if test="${user!=null && user.userAdmin.equals('002')}">
						<div class="image">
							<img src="${contextPath}/resources/dist/img/person.png"
								alt="User Image"> <a
								href="/project/findpassword" class="d-block">${user.userName }님(${user.pName })</a>
								
						</div>
					
					</c:if>
				
				
					<c:if test="${user==null}">
						<a href="#" class="d-block">안녕하세요</a>
					</c:if>
			
		
				</div>
			</div>

			<!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>
      
 <!-- Sidebar Menu -->
 
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-close">
            <a href="#" class="nav-link">
              <img src="${contextPath}/resources/dist/img/member_icon_50.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-1" width="25px">
              <p>
               	회원
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${contextPath}/project/join" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원가입</p>
                </a>
              </li>
              <c:if test="${user==null }">
              <li class="nav-item">
                <a href="${contextPath}/project/login" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>로그인</p>
                </a>
              </li>
              </c:if>
              <c:if test="${user!=null }">
              <li class="nav-item">
                <a href="${contextPath}/project/logOut" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>로그아웃</p>
                </a>
              </li>
              </c:if>
                <li class="nav-item">
                <a href="${contextPath}/project/findpassword" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>비밀번호 찾기</p>
                </a>
              </li>
            </ul>
          </li>

 


          
          <!-- 학생 -->

			<c:if test="${user!=null && user.userAdmin.equals('001')}">

                  <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
					   <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <img src="${contextPath}/resources/dist/img/student.png" alt="AdminLTE Logo" class="brand-image" width="25px">
              <p>
               	학원생
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="${contextPath}/project/sAttendance?userId=${user.userId }"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>출결 관리</p>
								</a></li>
								<li class="nav-item"><a href="${contextPath}/project/sInformation?userId=${user.userId }"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>나의 강의</p>
								</a></li>
								<li class="nav-item"><a href="./sInforRegister?userId=${param.userId}" class="nav-link">
										<i class="far fa-circle nav-icon"></i> 수강신청
								</a></li>
							</ul></li>

						<li class="nav-item">
		          <a href="#" class="nav-link">
		              <img src="${contextPath}/resources/dist/img/board.png" alt="AdminLTE Logo" class="brand-image" width="25px">
		              <p>
		               	게시판
		                <i class="right fas fa-angle-left"></i>
		              </p>
		            </a>
		            <ul class="nav nav-treeview">
		               <li class="nav-item">
		                <a href="${contextPath}/project/board?userId=${user.userId}" class="nav-link">
		                  <i class="far fa-circle nav-icon"></i>
		                  <p>전체</p>
		                </a>
		              </li>
		              <li class="nav-item">
		                <a href="${contextPath}/project/nBoard?userId=${user.userId}" class="nav-link">
		                  <i class="far fa-circle nav-icon"></i>
		                  <p>공지사항</p>
		                </a>
		              </li>

		    		   <li class="nav-item">
		                <a href="${contextPath}/project/sBoard?userId=${user.userId}" class="nav-link">
		                  <i class="far fa-circle nav-icon"></i>
		                  <p>학원생 게시판</p>
		                </a>
		              </li>
		               <li class="nav-item">
		                <a href="${contextPath}/project/boardRegister?userId=${user.userId}" class="nav-link">
		                  <i class="far fa-circle nav-icon"></i>
		                  <p>게시글 작성하기</p>
		                </a>
		              </li>
		            </ul>
		          </li>
		        <li class="nav-item menu-close">
          
                <a href="#" class="nav-link">
              <i class="nav-icon far fa-envelope"></i>
              <p>
                메일
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
               <a href="${contextPath}/project/mail?userId=${user.userId}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>수신</p>
                </a>
              </li>
         
                       <li class="nav-item">
           <a href="${contextPath}/project/send?userId=${user.userId}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>발신</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="${contextPath}/project/mailSend?userId=${user.userId}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>메일 보내기</p>
                </a>
              </li>
           <li class="nav-item">
                <a href="${contextPath}/project/mailDel?userId=${user.userId}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>휴지통</p>
                </a>
              </li>
             
            </ul>
          </li>
			</c:if>




			<!-- 강사 -->
				<c:if test="${user!=null && user.userAdmin.equals('002')}">
			
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <img src="${contextPath}/resources/dist/img/teacher_icon_50.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-1" width="25px">
              <p>
               	강사
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${contextPath}/project/tPInfo?userId=${user.userId}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>강의 관리</p>
                </a>
              </li>
         
              <li class="nav-item">
                <a href="${contextPath}/project/tAttend?userId=${user.userId}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>근태 관리</p>
                </a>
              </li>
		</ul>
		</li>
		    <li class="nav-item">
		          <a href="#" class="nav-link">
		              <img src="${contextPath}/resources/dist/img/board.png" alt="AdminLTE Logo" class="brand-image" width="25px">
		              <p>
		               	게시판
		                <i class="right fas fa-angle-left"></i>
		              </p>
		            </a>
		            <ul class="nav nav-treeview">
		               <li class="nav-item">
		                <a href="${contextPath}/project/board?userId=${user.userId}" class="nav-link">
		                  <i class="far fa-circle nav-icon"></i>
		                  <p>전체</p>
		                </a>
		              </li>
		              <li class="nav-item">
		                <a href="${contextPath}/project/nBoard?userId=${user.userId}" class="nav-link">
		                  <i class="far fa-circle nav-icon"></i>
		                  <p>공지사항</p>
		                </a>
		              </li>
		         
		              <li class="nav-item">
		                <a href="${contextPath}/project/tBoard?userId=${user.userId}" class="nav-link">
		                  <i class="far fa-circle nav-icon"></i>
		                  <p>강사 게시판</p>
		                </a>
		              </li>
		              		         
		              <li class="nav-item">
		                <a href="${contextPath}/project/boardRegister?userId=${user.userId}" class="nav-link">
		                  <i class="far fa-circle nav-icon"></i>
		                  <p>게시글 작성하기</p>
		                </a>
		              </li>

		            </ul>
		          </li>
		          
		           <li class="nav-item menu-close">
          
                <a href="#" class="nav-link">
              <i class="nav-icon far fa-envelope"></i>
              <p>
                메일
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
               <a href="${contextPath}/project/mail?userId=${user.userId}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>수신</p>
                </a>
              </li>
         
                       <li class="nav-item">
           <a href="${contextPath}/project/send?userId=${user.userId}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>발신</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="${contextPath}/project/mailSend?userId=${user.userId}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>메일 보내기</p>
                </a>
              </li>
                    <li class="nav-item">
                <a href="${contextPath}/project/mailDel?userId=${user.userId}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>휴지통</p>
                </a>
              </li>
             
            </ul>
          </li>
				</c:if>
				
			

				</ul>
				
			</nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
</body>
</html>