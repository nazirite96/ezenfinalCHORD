<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4 align="center">이메일 중복확인</h4>
<form name="emailChk_fm" action="emailCheck.do" method="post">
	<table align="center">
		<tr>
			<td>email</td>
			<td><input type="email" name="chkEmail"></td>
			<td><input type="submit"  name="chkMailBt"  value="중복확인"></td>
		</tr>		
	</table>
</form>
</body>
</html>