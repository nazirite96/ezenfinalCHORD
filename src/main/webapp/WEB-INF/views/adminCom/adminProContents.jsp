<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
</head>
<body>

	<main role="main" class="ml-3 mt-3">
		<form action="adminProDelete.do">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<c:forEach var="name" items="${name }">
					<h1 class="h4">
						[No.${name.PNO }] &nbsp; ${name.PNAME }
						<input type="hidden" name="pro_no" value="${name.PNO }" class="input_css">
						<input type="hidden" name="pro_name" value="${name.PNAME }" class="input_css">
					</h1>
				</c:forEach>
			</div>
			<div class="table-responsive">
				<table class="table table-hover">
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
								<td>해당 프로젝트 사용자 없습니다.</td>
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
							<td colspan="3" align="right"><input type="submit"
								value="삭제" class="btn btn-dark btn-sm"></td>
						</tr>
					</tfoot>
				</table>

			</div>
		</form>
	</main>

</body>
</html>