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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript">
	function show(comno,memno){
		window.open('adminMemContents.do?com_no='+comno+'&mem_no='+memno,'memlist','width=800,height=500,top=70,left=80');
	}
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="adminCom_firstDiv">
		<jsp:include page="/WEB-INF/views/adminCom/adminComLeftList.jsp" />
		<main role="main" class="ml-3 mt-3 col-lg-10">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">회사 멤버 관리 페이지</h1>
				</div>	
				<div class="table-responsive">	
					<table class="table table-striped table-sm">
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
									<td>해당 회사 회원이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="list" items="${memList }">
								<tr>
									<td><a href="javascript:show(${sessionScope.comNo },${list.MNO })">${list.MEMAIL }</a></td>
									<td>${list.MNAME }</td>
									<td>${list.GRA }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>
		</main>
	</div>

</body>
</html>





