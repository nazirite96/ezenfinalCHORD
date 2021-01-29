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
	<form name="login" action="login.do">
		<table>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="mem_email" value="${cookie.saveEmail.value }" required="required"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="mem_pwd" required="required"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="checkbox" name="ckbx" value="on" ${empty cookie.saveEmail.value?'':'checked' }>이메일 기억하기
				<input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>