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
<h1>회사관리자페이지</h1>
	<form action="adminComUpdate.do">
		<table>
			<tr>
				<th>회사이름
				<input type="hidden" name="com_no" value="${comResult.com_no }" readonly="readonly">
				</th>
				<td><input type="text" name="com_name" value="${comResult.com_name }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>회사비밀번호</th>
				<td><input type="text" name="com_pwd" value="${comResult.com_pwd }"></td>
			</tr>
			<tr>
				<th>회사업종</th>
				<td><input type="text" name="com_sector" value="${comResult.com_sector }" readonly="readonly"></td>
			</tr>	
			<tr>
			<td colspan="2"><input type="submit" value="정보수정"></td>
			</tr>	
	
		</table>
	</form>
</div>		
</div>

</body>
</html>