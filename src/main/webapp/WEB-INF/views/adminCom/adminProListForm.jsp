<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#cntId{
		text-align:center;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="adminCom_firstDiv">
		<jsp:include page="/WEB-INF/views/adminCom/adminComLeftList.jsp" />
		<div class="adminCom_SecDiv">
			<h1>회사 프로젝트 관리</h1>
			<form action="">
				<table>
					<thead>
						<tr>
							<th>프로젝트 번호</th>
							<th>프로젝트 이름</th>
							<th>프로젝트 생성일</th>
							<th>참여자 수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty prolist}">
							<tr>
								<td>회원 없음!</td>
							</tr>
						</c:if>
						<c:forEach var="list" items="${prolist }">
							<tr>
								<td>${list.PNO }</td>
								<c:url var="proContentsUrl" value="adminProContents.do">
									<c:param name="pro_no">${list.PNO}</c:param>
								</c:url>
								<td><a href="${proContentsUrl }">${list.PNAME }</a></td>
								<td>${list.PDATE }</td>
								<td id="cntId">${list.CNT }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>