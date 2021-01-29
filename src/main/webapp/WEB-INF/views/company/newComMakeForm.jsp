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
	<form name="" action="makeNewCompany.do" method=post>
		<table>
			<tr>
				<td>회사명
					<input type="hidden" value="${hiddenEmail}" name="mem_email">
				</td>
			</tr>
			<tr>
				<td><input type="text" name="com_name" placeholder="회사명"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
			</tr>
			<tr>
				<td><input type="password" name="com_pwd" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td>업종</td>
			</tr>
			<tr>
				<td><input type="text" name="com_sector" placeholder="업종 입력"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="회사 설립"></td>
			</tr>
		</table>
	</form>	
</body>
</html>