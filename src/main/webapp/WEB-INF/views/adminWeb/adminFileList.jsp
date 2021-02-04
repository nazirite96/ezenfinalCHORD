<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
	border: solid 1px grey;
	border-spacing: 0px 0px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="adminWeb_firstDiv">
		<jsp:include page="/WEB-INF/views/adminWeb/adminWebLeftList.jsp" />
		<div class="adminWeb_SecDiv">
			<h1>웹사이트 관리자 페이지 입니다~</h1>
			<form>
				<table>
					<thead>
						<tr>
							<th>이메일</th>
							<th>이름</th>
							<th>파일 명</th>
							<th>파일 크기</th>
							<th>다운로드 시간</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty fileList }">
							<tr>
								<td colspan="5">다운 파일이 없습니다!</td>
							</tr>
						</c:if>
						<c:forEach var="list" items="${fileList }">
							<tr>
								<td id="">${list.MEMAIL}</td>
								<td id="">${list.MNAME }</td>
								<td id="">${list.FNAME }</td>
								<td id="">${list.FSIZE}</td>
								<td id="">${list.FDOWNDATE}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>