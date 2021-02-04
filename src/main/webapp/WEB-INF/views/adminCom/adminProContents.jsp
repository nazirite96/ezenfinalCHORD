<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="adminCom_firstDiv">
		<jsp:include page="/WEB-INF/views/adminCom/adminComLeftList.jsp" />
		<div class="adminCom_SecDiv">
			<h1>회사 프로젝트 상세페이지</h1>
			<c:forEach var="name" items="${name }">
			<div>${name.PNO }번 프로젝트 명 :&nbsp;${name.PNAME }</div>
			</c:forEach>
			<form action="">
				<table>
					<thead>
						<tr>
							<th>이메일</th>
							<th>사용자명</th>
							<th>관리자</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty proContents}">
							<tr>
								<td>해당 프로젝트 사용자 없음~</td>
							</tr>
						</c:if>
						<c:forEach var="list" items="${proContents }">
							<tr>
								<td>${list.MEMAIL }</td>
								<td>${list.MNAME }</td>
								<td>${list.MANCHK }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td><input type="submit" value="삭제"></td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
</body>
</html>