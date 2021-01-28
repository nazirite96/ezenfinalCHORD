<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
 <h1>chord프로젝트 시작</h1>
 <div><a href="proList.do">기웅</a></div>
 <div><a href="taskTest.do">제진</a></div>
 <div>성탁</div>
 <div>일화</div>
 <div>충연</div>
 <c:forEach var="dto" items="${memberlist }">
 	<div>번호 : ${dto.idx }</div>
 	<div>아이디 : ${dto.id }</div>
 </c:forEach>
 
 
</body>
</html>