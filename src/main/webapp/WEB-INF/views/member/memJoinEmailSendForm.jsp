<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function memberJoin(){
		var form = document.realMemJoin_fm;
		form.submit();
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<form name="realMemJoin_fm" action="memJoin.do" method="post">
		<table>
			<tr>
				<td><input type="hidden" name="mem_name" value="${emailDto.mem_name}"></td>
				<td><input type="hidden" name="mem_pwd" value="${emailDto.mem_pwd}"></td>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td><input type="email" name="mem_email" placeholder="이메일" value="${emailDto.mem_email}"></td>
				<td><input type="submit" value="인증번호" formaction="memJoinEmailSend.do"></td>
			</tr>
			<tr>
				<td>인증번호 입력</td>
			</tr>
			<tr>
				<td><input type="text" name="checkNum" placeholder="인증번호"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" onclick="memberJoin()" value="회원가입"></td>
			</tr>
		</table>
	</form>
</body>
</html>