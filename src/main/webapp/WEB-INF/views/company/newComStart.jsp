<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.alert('${msg}');
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<form action="startChord.do" method=post>
	<input type="hidden" value="${getMemEmail}" name="mem_email">
	<input type="hidden" value="${getComName}" name="com_name">
	<input type="submit" value="시작하기">
</form>
</body>
</html>