<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>header</h3>
<br>
<c:set var="sessionName" value="${sessionScope.name}"></c:set>
<c:set var="sessionEmail" value="${sessionScope.email }"></c:set>
<c:set var="sessionGrade" value="${sessionScope.grade }"></c:set>
<c:choose> 
<c:when test="${sessionName!=null}">
	
	<c:set var="whatGrade" value="${sessionGrade}"></c:set>
	<c:choose>
		<c:when test="${whatGrade=='web_ses'}">
			<div>
				${sessionName}님이 로그인 했습니다. 
				|
				<a href="adminWebForm.do">관리자설정(사이트)</a> 
				|
				<a href="logout.do">로그아웃</a>
			</div>
		</c:when>
		<c:when test="${whatGrade=='com_ses'}">
			<div>
				${sessionName}님이 로그인 했습니다. 
				|
				<a href="#">관리자설정(회사)</a> 
				|
				<a href="logout.do">로그아웃</a>
			</div>
		</c:when>
		<c:when test="${whatGrade=='pro_ses'}">
			<div>
				${sessionName}님이 로그인 했습니다. 
				|
				<a href="#">관리자설정(프로젝트)</a> 
				|
				<a href="logout.do">로그아웃</a>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				${sessionName}님이 로그인 했습니다. | <a href="logout.do">로그아웃</a>
			</div>
		</c:otherwise>
	</c:choose>
</c:when>
<c:otherwise> 
	<div>
		<a href="memJoinForm.do">회원가입</a> | <a href="loginForm.do">로그인</a>
	</div>
</c:otherwise>
</c:choose>

<hr>
</body>
</html>