<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Home</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
</head>
<style>
img{
	/*filter: contrast(0.5);*/
}
img:hover{
	filter: drop-shadow(2px 4px 6px black); 
}
span{
	padding:50px;
}
.cover .btn-lg {
    padding: .75rem 1.25rem;
    font-weight: 700;
}
</style>
<script src="/chord/resources/js/jquery-3.1.1.min.js"></script>
<body class="text-center" style="background-color:#FCF6F5;">
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div>
		<main role="main" class="inner cover">
			<h1 class="cover-heading" style="padding-top:50px;">Welcom to CHORD</h1>
			<p style="padding-bottom:30px;">
			효과적인 팀워크, 가벼워진 업무 <br>
			목표달성을 위한 대한민국 NO.1 업무관리 협업툴<br>
			언제 어디서든 편리하게 사용하세요!
			</p>
			<div>
				<span><img alt="teamwork" src="resources/img/index/teamwork.png" width="200" height="200"></span>
				<span><img alt="task" src="resources/img/index/relax.png" width="225" height="225"></span>
				<span><img alt="planet" src="resources/img/index/planet.png" width="200" height="200"></span>
			</div>
			<p class="lead" style="padding:60px;">
				<a href="loginForm.do" class="btn btn-lg btn-secondary">Learn
					more</a>
			</p>
		</main>
		<footer class="mastfoot mt-auto"> 
		<hr>
		<div style="padding-bottom:40px; padding-top:20px;">Copyright ⓒ 2021 by CHORD All Rights Reserved</div>
		<!-- -------------------------------------------------------------------------------- -->
			<div>
				<a href="proList.do?mem_no=${sessionScope.memNo }">기웅</a>
			</div>
			<div>
				<a href="taskTest.do?mem_no=11">제진</a>
			</div>
			<div>
				<a href="files.do">성탁</a><a href="insertFiles.do">(파일 업로드)</a>
			</div>
			<div>
				<a href="fullCalender.do">성탁(일정 등록)</a>
			</div>
			<c:forEach var="dto" items="${memberlist }">
				<div>번호 : ${dto.idx }</div>
				<div>아이디 : ${dto.id }</div>
			</c:forEach>
		<!-- -------------------------------------------------------------------------------- -->		
		</footer>
	</div>


</body>
</html>