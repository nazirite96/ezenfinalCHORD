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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script type="text/javascript"> 
	google.charts.load('current', {'packages':['corechart']}); 
	google.charts.setOnLoadCallback(drawChart);

function drawChart() { 
	var data = new google.visualization.DataTable();
	data.addColumn('string','name');
	data.addColumn('number','count');
		

	data.addRows([
		${result}
	]);

	var options = { 
			'title': '접속 통계',
			pieSliceText: 'label',
			legend:'none'
			}; 
	var chart = new google.visualization.PieChart(document.getElementById('piechart')); 
	chart.draw(data, options); } 
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="adminWeb_firstDiv">
		<jsp:include page="/WEB-INF/views/adminWeb/adminWebLeftList.jsp" />
		<main role="main" class="ml-3 mt-3 col-lg-10">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">이용자 로그 이력</h1>
			</div>	
			<div id="piechart" style="width: 800px; height: 450px;"></div>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th>이메일</th>
							<th>이름</th>
							<th>회사번호</th>
							<th>누적 접속 수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty userLogList }">
							<tr>
								<td colspan="3">접속한 사용자가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="list" items="${userLogList }">
							<tr>
								<td id="mail">${list.MAIL}</td>
								<td id="name">${list.NAME }</td>
								<td id="conNo">${list.COMNO }</td>
								<td id="cnt">${list.CNT }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
	</div>
</body>
</html>