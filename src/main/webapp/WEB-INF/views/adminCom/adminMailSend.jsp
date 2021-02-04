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

<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="adminCom_firstDiv">
<jsp:include page="/WEB-INF/views/adminCom/adminComLeftList.jsp"/>
	<div class="adminCom_SecDiv">
		<h1>회원 초대하기</h1>
		<form name="mailSend" action="adminMailSend.do" method="post"> 
			<table>
				<tr>
					<td>보낼 메일 주소</td>
					<td><input type="hidden" name="com_no" value="${com_no }"></td>
					<td><input type="hidden" name="com_pwd" value="${com_pwd }"></td>
				</tr>
				<tr>
					<td><input type="text" name="receiveMail"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="보내기"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>