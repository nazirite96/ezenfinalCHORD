<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<script src="/chord/resources/js/jquery-3.1.1.min.js"></script>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<h1>
	Hello world!  
</h1>
<P>  The time on the server is ${serverTime}. </P>
 <h1>chord프로젝트 시작</h1>
 <div><a href="proList.do?mem_no=${sessionScope.memNo }">기웅</a></div>
 <div><a href="taskTest.do?mem_no=11">제진</a></div>
 <div><a href="files.do">성탁</a><a href="insertFiles.do">(파일 업로드)</a></div>
 <div><a href="fullCalender.do">성탁(일정 등록)</a></div>
 <div>일화</div>
 <div>충연</div>
 <c:forEach var="dto" items="${memberlist }">
 	<div>번호 : ${dto.idx }</div>
 	<div>아이디 : ${dto.id }</div>
 </c:forEach>
</body>
</html>