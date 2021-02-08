<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
			<div id="piechart" style="width: 600px; height: 300px;"></div>
			<form>
				<table>
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
			</form>
		</div>
	</div>
</body>
</html>