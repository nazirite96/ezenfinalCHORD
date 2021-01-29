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
<h1>회사 결정</h1>
<form name="" method="post">
<input type="hidden" value="${getEmail}" name="hiddenEmail">
<div><input type="submit" value="새 회사 설립" formaction="makeNewCompanyForm.do"></div>
<div><input type="submit" value="기존 회사 들어가기" formaction="exComPwdInputForm.do"></div>
</form>
</body>
</html>