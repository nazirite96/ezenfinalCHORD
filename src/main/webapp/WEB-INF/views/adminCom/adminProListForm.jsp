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
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style type="text/css">
#cntId {
	text-align: center;
}
</style>
<script type="text/javascript">
	function show(pro_no){
		window.open('adminProContents.do?pro_no='+pro_no,'proCon','width=800,height=500,top=70,left=80');	
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
					<h1 class="h2">프로젝트 관리</h1>
				</div>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
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
									<td id="noId">${list.PNO }</td>
									<c:url var="proContentsUrl" value="adminProContents.do">
										<c:param name="pro_no">${list.PNO}</c:param>
									</c:url>
									<td><a href="javascript:show(${list.PNO })">${list.PNAME }</a>
									</td>
									<td id="dateId">${list.PDATE }</td>
									<td id="cntId">${list.CNT }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			<!-- ***************************************************** -->	
		</main>
	</div>
</body>

</html>