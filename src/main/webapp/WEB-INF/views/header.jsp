<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">
<title>HEADER</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/dashboard/">
	
<!--아이콘 -->
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>

<style type="text/css">
/* 네비바 */
.navbar-default{
	background-color: #7b9acc ;
}
/*[chord]*/
.navbar-default .navbar-nav > li > a {
    color : #FCF6F5; 
}
.navbar-default .navbar-brand:hover,
.navbar-default .navbar-brand:focus {
   	color: #5E5E5E;
}
.navbar-default .navbar-brand{
	color : #FCF6F5;
}
/*메뉴*/
.navbar-default .navbar-nav > li > a:hover,
.navbar-default .navbar-nav > li > a:focus {
    color: #5E5E5E;
}
.navbar-default .navbar-toggler .navbar-toggler-icon {
    border-color:#FCF6F5;
}
.navbar-default .navbar-toggler .navbar-toggler-icon:hover,
.navbar-default .navbar-toggler .navbar-toggler-icon:focus
{
    border-color:#FCF6F5; 
}
/*dropdown*/
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
.navbar-default .navbar-nav > .dropdown > a {
    border-top-color: #777;
    border-bottom-color: #777;
}
.navbar-default .navbar-nav > .dropdown > a:hover,
.navbar-default .navbar-nav > .dropdown > a:focus {
    border-top-color: #333;
    border-bottom-color: #333;
}
.navbar-default .navbar-nav > .open > a , 
.navbar-default .navbar-nav > .open > a:hover , 
.navbar-default .navbar-nav > .open > a:focus  {
    border-top-color: #555;
    border-bottom-color: #555;
}

</style>
</head>
<body>
	<c:set var="sessionMemNo" value="${sessionScope.memNo}"></c:set>
	<c:set var="sessionName" value="${sessionScope.name}"></c:set>
	<c:set var="sessionGrade" value="${sessionScope.grade }"></c:set>
	<c:set var="sessionComNo" value="${sessionScope.comNo }"></c:set>
	<c:choose>
		<c:when test="${sessionName!=null}">

			<c:set var="whatGrade" value="${sessionGrade}"></c:set>
			<c:choose>
				<c:when test="${whatGrade=='web_ses'}">
					<!-- 사이트 운영자 -->
					<nav class="navbar navbar-default navbar-expand-lg">
						<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3"
							href="index.do">[ CHORD ]</a>
						<button class="navbar-toggler" 
						  type="button" 
						  data-toggle="collapse" 
						  data-target="#navbarNavAltMarkup" 
						  aria-expanded="false" 
						  aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
						</button> 
						<input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
						<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
							<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
								<li class="nav-item nav-link text-nowrap">
								<a class="nav-link active">${sessionName}님 </a></li>
								<li class="nav-item nav-link text-nowrap">
								<a class="nav-link active"
									href="adminWebForm.do">사이트 운영자 관리</a></li>
								<li class="nav-item nav-link text-nowrap">
								<a class="nav-link active" href="logout.do">로그아웃</a></li>
							</ul>
						</div>
					</nav>
				</c:when>
				<c:when test="${whatGrade=='com_ses'}">
				<!-- 회사 관리자 -->
					<nav class="navbar navbar-default navbar-expand-lg">
						<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="index.do">[ CHORD ]</a>
						  <button class="navbar-toggler" 
						  type="button" 
						  data-toggle="collapse" 
						  data-target="#navbarNavAltMarkup" 
						  aria-expanded="false" 
						  aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
						  </button>
						<input 
						class="form-control mr-sm-2" 
						type="text" 
						placeholder="Search" 
						aria-label="Search">
						<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
							<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
								<li class="nav-item nav-link text-nowrap dropdown">
								<a class="nav-link" data-toggle="dropdown" href="#">
								<img alt="user" src="resources/img/header/user.png" width="27" height="27"></a>
									<div class="dropdown-menu">
										<c:url var="gomypageURL" value="goMyPage.do">
											<c:param name="mem_no">${sessionMemNo}</c:param>
										</c:url>										
										<a class="dropdown-item" href="${gomypageURL}">${sessionName}님</a>
									</div>
								</li>
								<li class="nav-item nav-link text-nowrap">
								<a class="nav-link" href="#"><img alt="chat" src="resources/img/header/chat.png" width="25" height="25"></a></li>
								<c:url var="comContentsUrl" value="adminCompanyForm.do">
									<c:param name="com_no">${sessionComNo}</c:param>
								</c:url>
								<li class="nav-item nav-link text-nowrap">
								<a class="nav-link" href="${comContentsUrl}">
								<img alt="admin" src="resources/img/header/admin.png" width="25" height="25"></a></li>
								<li class="nav-item nav-link text-nowrap">
								<a class="nav-link active" href="logout.do">
								<img alt="logout" src="resources/img/header/exit.png" width="25" height="25"></a></li>
							</ul>
						</div>
					</nav>
				</c:when>
				<c:otherwise>
				<nav class="navbar navbar-default navbar-expand-lg">
					<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="index.do">[ CHORD ]</a>
						  <button class="navbar-toggler" 
						  type="button" 
						  data-toggle="collapse" 
						  data-target="#navbarNavAltMarkup" 
						  aria-expanded="false" 
						  aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
						  </button>
						<input 
						class="form-control mr-sm-2" 
						type="text" 
						placeholder="Search" 
						aria-label="Search">
					<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
						<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
							<li class="nav-item nav-link text-nowrap dropdown">
								<a class="nav-link" data-toggle="dropdown" href="#">
								<img alt="user" src="resources/img/header/user.png" width="27" height="27"></a>
									<div class="dropdown-menu dorpdown-menu-left">
										<c:url var="gomypageURL" value="goMyPage.do">
											<c:param name="mem_no">${sessionMemNo}</c:param>
										</c:url>									
										<a class="dropdown-item" href="${gomypageURL}">${sessionName}님</a>
									</div>
								</li>
							<li class="nav-item nav-link text-nowrap">
								<a class="nav-link" href="#"><img src="resources/img/header/chat.png" width="25" height="25"></a></li>
							<li class="nav-item nav-link text-nowrap">
								<a class="nav-link active" href="logout.do">
								<img alt="logout" src="resources/img/header/exit.png" width="25" height="25"></a></li>
						</ul>
					</div>						
				</nav>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<nav class="navbar navbar-default navbar-expand-lg">
				<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="index.do">[ CHORD ]</a>
					<button class="navbar-toggler" 
						  type="button" 
						  data-toggle="collapse" 
						  data-target="#navbarNavAltMarkup" 
						  aria-expanded="false" 
						  aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
					</button>
				<div class="collapse navbar-collapse justify-content-between" id="navbarNavAltMarkup">
					<ul class="navbar-nav">
						<li class="nav-item nav-link text-nowrap ">
							<a class="nav-link float-right" href="memJoinForm.do">회원가입</a></li>
					 	<li class="nav-item nav-link text-nowrap ">
					 		<a class="nav-link float-right" href="loginForm.do">로그인</a></li>	
					</ul>
				</div>
			</nav>
		</c:otherwise>
	</c:choose>
</body>
</html>