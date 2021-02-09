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
			<h1>회사 멤버 관리 페이지</h1>
			<form action="">
				<table>
					<thead>
						<tr>
							<th>이메일</th>
							<th>이름</th>
							<th>관리자</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty memList}">
							<tr>
								<td>회원 없음!</td>
							</tr>
						</c:if>
						<c:forEach var="list" items="${memList }">
							<tr>
								<!-- <a href="adminMemContents.do?com_no=${sessionScope.comNo }&mem_no=${list.MNO}"> -->
								<td><a href="adminMemContents.do?com_no=${sessionScope.comNo }&mem_no=${list.MNO}">${list.MEMAIL }</a></td>
								<td>${list.MNAME }</td>
								<td>${list.GRA }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>

</body>
</html>





