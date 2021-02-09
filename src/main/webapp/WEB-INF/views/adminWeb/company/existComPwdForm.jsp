<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<form name="" action="exComPwd.do" method=post>
<table>
	<tr>
		<td colspan="2" align="left">회사 비밀번호 입력
		<input type="hidden" value="${emailData}" name="mem_email">
		</td>
	</tr>
	<tr>
		<td><input type="password" name="com_no" placeholder="앞자리" ></td>
		<td><input type="password" name="com_pwd" placeholder="뒷자리" ></td>
	</tr>
	<tr>
		<td colspan="2" align="right"><input type="submit" value="확인" ></td>
	</tr>
</table>
</form>
</body>
</html>