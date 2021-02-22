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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="resources/js/httpRequest.js"></script>
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
	chart.draw(data, options); 
	} 
</script>
<script>
	/*요청 담당*/
	function show() {
		var mem_name = document.fm.mem_name.value;
		var params = 'mem_name=' + mem_name;
		sendRequest('adminSearchMem.do', params, showResult, 'GET');
	}

	/*응답을 담당*/
	function showResult() {

		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var ajaxMsg = XHR.responseText;
				
				ajaxMsg = eval('('+ajaxMsg+')');
				
				document.getElementById('idxInput').innerHTML=ajaxMsg.dto.mem_no;
				document.getElementById('mailInput').innerHTML=ajaxMsg.dto.mem_email;
				document.getElementById('nameInput').innerHTML=ajaxMsg.dto.mem_name;
				document.getElementById('phoneInput').innerHTML=ajaxMsg.dto.mem_phone;
				document.getElementById('posInput').innerHTML=ajaxMsg.dto.mem_position;
				document.getElementById('deptInput').innerHTML=ajaxMsg.dto.mem_dept;
					
			}
		}
	}
	
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
			<!-- 파이 차트 -->
			<div id="piechart" style="width: 800px; height: 450px;"></div>
			<!-- 검색창 -->
			<form name="fm" action="adminSearchMem.do">
				<!-- Button trigger modal -->
				<div class="input-group mb-3">
					<input type="text" name="mem_name" class="form-control"
						placeholder="이름을 입력해주세요"
						aria-label="username" aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button onclick="show()" class="btn btn-dark" data-toggle="modal" data-target="#exampleModal" type="button">&nbsp;검색하기&nbsp;</button>
					</div>
				</div>
			</form>			
			<!-- 리스트 -->
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

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">회원 상세 정보</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
						<table class="memJoin_css">
							<tr>
								<td><b>회원번호</b></td>
								<td id="idxInput"></td>
							</tr>
							<tr>
								<td><b>메일</b></td>
								<td id="mailInput"></td>
							</tr>
							<tr>
								<td><b>이름</b></td>
								<td id="nameInput"></td>
							</tr>
							<tr>
								<td><b>핸드폰 번호</b></td>
								<td id="phoneInput"></td>
							</tr>
							<tr>
								<td><b>직책</b></td>
								<td id="posInput"></td>
							</tr>
							<tr>
								<td><b>부서</b></td>
								<td id="deptInput"></td>
							</tr>
						</table>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>				
		</main>
	</div>
</body>
</html>