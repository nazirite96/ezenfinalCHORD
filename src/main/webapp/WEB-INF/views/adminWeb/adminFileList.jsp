<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="adminWeb_firstDiv">
		<jsp:include page="/WEB-INF/views/adminWeb/adminWebLeftList.jsp" />
		<main role="main" class="ml-3 mt-3 col-lg-10">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">파일 다운 이력</h1>
			</div>	
			<div class="table-responsive">	
				<table class="table table-striped table-sm">
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
								<td colspan="5" align="center">다운로드한 파일이 없습니다.</td>
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
			</div>
		</main>
	</div>
</body>
</html>